import 'package:flutter/material.dart';

class GestNotifier extends ChangeNotifier{
  bool isVisable=true;

  void forward(){
    isVisable=true;
    notifyListeners();
  }
  void reverse(){
    isVisable=false;
    notifyListeners();
  }
}