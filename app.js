const ejs = require('ejs');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const session = require('express-session');


const loginRouter = require('./routes/login');
const dashboardRouter = require('./routes/dashboard')
const itemRouter = require('./routes/items')


const app = express();

// middleware to check if user is authenticated
const authUser = (req, res, next) => {
  if (req.session && req.session.authenticated) {
    next();
  } else {
    res.redirect('/login');
  }
};

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('html', ejs.renderFile);
app.set('view engine', 'html');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use(session({
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false, 
            //maxAge: 3600000
           },
}));



app.use('/login', loginRouter);
app.use('/',authUser, dashboardRouter);
app.use('/items',authUser, itemRouter)


module.exports = app;

app.listen(9000);
