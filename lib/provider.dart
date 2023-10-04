import 'package:flutter/material.dart';

class GestNotifier extends ChangeNotifier{

  void forward(){
    notifyListeners();
  }
  void reverse(){
    notifyListeners();
  }
}