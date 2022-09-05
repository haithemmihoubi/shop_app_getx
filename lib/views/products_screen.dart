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
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            controller.productList[index].image,
                            height: 200,
                            width: 200,
                          ),
                          Text(controller.productList[index].title),
                          Text(controller.productList[index].price.toString()),
                          Text(controller.productList[index].description),
                          Text(controller.productList[index].category),
                          Text(controller.productList[index].image),
                        ],
                      ),
                    );
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
