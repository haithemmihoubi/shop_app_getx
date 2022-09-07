import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../products_category.dart';

class Categories extends StatelessWidget {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder(
        future:controller.getCategories(),
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        return SizedBox(
          height: Get.height * 0.09,
          child: Card(
            elevation: 0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onPressed: () {
                    Get.to(()=>ProductsCategory(category: controller.categoryList[index]));
                  },
                  child:  Text(
                    controller.categoryList[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),);
              },
            ),
          ),
        );
      } else {
        return  Center(
          child: CircularProgressIndicator( color: Colors.blue.withOpacity(0.2),),
        );
      }
    });
    
  }
}
