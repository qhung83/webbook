var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from users';
    return db.load(sql);
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from users where f_ID = ${id}`;
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
exports.add = (a) => {
    var sql = `insert into users(f_Username,f_Password,f_Name,f_Email,f_DOB,f_Permission) values('${a.f_Username}','${a.f_Password}','${a.f_Name}','${a.f_Email}','${a.f_DOB}','${a.f_Permission}')`;
    return db.save(sql);
}

exports.delete = (id) => {
    var sql = `delete from users where f_ID = ${id}`;
    return db.save(sql);
}


exports.update = (a) => {
    var sql = `update users set f_Username = '${a.f_Username}',f_Password = '${a.f_Password}',f_Name = '${a.f_Name}',f_Email = '${a.f_Email}',f_DOB = '${a.f_DOB}',f_Permission = '${a.f_Permission}' where f_ID = ${a.f_ID}`;
    return db.save(sql);
}

exports.count = () => {
    var sql = "select count(*) as soluongad from users";
    return db.load(sql);
}