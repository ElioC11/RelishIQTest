const db = require('../../DB/mysql');
const tabla = 'users';
function all(){
    return db.all(tabla);
}
function uniques(id){
    return db.uniques(tabla, id);
}
function eliminate(id){
    return db.eliminate(tabla, id);
}
function actualizar(id,body){
    return db.actualizar(tabla, id, body);
}

module.exports={
    all,
    uniques,
    eliminate,
    actualizar,
}