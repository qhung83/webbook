var express = require('express');
var cartRepo = require('../repos/cartRepo'),
 productRepo = require('../repos/productRepo'),
 orderRepo = require('../repos/orderRepo');
var router = express.Router();

router.get('/', (req, res) => {  // đoạn này là giỏ hàng
	var arr_p = [];
	for (var i = 0; i < req.session.cart.length; i++) {
        var cartItem = req.session.cart[i];
		var p = productRepo.single(cartItem.ProId);
        arr_p.push(p);
    }

	var items = [];
	Promise.all(arr_p).then(result => {
		var sum = 0;	
		for (var i = result.length - 1; i >= 0; i--) {
		var pro = result[i];
		var item = {
				Product: pro,
				Quantity: req.session.cart[i].Quantity,
				Amount: pro.Price,
				Available: pro.Quantity-pro.Sold,
				// lấy ra các id sản phẩm, số lượng sp, giá
			};
			items.push(item); // sau đó đưa vào một mảng
			sum += req.session.cart[i].Quantity * pro.Price; // lấy ra tổng tiền hóa đơn
			//Name=pro.ProName;
		}

		var vm = {
			items: items, //lấy được thông tin các sản phẩm tương ứng trong mảng
			sum: sum, // lấy đc tổng tiền hóa đơn
			//Name: Name,
		};
		res.render('checkout/cart', vm);
	});
});
    
router.post('/add', (req, res) => { // đoạn này là khi khách hàng bấm vào nút thêm sản phẩm để thêm sản phẩm vào giỏ hàng
	var item = {
		ProId: req.body.proID, //lấy được id sản phẩm
		Quantity: +req.body.quantity // lấy đc số lượng sản phẩm đó
	};
	cartRepo.add(req.session.cart, item);// sau đó gọi hàm add để thêm vào giỏ hàng
	res.redirect('/checkout');
});
router.post('/addOne', (req, res) => { // đoạn này là khi khách hàng bấm vào nút "+" để tăng số lượng sản phẩm
	var item = {
		ProId: req.body.proID,//lấy id sp
		Quantity: +1 //mỗi lần bấm dấu "+" thì sẽ tăng số lượng sản phẩm lên 1
	};
	cartRepo.add(req.session.cart, item); // sau đó thêm vào giỏ hàng
	res.redirect('/checkout');
});
router.post('/subOne', (req, res) => {
	var item = {
		ProId: req.body.proID, // lấy id sản phẩm
		Quantity: -1  //mỗi lần bấm dấu "-" thì sẽ giảm số lượng sản phẩm xuống 1
};
	cartRepo.add(req.session.cart, item);
	res.redirect('/checkout');
});
router.post('/remove', (req, res) => {
	cartRepo.remove(req.session.cart, req.body.ProId);
	res.redirect(req.headers.referer);
});
// đoạn này khi khách hàng bấm nút xóa sản phẩm thì tiến hành xóa sản phẩm tương ứng khỏi giỏ hàng
router.get('/order', (req, res) => {
	res.render('checkout/order');
}); // khi khách hàng bấm thanh toán tiến hành view trang thanh toán

router.post('/billpay', (req, res) => {  // khi khách hàng bấm thanh toán hóa đơn thì tiến hành lấy các thông tin checkout của khách hàng và thanh toán
    var bill = {
		userID:req.session.user.f_ID,
        namekhachhang: req.session.user.f_Name,
        email: req.session.user.f_Email,
        address: req.body.address,
        phone: req.body.phone,
        total: req.body.sum,
		name: req.body.name,
		nametaikhoan:req.body.nametaikhoan,
	}
    var arr_p = [];
    var itemsquanti = [];
   
    for (let i = 0; i < req.session.cart.length; i++) {
        var quan = req.session.cart[i].Quantity;
		itemsquanti.push(quan);
		var p = productRepo.single(req.session.cart[i].ProId);
        arr_p.push(p);
	}

    orderRepo.addbill(bill).then(row => { // đoạn này là để thêm thông tin mua hàng của khách vào bảng hóa đơn
		orderRepo.getIDBill(bill.userID).then(row => {
			var billid = row[row.length - 1].ID;
			Promise.all(arr_p).then(result => {
				for (var i = result.length - 1; i >= 0; i--) {
					var pro = result[i];
					var detail = {
						orderId: billid,
						proId: pro.ProID,
						avai:pro.Quantity-itemsquanti[i],
						soldup:pro.Sold+itemsquanti[i],
						proName: pro.ProName,
						quantity: itemsquanti[i],
						price: pro.Price,
						sum: pro.Price * itemsquanti[i]
					}
					console.log(detail.avai);
					orderRepo.addbilldetail(detail);
					orderRepo.upquantity(detail);
					//orderRepo.upsold(detail);
				}
			});
        });
	});


    orderRepo.removeall(req.session.cart); // đoạn này khi khách hàng bấm xóa hết sản phẩm thì tiến hành xóa toàn bộ sản phẩm khỏi giỏ hàng
   // res.redirect('/account/history');
	res.redirect('/account/camon');// sau khi mua hàng thành công thì link về trang cảm ơn
});
module.exports = router;