import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  var isInCart = false;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.isInCart,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    //'random': CartItem(id: '', title: '', quantity: 0, price: 0, isInCart: true),
  };

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
      (key, value) {
        total += value.price * value.quantity;
      },
    );
    return double.parse(total.toStringAsFixed(2));
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
          isInCart: true,
        ),
      );
      print('quantity added');
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
          isInCart: true,
        ),
      );
    }
    notifyListeners();
  }

  void addInCart(CartItem ci) {
    ci.isInCart = true;
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            quantity: value.quantity - 1,
            price: value.price,
            isInCart: value.isInCart),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
