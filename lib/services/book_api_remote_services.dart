import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/book_api_models/book_model.dart';

var client = http.Client();
String baseUrl = "https://simple-books-api.glitch.me/";

Future<void> fetchBookData() async {
  try {
    var response =
        await http.get(Uri.parse("https://simple-books-api.glitch.me/books"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        BookModel bookModel = BookModel.fromJson(item);
        Get.find<BookDataController>().bookList.add(bookModel);
      }
      Get.find<BookDataController>().isLoading.value = false;
    }
  } catch (e) {
    print("Error Occurred");
  }
}

Future<void> fetchOrderData() async {
  try {
    var url = Uri.parse("https://simple-books-api.glitch.me/orders");
    var _headers = {
      'Authorization':
          'Bearer 9250b3f47f8485da6897d27fd1253f74f20278a910f976f115bc1188d196bf00'
    };
    var response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print("Error Occurred");
  }
}

class BookDataController extends GetxController {
  RxBool isLoading = true.obs;
  List<BookModel> bookList = [];
  @override
  void onInit() {
    super.onInit();

    fetchOrderData();
    fetchBookData();
  }
}
