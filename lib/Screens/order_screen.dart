import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/app_drawer.dart';
import '../Widgets/order_items_widget.dart';
import '../Providers/orders.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  @override
  Widget build(BuildContext context) {
    final orderedItems = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          'Orders',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black54,
        child: ListView.builder(
          itemCount: orderedItems.orders.length,
          itemBuilder: (context, i) => OrderItemsWidget(
            orderedItems.orders[i],
          ),
        ),
      ),
    );
  }
}
