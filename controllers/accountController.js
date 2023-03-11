var express = require('express'),
    SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var accountRepo = require('../repos/accountRepo'),
    orderRepo = require('../repos/orderRepo'),
    orderdetailsRepo = require('../repos/orderdetailsRepo');

var restrict = require('../middle-wares/restrict');

var router = express.Router();

router.get('/camon', (req, res) => {
    res.render('account/camon');
});



router.get('/register', (req, res) => {
    res.render('account/register');
});
// đoạn này khi khách hàng bấm vào đk tài khoản thì trang web sẽ view ra giao diện trang register
router.post('/register', (req, res) => {

    var dob = moment(req.body.dob, 'D/M/YYYY')
         .format('YYYY-MM-DDTHH:mm');
   
    var user = {
        username: req.body.username,
       // password: SHA256(req.body.rawPWD).toString(),
        password: (req.body.rawPWD).toString(),
        name: req.body.name,
        email: req.body.email,
        dob: dob,
        
      // permission: req.body.permission,
    };
// đoạn này là khi khách hàng bấm đăng ký tài khoàn thì sẽ tiến hành req các thông tin khách hàng nhập vào
    accountRepo.addd(user).then(value => {
        var vm = {
                showError: true,
                errorMsg: 'Bạn đã đăng ký tài khoản thành công. Vui lòng đăng nhập.'
            };
        res.render('account/register',vm);
    });
});  // sau đó tiến hành thêm thông tin tài khoản khách hàng vừa đăng ký vào trong csdl

router.get('/login', (req, res) => {
    res.render('account/login');
});
// đoạn này khi khách hàng bấm vào login tài khoản thì trang web sẽ view ra giao diện trang login
router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        //password: SHA256(req.body.rawPWD).toString()
        password:(req.body.rawPWD).toString()
    }; // đoạn này là tiến hành lấy các thông tin đăng nhập của khách hàng

    accountRepo.login(user).then(rows => {   // sau đó tiến hành kiểm tra thông tin tài khoản của kh nhập vào có tồn tại trong csdl hay không
        if (rows.length > 0) {
            if (rows[0].f_Permission === "khachhang") { // đoạn này để phân quyền giữa tài khoản khách hàng và tài khoản admin
                req.session.isLogged = true;
                req.session.user = rows[0];
                req.session.cart = [];
    
                var url = '/';
                if (req.query.retUrl) {
                    url = req.query.retUrl;
                }
                res.redirect(url);
            }
            else {
                req.session.isLogged = true;
                req.session.user = rows[0];
                req.session.cart = [];
                res.redirect('/admin');
            }

            } else {
                var vm = {
                    showError: true,
                    errorMsg: 'Đăng nhập thất bại'
                };
                res.render('account/login', vm);
            }
    });
});


router.get('/profile', (req, res) => {
    res.render('account/profile');
});
// đoạn này khi khách hàng bấm vào xem thông tin tài khoản của mình thì trang web sẽ view ra giao diện trang profile
router.post('/profile', (req, res) => {

    var dob = moment(req.body.dob, 'D/M/YYYY')
        .format('YYYY-MM-DD');

    var password = req.session.user.f_Password;
    if (req.body.new_password != ""){
        //password = SHA256(req.body.new_password).toString()
        password =(req.body.new_password).toString()
    }
    var user = {
        id:req.body.id,
        name: req.body.name,
        password: password,
        email: req.body.email,
        dob: dob,
        permission: 0,
    }; // đoạn này là req lại thông tin khách hàng vừa nhập khi muốn sửa thông tin tài khoản

    accountRepo.update(user).then(value => { // sau đó gọi hàm update để cập nhật lại thông tin tài khoản trên csdl
        var vm = {
                showError: true,
                errorMsg: 'Thay đổi thông tin thành công'
            };

        req.session.user.f_Name = user.name;
        req.session.user.f_Password = user.password;
        req.session.user.f_Email = user.email;
        req.session.user.f_DOB = user.dob
        res.redirect('/account/profile');
    });
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.cart = [];
    res.redirect('/');
});
// đoạn này khi khách hàng bấm vào logout tài khoản thì trang web sẽ hủy đi các session

router.get('/history', restrict, (req, res) => {
    var hs= req.session.user.f_ID;
    orderdetailsRepo.loadAll(hs).then(rows => {
         var vm = {
             //layout: 'admin.handlebars',
             orders: rows,
            // OrderID: req.query.id,
         };
         res.render('account/history', vm);
      });
 });


 router.get('/chitiethoadon', restrict, (req, res) => {
    var OrderID=req.query.id; //lấy ra được id của hóa đơn
    orderdetailsRepo.loadAllchitiet(OrderID).then(rows => { //gọi hàm loadAllchitiet để view tất cả thông tin hóa đơn tương ứng với id
         var vm = {
            // layout: 'admin.handlebars',
             orderdetails: rows,
            // OrderID: req.query.id,
         };
         res.render('account/chitiethoadon', vm);
      });
 });
// đoạn này khi khách hàng bấm vào xem chi tiết hóa đơn thì trang web sẽ view ra giao diện trang chi tiết hóa đơn
module.exports = router;