import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../services/book_api_remote_services.dart';

class ApiPracScreen extends StatefulWidget {
  const ApiPracScreen({super.key});

  @override
  State<ApiPracScreen> createState() => _ApiPracScreenState();
}

class _ApiPracScreenState extends State<ApiPracScreen> {
  var bookDataController = Get.put(BookDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text('Api Practice'),
        ),
        body: Obx(() {
          if (bookDataController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                for (var book in bookDataController.bookList)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Get.snackbar('', "${book.name} is Deleted",
                                  snackPosition: SnackPosition.BOTTOM);
                              bookDataController.bookList.remove(book);
                              setState(() {});
                            },
                            label: 'Delete',
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(book.name.toString()),
                          subtitle: Text(
                              "Availablity: ${book.available == true ? "Available" : "Not Available"}"),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 100),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text("Order History"),
                        SizedBox(height: 10),
                      ],
                    ))
              ],
            );
          }
        }));
  }
}
