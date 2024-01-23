import 'package:cart_with_providers/Item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _price = 0;

  void add(Item item) {
    _items.add(item);
    _price += item.Price;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    _price -= item.Price;
    notifyListeners();
  }

  int get Count {
    return _items.length;
  }

  double get Total_price {
    return _price;
  }

  List get basketitem {
    return _items;
  }
}
