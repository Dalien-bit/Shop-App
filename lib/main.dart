import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/user_products_screen.dart';
import './Screens/order_screen.dart';
import './Providers/orders.dart';
import './Screens/cart_screen.dart';
import './Providers/cart.dart';
import './Screens/products_overview_screen.dart';
import 'Screens/product_detail_screen.dart';
import 'Providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange[50],
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routName: (ctx) => UserProductScreen(),
        },
      ),
    );
  }
}
