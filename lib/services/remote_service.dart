import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/mock_api_models/user_model.dart';

class RemoteServices extends GetxController {
  List<User> userList = [];
  RxBool isGetLoading = true.obs;
  String baseUrl = "https://64a84f7cdca581464b85a043.mockapi.io/";
  var client = http.Client();
  Future<void> get(String endPoint) async {
    isGetLoading.value = true;
    var response = await client.get(Uri.parse(baseUrl + endPoint));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      userList = (jsonMap as List).map((e) => User.fromJson(e)).toList();
      isGetLoading.value = false;
    } else {
      print("response status code: ${response.statusCode}");
    }
  }

  Future<void> post(String endPoint, Map<String, dynamic> body) async {
    var url = Uri.parse(baseUrl + endPoint);
    var _payload = jsonEncode(body);
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: _payload);
    if (response.statusCode == 201) {
      print("response status code: ${response.statusCode}");
    } else {
      print("response status code: ${response.statusCode}");
    }
  }
}
