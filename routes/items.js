var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "project_2"
  });//databse connection

  router.get('/:id', async (req, res) => {
    let ingre_category = req.params.id
    let sql = 'SELECT * FROM ingre_list WHERE ingre_category=?'
    let html_data = [] // Initialize as an empty array
    let row_data = {}
    con.query(sql, [ingre_category], (err, results) => {
        results.forEach(row => {
            row_data = {
                id: row.id,
                category: row.ingre_category,
                ingredient: row.ingredient,
                cost: row.cost,
                qty: row.qty
            }
            html_data.push(row_data)
        });
        res.render('items', { html_data })
    })
})

router.get('/add-items/:id', async (req,res)=>{
    id = req.params.id
    res.render('add-items',{id})
})

router.post('/', async (req,res)=>{
    const {category,ingredient,qty,cost} = req.body

    let sql = 'INSERT INTO `ingre_list`(`ingre_category`, `ingredient`, `cost`, `qty`) VALUES (?,?,?,?)'

    con.query(sql,[category,ingredient,qty,cost],async (err,results)=>{
        res.redirect('/dashboard')
    })
})



  module.exports = router