import 'package:flutter/material.dart';

class SliderExampleProvider with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;

  void updateValue(double val) {
    _value = val;
    notifyListeners();
  }
}
