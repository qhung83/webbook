var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');
var wnumb = require('wnumb');
//Đoạn này để khai báo các thư viện cần thiết
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);

var handleLayoutMDW = require('./middle-wares/handleLayout'),
    handle404MDW = require('./middle-wares/handle404');
restrict = require('./middle-wares/restrict')

var homeController = require('./controllers/homeController'), //liên kết đến file xử lý trang chủ website
    productController = require('./controllers/productController'),  //liên kết đến file xử lý trang sản phẩm của website
    accountController = require('./controllers/accountController'), //liên kết đến file xử lý xử lý trang tài khoản website
    searchController = require('./controllers/searchController'), //liên kết đến file xử lý trang tìm kiếm của website
    adminController = require('./controllers/adminController'), //liên kết đến file xử lý trang quản trị web admin của website
    checkoutController = require('./controllers/checkoutController') //liên kết đến file xử lý thanh toán đơn hàng của website
//Đoạn này khai báo các biến truy cập đến các file xử lý của web
var app = express();

app.engine('hbs', exphbs({
    defaultLayout: 'main',   // set giao diện web mặc định khi vào web là trang main
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        }
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

var sessionStore = new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'db_banhang',
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));

app.use(handleLayoutMDW);

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use('/home', homeController);
app.use('/product', productController);
app.use('/account', accountController);
app.use('/search', searchController);
app.use('/checkout', checkoutController);
app.use('/admin', adminController);

app.use(handle404MDW);

app.listen(8000, () => {
    console.log('Web đã chạy ở cổng 8000');
});