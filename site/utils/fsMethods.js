const fs = require("fs");
const path = require("path");


module.exports = {

    join : route => {
        return path.join(__dirname,route)
    },

    saveFile : file => {
        fs.writeFileSync(path.join(__dirname,'../data/products.json'),JSON.stringify(file,null,2),'utf-8') 
    },

    renameFolder : (oldPath,newPath) => {
        fs.renameSync(path.join(__dirname,oldPath),path.join(__dirname,newPath));
    },

    deleteFolder : route => {
        let absolutePath = path.join(__dirname,route);
        
        if( fs.existsSync(absolutePath)) {
            fs.readdirSync(absolutePath).forEach(file => {
                let pathFile = absolutePath + "/" + file;
    
                if(fs.statSync(pathFile).isDirectory()) { // callback
                     deleteFolder(pathFile);
                } else { // delete file
                     fs.unlinkSync(pathFile);
                }
                
            });
            fs.rmdirSync(absolutePath);
        }
    },
}