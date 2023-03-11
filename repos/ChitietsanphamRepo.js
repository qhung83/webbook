var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from details';
    return db.load(sql);
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from details where DetailID = ${id}`;
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
exports.add = (d) => {
    var sql = `insert into details(ProID,Duongkinhmat,Chongnuoc,Chatlieumat,Nangluongsudung,Sizeday,Chatlieuday,Chatlieuvo,Kieudang,Xuatxu,Chedobaohanh) values('${d.ProID}','${d.Duongkinhmat}','${d.Chongnuoc}','${d.Chatlieumat}','${d.Nangluongsudung}','${d.Sizeday}','${d.Chatlieuday}','${d.Chatlieuvo}','${d.Kieudang}','${d.Xuatxu}','${d.Chedobaohanh}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from details where DetailID = ${id}`;
    return db.save(sql);
}


exports.update = (d) => {
    var sql = `update details set ProID = '${d.ProID}',Duongkinhmat = '${d.Duongkinhmat}',Chongnuoc = '${d.Chongnuoc}',Chatlieumat = '${d.Chatlieumat}',Nangluongsudung = '${d.Nangluongsudung}',Sizeday = '${d.Sizeday}',Chatlieuday = '${d.Chatlieuday}',Chatlieuvo = '${d.Chatlieuvo}',Kieudang = '${d.Kieudang}',Xuatxu = '${d.Xuatxu}',Chedobaohanh = '${d.Chedobaohanh}' where DetailID = ${d.DetailID}`;
    return db.save(sql);
}

exports.count = () => {
    var sql = "select count(*) as soluongctsp from details";
    return db.load(sql);
}