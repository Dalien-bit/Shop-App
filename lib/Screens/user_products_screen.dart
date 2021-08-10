import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/app_drawer.dart';
import '../Widgets/user_product_item.dart';

import '../Providers/products_provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routName = '/user-products-screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Products',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (_, i) => UserProductItem(
              productData.items[i].imageUrl!, productData.items[i].title!),
        ),
      ),
    );
  }
}
