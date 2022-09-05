import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductController extends GetxController {
  static const base_url = "https://fakestoreapi.com";

  var productList = [].obs;
  var isLoading = true.obs;

  Future getProductList() async {
    final productsUrl=Uri.parse('$base_url/products');
    var response = await http.get(productsUrl);

    if (response.statusCode == 200) {
      print('response $response');
      var responseJson = json.decode(response.body);
      print('responsejson $responseJson');
     productList.assignAll(responseJson.map((m) => Product.fromJson(m)).toList());
      print("This is the product list ${productList.length}");
   
    } else {
      throw Exception("Failed to load data");
    }
    return productList;
  }

  @override
  void onInit() {
    getProductList();

    super.onInit();
  }
}
