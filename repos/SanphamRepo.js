var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from products';
    return db.load(sql);
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from products where ProID = ${id}`;
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
exports.add = (s) => {
    var sql = `insert into products(ProName,Price,images,CatID,BrandID,Description) values('${s.ProName}','${s.Price}','${s.images}','${s.CatID}','${s.BrandID}','${s.Description}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from products where ProID = ${id}`;
    return db.save(sql);
}


exports.update = (s) => {
    var sql = `update products set ProName = '${s.ProName}',Price = '${s.Price}',images = '${s.images}',CatID = '${s.CatID}',BrandID = '${s.BrandID}',Description = '${s.Description}' where ProID = ${s.ProID}`;
    return db.save(sql);
}

exports.count = () => {
    var sql = "select count(*) as soluong from products";
    return db.load(sql);
}