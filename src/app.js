const express = require('express');
const config = require('./config');
const morgan = require('morgan');

const users = require('./modulos/users/rutas');
const photos = require('./modulos/photos/rutas');
const albums = require('./modulos/albums/rutas');
const app = express();

//middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({extended:true}));

//configuración
app.set('port', config.app.port);

//rutas
app.use('/users',users);
app.use('/photos',photos);
app.use('/album',albums);

module.exports = app;