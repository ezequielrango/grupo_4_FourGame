const express = require('express');
const router =  express.Router();

const controller = require("../controllers/productsController");

router.get('/detail-product', controller.detail);
router.get('/product-loading', controller.loading);

module.exports = router;
