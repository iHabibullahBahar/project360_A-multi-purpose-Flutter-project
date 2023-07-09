import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project360/models/node_js_models/product.dart';
import '../config/sensitive_data.dart';

//String baseUrl = "http://192.168.0.146:3000/api/";
String baseUrl = url;

class NodeJsDataController {
  addProduct(Map<String, dynamic> pdata) async {
    var url = Uri.parse("${baseUrl}add_product");
    try {
      var response = await http.post(url, body: pdata);
      if (response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return 201;
      } else {
        return 0;
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  List<Product> products = [];
  // base get
  getProducts() async {
    var url = Uri.parse("${baseUrl}get_products");
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        decodedData['products'].forEach((product) {
          products.add(
            Product(
              name: product['name'],
              price: product['price'].toString(),
              description: product['description'],
              id: product['_id'],
            ),
          );
        });
        return products;
      } else {
        print("Error");
        return [];
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  //edit product
  updateProduct(Map<String, dynamic> pdata, String id) async {
    var url = Uri.parse("${baseUrl}update_product/$id");
    try {
      var response = await http.patch(url, body: pdata);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return 200;
      } else {
        print(response.statusCode);
        return 0;
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  //delete product
  deleteProduct(String id) async {
    var url = Uri.parse("${baseUrl}delete_product/$id");
    try {
      var response = await http.post(url);
      print(response.body);
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return 200;
      } else {
        print(response.statusCode);
        return 0;
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
