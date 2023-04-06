var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "project_2"
  });//databse connection
  
  router.get('/', async (req, res, next)=> {
    let html_data = [];
    let row_data = [];
     con.query('SELECT * FROM ingre_category', (err, results) => {
      if (err) throw err;
      results.forEach(row => {
          row_data = {
          id: row.id,
          category: row.category,
        };
        html_data.push(row_data);
      });
      res.render('dashboard', { html_data });
    });
  });
  
  router.get('/add-category',(req,res)=>{
    res.render('add-category')
  })

  router.post('/add-category',(req,res)=>{
    let sql= 'INSERT INTO `ingre_category`(`category`) VALUES (?)'
    let category = req.body.category
    con.query(sql,[category],(err,results)=>{
      res.redirect('/')
    })
  })
  
  router.get('/logout', (req, res) => {
    res.cookie('loggedIn', null, { expires: new Date(0) });
    res.redirect('/login');
  });


module.exports = router