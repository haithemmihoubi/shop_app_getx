import 'package:flutter/material.dart';
import 'package:shop_app_getx/views/products_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: CustomScrollView(
        slivers: [
           SliverAppBar.large(
             leading: IconButton(
               icon: const Icon(Icons.menu),
               onPressed: () {},
             ),
            title: Text("Shop App"),
            floating: true,
            snap: true,
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: const Text("Products"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ProductScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
