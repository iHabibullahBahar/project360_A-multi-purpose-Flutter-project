import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project360/models/mock_api_models/user_model.dart';
import 'package:project360/screens/book_api_screen/api_practice_screem.dart';
import 'package:project360/screens/form_validation_screen/form_validation_screen.dart';
import 'package:project360/screens/node_js_screen/node_js_screen.dart';
import 'package:project360/services/remote_service.dart';

import 'mockapi_screen/mock_api_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<User> userList = [];

  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => MockApiScreen());
                  },
                  child: Container(
                    height: Get.width * 0.45,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple.shade400,
                    ),
                    child: Center(
                      child: Text(
                        'Mock Api',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.to(() => ApiPracScreen());
                  },
                  child: Container(
                    height: Get.width * 0.45,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple.shade400,
                    ),
                    child: Center(
                      child: Text(
                        'Book Api',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => NodeJsScreen());
                  },
                  child: Container(
                    height: Get.width * 0.45,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple.shade400,
                    ),
                    child: Center(
                      child: Text(
                        'Node Js',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.to(() => FormValidationScreen());
                  },
                  child: Container(
                    height: Get.width * 0.45,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple.shade400,
                    ),
                    child: const Center(
                      child: Text(
                        'Form Validate',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
