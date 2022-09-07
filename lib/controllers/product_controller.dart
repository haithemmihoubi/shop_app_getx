import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductController extends GetxController {
  // define the b se url
  static const base_url = "https://fakestoreapi.com";



  var productList = [].obs;
  var categoryList = [].obs;
  var isLoading = true.obs;
  var productListByCategory = [].obs;
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
  // get all the categories
  Future<List> getCategories() async {
    //de fine the endpoint url
    final categoriesEndpoint = Uri.parse('$base_url/products/categories');
    //get the Json response
    var response = await http.get(categoriesEndpoint);
    if (response.statusCode == 200) {
      //decode the json response
      var responseJson = json.decode(response.body);
      //convert the json response to a list of products
      categoryList.assignAll(responseJson.map((m) => m.toString()).toList());
      return categoryList;
    } else {
      throw Exception('Failed to load products');
    }
  }
// get a specific category
  Future getProductsByCategoryName(String name) async {
    // define the end point url
    final productsEndpoint = Uri.parse('$base_url/products/category/$name');
    //get the Json response
    var response= await http.get(productsEndpoint);
    if (response.statusCode == 200) {
      //decode the json response
      var responseJson = await json.decode(response.body);
      //convert the json response to a list of products
      productListByCategory
          .assignAll(responseJson.map((m) => Product.fromJson(m)).toList());
      return productListByCategory;

    } else {
      throw Exception('Failed to load products');
    }
    //return productListByCategory;
  }
  @override
  void onInit() {
    getProductList();
    getCategories();
    super.onInit();
  }
}
