var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from orders';
    return db.load(sql);
}



exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from orders where OrderID = ${id}`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            }
            else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}

exports.single1 = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from orderdetails where OrderID = ${id}`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            }
            else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}

exports.loadAllchitiet = (id) => {
    var sql = `select * from orderdetails where OrderID = ${id}`;
    return db.save(sql);
}




exports.add = (s) => {
    var sql = `insert into products(ProName,Price,images,CatID,BrandID) values('${s.ProName}','${s.Price}','${s.images}','${s.CatID}','${s.BrandID}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from orders where OrderID = ${id}`;
    return db.save(sql);
}


exports.update = (h) => {
    var sql = `update orders set Trangthai = '${h.Trangthai}' where OrderID = ${h.OrderID}`;
    return db.save(sql);
}

exports.count = () => {
    var sql = "select count(*) as soluonghd from orders";
    return db.load(sql);
}