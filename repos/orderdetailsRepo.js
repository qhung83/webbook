var db = require('../fn/db');

exports.loadAll = (hs) => {
    var sql = `select * from orders where UserID= ${hs}`;
    return db.load(sql);
}

exports.loadAllchitiet = (id) => {
    var sql = `select * from orderdetails where OrderID= ${id}`;
    return db.load(sql);
}



exports.single = (detailsId) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from orderdetails where ID = ${detailsId}`;
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

exports.singleID = (orderID) => {
    var sql = `select * from orderdetails where OrderID = ${orderID}`;
    return db.load(sql);
}