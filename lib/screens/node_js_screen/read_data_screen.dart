import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project360/screens/node_js_screen/update_data_screen.dart';
import 'package:project360/services/node_js_remote_services.dart';

class ReadDataScreen extends StatefulWidget {
  const ReadDataScreen({super.key});

  @override
  State<ReadDataScreen> createState() => _ReadDataScreenState();
}

class _ReadDataScreenState extends State<ReadDataScreen> {
  NodeJsDataController nodeJsDataController = NodeJsDataController();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    nodeJsDataController.getProducts().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await nodeJsDataController.getProducts();
                  setState(() {
                    isLoading = false;
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                for (var product in nodeJsDataController.products)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(product.price),
                                  SizedBox(height: 5),
                                  Text(product.description),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response = await nodeJsDataController
                                          .deleteProduct(product.id);
                                      if (response == 200) {
                                        setState(() {
                                          nodeJsDataController.products
                                              .remove(product);
                                          Get.snackbar(
                                            "Success",
                                            "Product deleted successfully",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                          );

                                          isLoading = false;
                                        });
                                      }
                                    },
                                    child:
                                        CircleAvatar(child: Icon(Icons.delete)),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          UpdateDataScreen(product: product));
                                    },
                                    child:
                                        CircleAvatar(child: Icon(Icons.edit)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      nodeJsDataController.getProducts().then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
                    child: Text("Refresh")),
              ]));
  }
}
