import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductController extends GetxController {
  // define the b se url
  static const base_url = "https://fakestoreapi.com";



  var productList = [].obs;
  var isLoading = true.obs;

// get all the products
  Future<RxList> getProductList() async {
    //de fine the endpoint url
    final productsEndpoint = Uri.parse('$base_url/products');
    //get the Json response
    var response = await http.get(productsEndpoint);
    if (response.statusCode == 200) {
      //decode the json response
      var responseJson = json.decode(response.body);
      //convert the json response to a list of products
      productList
          .assignAll(responseJson.map((m) => Product.fromJson(m)).toList());
    } else {
      throw Exception('Failed to load products');
    }
    //return the list of products as an observable list of products (RxList)
    return productList;
  }

// get a single product
  getProductById(int id) {
    return productList.firstWhere((element) => element.id == id);
  }

  @override
  void onInit() {
    getProductList();

    super.onInit();
  }
}
