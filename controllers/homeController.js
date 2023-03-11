var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var productRepo = require('../repos/productRepo');
var config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {
    var newest = productRepo.loadByNewestOption(config.LIMIT_OPTION);
    var viewer = productRepo.loadByViewOption(config.LIMIT_OPTION);
    var sold = productRepo.loadBySoldOption(config.LIMIT_OPTION);
    Promise.all([newest, viewer, sold]).then(([newestRows, viewerRows, soldRows]) => {
        var vm = {
            newestProducts: newestRows,
            viewerProducts: viewerRows,
            soldProducts: soldRows,
        };  
        res.render('home/index', vm);
    });
});
// đoạn này mặc định hiển thị về trang home
router.get('/products', (req, res) => {
    
    var hienthi = productRepo.loadAll();
    Promise.all([hienthi]).then(([hienthiRows]) => {
        var vm = {
           
            hienthiProducts: hienthiRows,
        };  
        res.render('home/products', vm);
    });
});
// view ra trang products
router.get('/about', (req, res) => {
    res.render('home/about');
});
// view ra trang about
router.get('/contact', (req, res) => {
    res.render('home/contact');
});
// view ra trang contact
// router.get('/products', (req, res) => {
//     res.render('home/products');
// });

module.exports = router;