
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductsCategory extends StatelessWidget {
  final String category;
   ProductsCategory({Key? key, required this.category}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    print(controller.productListByCategory.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: FutureBuilder(
          future:  controller.getProductsByCategoryName(category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: controller.productListByCategory.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          showImage(controller.productListByCategory[index].image,controller.productListByCategory[index].title );

                        },
                        leading: Image.network(
                          controller.productListByCategory[index].image,
                          width: 100,
                          height: 100,
                        ),
                        title: Text(controller.productListByCategory[index].title),
                        subtitle: Text(
                            '${controller.productListByCategory[index].price.toString()} \$'),

                      ),
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
  void showImage($image,$title) {
    Get.defaultDialog(
      title: $title,
      content: Image.network(
        $image,
        width: 250,
        height: 300,
        fit: BoxFit.contain,
      ),
      radius: 10,
      barrierDismissible: true,
    );
  }

}
