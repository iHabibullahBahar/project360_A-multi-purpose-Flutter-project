import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/remote_service.dart';

class MockApiScreen extends StatelessWidget {
  const MockApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var remoteService = Get.put(RemoteServices());
    remoteService.get("users");
    remoteService.post("users", {
      "name": "Habib",
      "email": "habib@gmail.com",
    });
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        body: Obx(() {
          if (remoteService.isGetLoading.value) {
            return ListView(children: [
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Skeleton(height: 60, width: 60),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Skeleton(
                                      height: 20,
                                      width: 150,
                                    ),
                                    SizedBox(height: 5),
                                    Skeleton(
                                      height: 15,
                                    ),
                                    SizedBox(height: 5),
                                    Skeleton(
                                      height: 15,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      )),
                ),
            ]);
          } else {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        for (var user in remoteService.userList)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple.shade100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      user.avatar.toString(),
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user.name.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 5),
                                      Text(user.email.toString()),
                                      SizedBox(height: 5),
                                      Text(user.phone.toString()),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        remoteService.post("users", {
                          "name": "Habib + ${Random().nextInt(100)}",
                          "email": "habib" +
                              Random().nextInt(100).toString() +
                              "@gmail.com",
                        });
                        remoteService.get("users");
                      },
                      child: Text('Post')),
                ),
              ],
            );
          }
        }));
  }
}

class Skeleton extends StatelessWidget {
  double? height;
  double? width;
  Skeleton({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      height: height,
      width: width,
    );
  }
}
