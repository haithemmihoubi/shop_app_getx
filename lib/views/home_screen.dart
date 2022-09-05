import 'package:flutter/material.dart';
import 'package:shop_app_getx/views/products_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar  (
        title: const Text('Home Screen'),
      ),
      body: ProductScreen(),
    );
  }
}
