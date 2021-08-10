import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Providers/orders.dart';

class OrderItemsWidget extends StatefulWidget {
  final OrderItem order;
  OrderItemsWidget(this.order);

  @override
  _OrderItemsWidgetState createState() => _OrderItemsWidgetState();
}

class _OrderItemsWidgetState extends State<OrderItemsWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Rs${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.title),
                          Text('${e.quantity} x Rs${e.price}'),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
