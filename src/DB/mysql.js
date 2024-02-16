const mysql = require('mysql');
const config = require('../config');

const dbconfig = {
    host: config.mysql.host,
    user: config.mysql.user,
    password: config.mysql.password,
    database: config.mysql.database,
}

let conexion;
function conexionDB(){
    conexion=mysql.createConnection(dbconfig);

    conexion.connect((err)=>{
        if(err){
            console.log('[db err]', err);
            setTimeout(conexionDB, 200);
        }
        else{
            console.log('DB conectada');
        }
    });
    conexion.on('error', err=>{
        console.log('[db err]', err);
        if(err.code === 'PROTOCOL_CONNECTION_LOST'){
            conexionDB();
        }
        else{
            throw err;
        }
    });
}

conexionDB();
function all(table){
    return new Promise((resolve, reject)=>{
        if(table == 'users'){
            conexion.query(`SELECT * FROM  ${table} INNER JOIN address INNER JOIN company WHERE users.idaddress = address.idaddress AND users.idcompany = company.idcompany`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
       }
        else if(table=='photos'){
            conexion.query(`SELECT * FROM ${table} INNER JOIN album INNER JOIN users INNER JOIN address INNER JOIN company ON photos.idalbum = album.idalbum AND album.iduser=users.iduser AND users.idaddress = address.idaddress AND users.idcompany = company.idcompany`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
            
        }
        else if(table =='album'){
            conexion.query(`SELECT * FROM ${table} INNER JOIN users INNER JOIN address INNER JOIN company ON album.iduser=users.iduser AND users.idaddress = address.idaddress AND users.idcompany = company.idcompany`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        
    });
}
function uniques(table, id){
    return new Promise((resolve, reject)=>{
        if(table=='users'){
            conexion.query(`SELECT * FROM ${table} INNER JOIN address INNER JOIN company WHERE users.iduser=${id} AND users.idaddress = address.idaddress AND users.idcompany = company.idcompany`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if(table=='album'){
            conexion.query(`SELECT * FROM ${table} INNER JOIN users INNER JOIN address INNER JOIN company ON album.iduser=users.iduser AND users.idaddress = address.idaddress AND users.idcompany = company.idcompany WHERE idalbum=${id}`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if(table=='photos'){
            conexion.query(`SELECT * FROM ${table} INNER JOIN album INNER JOIN users INNER JOIN address INNER JOIN company ON photos.idalbum = album.idalbum AND album.iduser=users.iduser AND users.idaddress = address.idaddress AND users.idcompany = company.idcompany WHERE iduser=${id}`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
    });
}
function actualizar(table, id, data){
    return new Promise((resolve, reject)=>{
        if(table=='users'){
            conexion.query(`UPDATE ${table} SET ? WHERE iduser = ${id}`,data, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if(table =='album'){
            conexion.query(`UPDATE ${table} SET ? WHERE idalbum = ${id}`,data, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if (table =='photos'){
            conexion.query(`UPDATE ${table} SET ? WHERE idphoto = ${id}`,data, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
    });
}
function eliminate(table, id){
    return new Promise((resolve, reject)=>{
        if(table=='users'){
            conexion.query(`DELETE FROM  ${table} WHERE iduser = ${id}`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if(table=='album'){
            conexion.query(`DELETE FROM  ${table} WHERE idalbum = ${id}`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
        else if(table=='photos'){
            conexion.query(`DELETE FROM  ${table} WHERE idphoto = ${id}`, (error, result)=>{
                return error ? reject(error): resolve(result);
            })
        }
    });
}

module.exports={
    all,
    uniques,
    actualizar,
    eliminate,
}