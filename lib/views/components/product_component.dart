import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductComponent extends StatelessWidget {
  String image;
  String title;
  String price;
  String rating;

  ProductComponent(
      {super.key, required this.image,
      required this.title,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.toNamed('/product');
      },
      child: Container(

          height: 200,
          width: Get.width,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Card(
                        elevation: 0.1,
                        child: Image.network(
                          image,
                          height: 130,
                          width: 130,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Iconsax.heart,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: Text(title,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(rating,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              const Icon(
                                Iconsax.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("$price \$",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: Get.width * 0.15,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Iconsax.shopping_cart,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
