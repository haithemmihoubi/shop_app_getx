import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {},
                  child:  Text(
                    controller.categoryList[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),);
              },
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
    /*SizedBox(
      height: Get.height * 0.09,
      child: Card(
        elevation: 0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'All',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),


          ],
        ),
      ),
    );*/
  }
}
