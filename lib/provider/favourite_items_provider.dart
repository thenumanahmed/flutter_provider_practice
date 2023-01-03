import 'package:flutter/material.dart';

class FavouriteItemsProvider with ChangeNotifier {
  List<int> _selecteditems = [];
  List<int> get selecteditems => _selecteditems;


  void addItem(int val) {
    _selecteditems.add(val);
    notifyListeners();
  }


  
  void removeItem(int val) {
    _selecteditems.remove(val);
    notifyListeners();
  }
}
