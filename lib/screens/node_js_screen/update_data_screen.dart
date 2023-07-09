import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project360/models/node_js_models/product.dart';

import '../../services/node_js_remote_services.dart';
import 'node_js_screen.dart';

class UpdateDataScreen extends StatefulWidget {
  Product product;
  UpdateDataScreen({required this.product});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(
      text: widget.product.name,
    );
    var priceController = TextEditingController(
      text: widget.product.price,
    );
    var descriptionController = TextEditingController(
      text: widget.product.description,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Price",
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  var pdata = {
                    "name": nameController.text,
                    "price": priceController.text,
                    "description": descriptionController.text,
                  };
                  var response = await NodeJsDataController()
                      .updateProduct(pdata, widget.product.id);

                  if (response == 200) {
                    //snackbar
                    Get.snackbar(
                      "Success",
                      "Product Updated",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    //snackbar
                    print(response);
                    Get.snackbar(
                      "Error",
                      "Something went wrong",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: ButtonMaker(
                  text: "Update",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
