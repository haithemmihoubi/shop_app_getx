import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
      useMaterial3: true,
        primarySwatch: Colors.blue,
      ),

      home:  HomeScreen(),
    );
  }
}

