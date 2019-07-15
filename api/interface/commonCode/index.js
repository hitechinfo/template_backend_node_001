const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();
const controller = require('./commonCode.controller');

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/', controller.list);
router.get('/:groupId/:codeOption', controller.index);
router.put('/:codeName', controller.update)
module.exports = router;
