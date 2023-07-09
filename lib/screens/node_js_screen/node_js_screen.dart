import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project360/models/node_js_models/product.dart';

import '../../services/node_js_remote_services.dart';
import 'create.dart';
import 'read_data_screen.dart';

class NodeJsScreen extends StatefulWidget {
  const NodeJsScreen({super.key});

  @override
  State<NodeJsScreen> createState() => _NodeJsScreenState();
}

class _NodeJsScreenState extends State<NodeJsScreen> {
  List<Product> products = [];
  bool isLoaded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => CreateScreen());
                },
                child: ButtonMaker(
                  text: "Create",
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () async {
                    Get.to(() => ReadDataScreen());
                  },
                  child: ButtonMaker(text: "Read")),
              SizedBox(height: 10),
            ]),
      ),
    );
  }
}

class ButtonMaker extends StatelessWidget {
  final String text;
  ButtonMaker({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade300,
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
