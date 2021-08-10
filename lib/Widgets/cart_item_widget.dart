import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItemWidget(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.black,
            title: Text(''),
            content: Text(
              'Do you want to remove the item from the cart?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      key: ValueKey(id),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: FittedBox(
                  child: Text(
                    'Rs$price',
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(
              'Total' + 'Rs${price * quantity}',
            ),
            trailing: Text(
              '$quantity',
            ),
          ),
        ),
      ),
    );
  }
}
