const express = require('express');
const respuesta = require('../../red/respuestas');
const controlador = require('./controller');

const router = express.Router();
router.get('/', all);
router.get('/:id', uniques);
router.put('/:id', actualizar);
router.delete('/:id', eliminate);

 async function all(req, res){
    try{
        const items = await controlador.all();
        respuesta.success(req, res, items, 200);
    }
    catch{
        respuesta.error(req, res, 'We dont have any photo registrated', 500);
    }
};
async function uniques(req, res){
    try{
        const items = await controlador.uniques(req.params.id);
        respuesta.success(req, res, items, 200);
    }
    catch{
        respuesta.error(req, res, 'That photo isnt registrated', 500);
    }
    
};
async function actualizar(req,res){
    try{
        const items = await controlador.actualizar(req.params.id, req.body);
        respuesta.success(req, res, 'Photo updated successfully', 200);
    }
    catch{
        respuesta.error(req, res, 'Updated failed', 500);
    }
}
async function eliminate(req,res){
    try{
        const items = await controlador.eliminate(req.params.id);
        respuesta.success(req, res, 'Photo eliminated succesfully', 200);
    }
    catch{
        respuesta.error(req, res, items, 500);
    }
}
module.exports = router;