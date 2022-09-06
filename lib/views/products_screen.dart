import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/controllers/product_controller.dart';
import 'package:shop_app_getx/views/components/product_component.dart';

class ProductScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: FutureBuilder(
          future: controller.getProductList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return ProductComponent(image:controller.productList[index].image ,  title: controller.productList[index].title,
                      price: controller.productList[index].price.toString(), rating:controller.productList[index].rating.rate.toString(),);
                    // end of Card
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
