import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/node_js_remote_services.dart';
import 'node_js_screen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  var response = await NodeJsDataController().addProduct(pdata);

                  if (response == 201) {
                    //snackbar
                    Get.snackbar(
                      "Success",
                      "Product added successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                    );
                  }
                },
                child: ButtonMaker(
                  text: "Create",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
