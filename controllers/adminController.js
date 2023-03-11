var express = require('express');
//var productRepo = require('../repos/productRepo');
var categoryRepo = require('../repos/categoryRepo');
var brandRepo = require('../repos/brandRepo');
var SanphamRepo = require('../repos/SanphamRepo');
var HoadonRepo = require('../repos/HoadonRepo');
var AdminRepo = require('../repos/AdminRepo');
var ChitietsanphamRepo = require('../repos/ChitietsanphamRepo');
// các biến ở trên để truy cập đến các file repos
// các file repos này để xử lý đến các lệnh truy vấn sql tương ứng đến từng tên file
var router = express.Router();
var restrict = require('../middle-wares/restrict');


router.get('/', restrict, (req, res) => {
    if (req.session.user.f_Permission ==="khachhang" ) { // đoạn này kiểm tra xem nếu đăng nhập tài khoản có quyền khác khách hàng thì sẽ truy cập đến file quản trị website
        res.redirect('/error/index');
    }
    else {
        
        var rowCountBrand = brandRepo.count(); // đếm số lượng thương hiệu
        var rowCountCategory = categoryRepo.count(); // đếm số lượng nhóm sản phẩm
        var rowCountProduct = SanphamRepo.count(); // đếm số lượng sản phẩm
        var rowCountHoadon = HoadonRepo.count(); // đếm số lượng hóa đơn
        var rowCountAdmin = AdminRepo.count(); // đếm số lượng tài khoản 
        var rowCountChitietsanpham = ChitietsanphamRepo.count(); // đếm số lượng chi tiết sản phẩm
        // mấy biến trên để tiến hành đếm số lượng có trong bảng tương ứng với tên của nó
        Promise.all([rowCountProduct,rowCountBrand,rowCountCategory,rowCountHoadon,rowCountAdmin,rowCountChitietsanpham]).then(([rowProduct, rowBrand, rowCategory,rowHoadon, rowAdmin,rowChitietsanpham]) => {
            var vm = {
                layout: 'admin.handlebars',
                countProduct: rowProduct[0].soluong,
                countBrand: rowBrand[0].soluongth,
                countCategory: rowCategory[0].soluongtl,
                countHoadon: rowHoadon[0].soluonghd,
                countAdmin: rowAdmin[0].soluongad,
                countChitietsanpham: rowChitietsanpham[0].soluongctsp,
            }
            res.render('admin/index', vm); // view đến giao diện chính trang quản trị website
        }); 
    }
})

router.get('/category', restrict, (req, res) => {
        categoryRepo.loadAll().then(rows => {  // gọi hàm loadAll để view ra tất cả nhóm sản phẩm trong csdl
            var vm = {
                layout: 'admin.handlebars',
                categories: rows
            };
            res.render('admin/category/index', vm);
        });
    });
// đoạn này khi khách hàng bấm vào nhóm sản phẩm thì trang web sẽ view ra giao diện trang category 
    router.get('/category/edit', restrict, (req, res) => {
        categoryRepo.single(req.query.id).then(c => {
            var vm = {
                Category: c,
                layout: 'admin.handlebars',
            };
            res.render('admin/category/edit', vm);
        });
    });
// đoạn này khi khách hàng bấm vào sửa nhóm sản phẩm thì trang web sẽ view ra giao diện trang sửa nhóm sản phẩm
    router.post('/category/edit', restrict, (req, res) => {
        categoryRepo.update(req.body).then(value => { // gọi hàm update để tiến hành cập nhật thông tin nhóm sản phẩm
            res.redirect('/admin/category');
        });
    });
    // đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành sửa nhóm sản phẩm
    router.get('/category/delete', restrict, (req, res) => {
        var vm = {
            layout: 'admin.handlebars',
            CatId: req.query.id
        }
        res.render('admin/category/delete', vm);
    });
    // đoạn này khi khách hàng bấm vào xóa nhóm sản phẩm thì trang web sẽ view ra giao diện trang xóa nhóm sản phẩm
    router.post('/category/delete', restrict, (req, res) => {
        categoryRepo.delete(req.body.CatId).then(value => { // gọi hàm delete để tiến hành xóa nhóm sản phẩm
            res.redirect('/admin/category');
        });
    });
    // đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa nhóm sản phẩm
    router.get('/category/add', restrict, (req, res) => {
        var vm = {
            layout: 'admin.handlebars',
            showAlert: false
        }
        res.render('admin/category/add', vm);
    });
    // đoạn này khi khách hàng bấm vào nút thêm thì trang web sẽ view ra giao diện trang thêm nhóm sản phẩm
    router.post('/category/add', restrict, (req, res) => {
        console.log(req.body);
        categoryRepo.add(req.body).then(value => { // gọi hàm add để tiến hành thêm nhóm sản phẩm
            var vm = {
                layout: 'admin.handlebars',
                showAlert: true
            };
            res.render('admin/category/add', vm);
        }).catch(err => {
            res.end('fail');
        });
    });
 // đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành thêm nhóm sản phẩm



router.get('/brand', restrict, (req, res) => {
    brandRepo.loadAll().then(rows => {
        var vm = {
            layout: 'admin.handlebars',
            brands: rows
        };
        res.render('admin/brand/index', vm);
    });
});
// đoạn này là khi admin nhấn vào thương hiệu thì sẽ tiến hành view ra trang thương hiệu
router.get('/brand/edit', restrict, (req, res) => {
    brandRepo.single(req.query.id).then(b => {
        var vm = {
            Brand: b,
            layout: 'admin.handlebars',
        };
        res.render('admin/brand/edit', vm);
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành view ra trang sửa thương hiệu
router.post('/brand/edit', restrict, (req, res) => {
    console.log(req.body);
    brandRepo.update(req.body).then(value => { // gọi hàm update để sửa thương hiệu
        res.redirect('/admin/brand');
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành sửa thương hiệu

router.get('/brand/delete', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        BrandID: req.query.id
    }
    res.render('admin/brand/delete', vm);
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành view ra trang xóa thương hiệu
router.post('/brand/delete', restrict, (req, res) => {
    brandRepo.delete(req.body.BrandID).then(value => {// gọi hàm delete để xóa thương hiệu
        res.redirect('/admin/brand');
    });
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa thương hiệu
router.get('/brand/add', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        showAlert: false
    }
    res.render('admin/brand/add', vm);
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành view ra trang thêm thương hiệu
router.post('/brand/add', restrict, (req, res) => {
    brandRepo.add(req.body).then(value => {
        var vm = {
            layout: 'admin.handlebars',
            showAlert: true
        };
        res.render('admin/brand/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành thêm thương hiệu




router.get('/sanpham', restrict, (req, res) => {
    SanphamRepo.loadAll().then(rows => { // gọi hàm loadAll để view ra tất cả sản phẩm trong csdl
        var vm = {
            layout: 'admin.handlebars',
            products: rows
        };
        res.render('admin/sanpham/index', vm);
    });
});
// đoạn này là khi admin nhấn vào trang sản phẩm thì sẽ tiến hành view ra trang sản phẩm
router.get('/sanpham/edit', restrict, (req, res) => {
    SanphamRepo.single(req.query.id).then(s => {
        var vm = {
            Sanpham: s,
            layout: 'admin.handlebars',
        };
        res.render('admin/sanpham/edit', vm);
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành view ra trang sửa sản phẩm
router.post('/sanpham/edit', restrict, (req, res) => {
    console.log(req.body);
    SanphamRepo.update(req.body).then(value => {
        res.redirect('/admin/sanpham');
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành sửa sản phẩm

router.get('/sanpham/delete', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        ProID: req.query.id
    }
    res.render('admin/sanpham/delete', vm);
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành view ra trang xóa sản phẩm
router.post('/sanpham/delete', restrict, (req, res) => {
    SanphamRepo.delete(req.body.ProID).then(value => {
        res.redirect('/admin/sanpham');
    });
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa sản phẩm
router.get('/sanpham/add', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        showAlert: false
    }
    res.render('admin/sanpham/add', vm);
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành view ra trang thêm sản phẩm
router.post('/sanpham/add', restrict, (req, res) => {
    SanphamRepo.add(req.body).then(value => {
        var vm = {
            layout: 'admin.handlebars',
            showAlert: true
        };
        res.render('admin/sanpham/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});
// đoạn này là khi admin nhấn vào nút thê thì sẽ tiến hành thêm sản phẩm
router.get('/hoadon', restrict, (req, res) => {
    HoadonRepo.loadAll().then(rows => {
        var vm = {
            layout: 'admin.handlebars',
            orders: rows
        };
        res.render('admin/hoadon/index', vm);
    });
});
// đoạn này là khi admin nhấn vào trang hóa đơn thì sẽ tiến hành view ra trang hóa đơn
router.get('/hoadon/chitiethoadon', restrict, (req, res) => {
   var OrderID=req.query.id;
     HoadonRepo.loadAllchitiet(OrderID).then(rows => {
        var vm = {
            layout: 'admin.handlebars',
            orderdetails: rows,
           // OrderID: req.query.id,
        };
        res.render('admin/hoadon/chitiethoadon', vm);
     });
});
// đoạn này là khi admin nhấn vào chi tiết hóa đơn thì sẽ tiến hành view ra trang chi tiết hóa đơn

router.get('/hoadon/edit', restrict, (req, res) => {
    HoadonRepo.single(req.query.id).then(h => {
        var vm = {
            Hoadon: h,
            layout: 'admin.handlebars',
        };
        res.render('admin/hoadon/edit', vm);
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành view ra trang sửa hóa đơn
router.post('/hoadon/edit', restrict, (req, res) => {
    console.log(req.body);
    HoadonRepo.update(req.body).then(value => {
        res.redirect('/admin/hoadon');
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành sửa hóa đơn
router.get('/hoadon/delete', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        OrderID: req.query.id,
    }
    res.render('admin/hoadon/delete', vm);
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành view ra trang xóa hóa đơn
router.post('/hoadon/delete', restrict, (req, res) => {
    HoadonRepo.delete(req.body.OrderID).then(value => {
        res.redirect('/admin/hoadon');
    });
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa hóa đơn


    // router.get('/hoadon/chitiethoadon', restrict, (req, res) => {
    //     HoadonRepo.single1(req.query.id).then(h => {
    //         var vm = {
    //             Hoadon: h,
    //             layout: 'admin.handlebars',
    //         };
    //         res.render('admin/hoadon/chitiethoadon', vm);
    //     });
    // });
   
   



router.get('/admin', restrict, (req, res) => {
    AdminRepo.loadAll().then(rows => {
        var vm = {
            layout: 'admin.handlebars',
            users: rows
        };
        res.render('admin/admin/index', vm);
    });
});
// đoạn này là khi admin nhấn vào trang admin thì sẽ tiến hành view ra trang tài khoản
router.get('/admin/edit', restrict, (req, res) => {
    AdminRepo.single(req.query.id).then(a => {
        var vm = {
            Admin: a,
            layout: 'admin.handlebars',
        };
        res.render('admin/admin/edit', vm);
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành view ra trang sửa tài khoản
router.post('/admin/edit', restrict, (req, res) => {
    console.log(req.body);
    AdminRepo.update(req.body).then(value => {
        res.redirect('/admin/admin');
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành sửa tài khoản

router.get('/admin/delete', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        ProID: req.query.id
    }
    res.render('admin/admin/delete', vm);
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành view ra trang xóa tài khoản
router.post('/admin/delete', restrict, (req, res) => {
    AdminRepo.delete(req.body.ProID).then(value => {
        res.redirect('/admin/admin');
    });
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa tài khoản
router.get('/admin/add', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        showAlert: false
    }
    res.render('admin/admin/add', vm);
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành view ra trang thêm tài khoản
router.post('/admin/add', restrict, (req, res) => {
    AdminRepo.add(req.body).then(value => {
        var vm = {
            layout: 'admin.handlebars',
            showAlert: true
        };
        res.render('admin/admin/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành thêm tài khoản





router.get('/chitietsanpham', restrict, (req, res) => {
    ChitietsanphamRepo.loadAll().then(rows => {
        var vm = {
            layout: 'admin.handlebars',
            details: rows
        };
        res.render('admin/chitietsanpham/index', vm);
    });
});
// đoạn này là khi admin nhấn vào trang chi tiết sản phẩm thì sẽ tiến hành view ra trang chi tiết sản phẩm
router.get('/chitietsanpham/edit', restrict, (req, res) => {
    ChitietsanphamRepo.single(req.query.id).then(d => {
        var vm = {
            Chitietsanpham: d,
            layout: 'admin.handlebars',
        };
        res.render('admin/chitietsanpham/edit', vm);
    });
});
// đoạn này là khi admin nhấn vào nút sửa thì sẽ tiến hành view ra trang sửa chi tiết sản phẩm
router.post('/chitietsanpham/edit', restrict, (req, res) => {
    console.log(req.body);
    ChitietsanphamRepo.update(req.body).then(value => {
        res.redirect('/admin/chitietsanpham');
    });
});
// đoạn này là khi admin nhấn vào nút sủa thì sẽ tiến hành sửa chi tiết sản phẩm

router.get('/chitietsanpham/delete', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        DetailID: req.query.id
    }
    res.render('admin/chitietsanpham/delete', vm);
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành view ra trang xóa chi tiết sản phẩm
router.post('/chitietsanpham/delete', restrict, (req, res) => {
    ChitietsanphamRepo.delete(req.body.DetailID).then(value => {
        res.redirect('/admin/chitietsanpham');
    });
});
// đoạn này là khi admin nhấn vào nút xóa thì sẽ tiến hành xóa chi tiết sản phẩm
router.get('/chitietsanpham/add', restrict, (req, res) => {
    var vm = {
        layout: 'admin.handlebars',
        showAlert: false
    }
    res.render('admin/chitietsanpham/add', vm);
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành view ra trang thêm chi tiết sản phẩm
router.post('/chitietsanpham/add', restrict, (req, res) => {
    ChitietsanphamRepo.add(req.body).then(value => {
        var vm = {
            layout: 'admin.handlebars',
            showAlert: true
        };
        res.render('admin/chitietsanpham/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});
// đoạn này là khi admin nhấn vào nút thêm thì sẽ tiến hành thêm chi tiết sản phẩm
module.exports = router;
