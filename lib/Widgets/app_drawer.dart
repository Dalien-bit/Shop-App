import 'package:flutter/material.dart';
import '../Screens/user_products_screen.dart';
import '../Screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: [
            AppBar(
              title: Text('...'),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: Colors.white,
              ),
              title: Text(
                'Shop',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.white,
              ),
              title: Text(
                'Orders',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              title: Text(
                'My Products',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(UserProductScreen.routName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
