import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: FutureBuilder(
          future: controller.getProductList(),
          builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      controller.productList[index].title.toString())
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
