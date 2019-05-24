const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use('/user', require('./api/interface/user'));
app.use('/login', require('./api/interface/login'));
app.use('/faq', require('./api/interface/faq'));
app.use('/recruitNotice', require('./api/interface/recruitNotice'));
app.use('/commonCode', require('./api/interface/commonCode'));

module.exports = app;
