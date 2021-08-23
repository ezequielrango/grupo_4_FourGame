const express = require('express');
const router =  express.Router();
const multer = require("multer");
const path = require("path");


/* Config multer storage */

const storage = multer.diskStorage({
    destination : (req,file,cb) =>{
        cb(null,path.join(__dirname,`../public/images/products`))
    },
    filename : (req,file,cb) =>{
        cb(null,`img-${Date.now()}${path.extname(file.originalname)}`)
    }
});

const upload = multer({storage : storage});

/* Require controller */

const controller = require("../controllers/productsController");

/* Product detail */

router.get('/detail/:id', controller.detail);

/* Product create*/ 

router.get('/create', controller.loading);
router.post('/create',upload.any(),controller.save);

/* Product edit */

router.get('/edit/:id', controller.edit);
router.put('/edit/:id',upload.any(),controller.update);

/* Product delete */

router.delete('/delete/:id', controller.destroy);




module.exports = router;

