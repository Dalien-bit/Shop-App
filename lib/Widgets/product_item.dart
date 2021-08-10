import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/cart.dart';
import 'package:shopapp/Providers/product.dart';
import '../Screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final String? imageUrl;
  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  // );
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Consumer<Product>(
          builder: (ctx, product, child) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            onDoubleTap: () {
              product.changeFavoriteStatus();
            },
            child: Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.changeFavoriteStatus();
              },
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Text(
              product.title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          backgroundColor: Colors.black87,
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id!, product.price!, product.title!);
              //filledCart = true;
              //cart.addInCart();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Item added to cart',
                    textAlign: TextAlign.center,
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id!);
                    },
                  ),
                  duration: Duration(
                    seconds: 2,
                  ),
                ),
              );
            },
            icon: Icon(
              //cart.isInCart
              //  ? Icons.shopping_cart
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
