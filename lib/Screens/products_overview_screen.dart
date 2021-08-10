import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/app_drawer.dart';
import '../Providers/cart.dart';
import '../Screens/cart_screen.dart';
import '../Widgets/badge.dart';
import '../Widgets/products_grid.dart';
import '../Providers/products_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavoritesData = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer =
    //     Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Products',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  //...
                  // productsContainer.showFavoritesOnly();
                  _showOnlyFavoritesData = true;
                } else {
                  //...
                  // productsContainer.showAll();
                  _showOnlyFavoritesData = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              color: Colors.black,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black87,
        child: ProductsGrid(_showOnlyFavoritesData),
      ),
    );
  }
}
