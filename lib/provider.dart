import 'package:flutter/material.dart';

class GestNotifier extends ChangeNotifier{
  bool isVisable=true;

  void forward(){
    isVisable=false;
    notifyListeners();
  }
  void reverse(){
    isVisable=true;
    notifyListeners();
  }
}