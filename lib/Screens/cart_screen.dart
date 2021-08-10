import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/cart.dart';
import 'package:shopapp/Widgets/cart_item_widget.dart';
import '../Providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screem';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.black,
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: Colors.black87,
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        'Rs' + cart.totalAmount.toString(),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                      child: Chip(
                        label: Text(
                          'Purchase',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (context, i) => CartItemWidget(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].title,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
