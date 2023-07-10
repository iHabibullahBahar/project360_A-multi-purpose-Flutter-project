const express = require('express');
const mongoose = require('mongoose');

const db = require('./sensitive_data');

const app = express();
const port = 3000;
app.use(express.json());

const Product = require('./product');

app.get('/api/', (req, res) => {
    res.send('Hello World!');
});



app.use(express.urlencoded({ extended: true }));

const productData  = [];

mongoose.connection.once('open', () => {
  console.log('Connected to database');
}).on('error', (error) => {
    console.log('Connection error:');
});

mongoose.connect(db, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});



app.get('/api/get_products', async(req, res) => {  
    try{
        let data = await Product.find();
        
        const response = {
            status_code: 200,
            message: 'Product fetched successfully',
            "products": data,
        };
        res.status(200).json(response);
        //console.log(data);
    }
    catch(err){
        console.log(err);
    };
});

app.post('/api/add_product', async (req, res) => {
    console.log(req.body);
    let pdata = Product(req.body);


    try{
        let dataToSave = await pdata.save();
        const response = {
            status_code: 201,
            message: 'Product added successfully',
            data: dataToSave,
        };
        res.status(201).json(response);
        //console.log(dataToSave);
    }
    catch(err){
        console.log(err);

    }



    // const pdata = {
    //     "id": productData.length + 1,
    //     "name": req.body.name,
    //     "price": req.body.price,
    //     "description": req.body.description,
    // }

    // const response = {
    //   status_code: 201,
    //   message: 'Product added successfully',
    //     data: pdata,
    // };
    // res.status(201).json(response);
    // productData.push(pdata);
    // console.log(pdata);
  });

  app.patch('/api/update_product/:id', async (req, res) => {
    console.log(req.body);
    let id = req.params.id ;
    let updatedData = req.body;
    let options = { new: true };


    try {
        const data = await Product.findByIdAndUpdate(id, updatedData, options);
        res.status(200).json(data);
      
    } catch (err) {
      console.log(err);
      res.status(404).json({
        "status_code": 404,
        "message": "Something went wrong"
      });
    }
  });

    app.post('/api/delete_product/:id', async (req, res) => { 

        let id = req.params.id ;
        try{
            let data = await Product.findByIdAndDelete(id);
            const response = {
                "message": "Product deleted successfully",
                "status_code": 200,
            }
            res.status(200).json(response);

        }
        catch(err){
            res.status(404).json({"status_code": 404,"message": "Something went wrong"});
        }
        // console.log("Initial:- ",1222222);
        // console.log("Initial:- ",req.body);
        // let id = req.params.id * 1;
        // let index = productData.findIndex((product) => product.id === id);
        // productData.splice(index, 1);
        // const response = {
        //     status_code: 200,
        //     message: 'Product deleted successfully',
        // };
        // res.status(200).json(response);
        // console.log(productData);

    });



app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
    // console.log(db);
});
