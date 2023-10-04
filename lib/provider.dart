
import 'package:flutter/material.dart';

class GestNotifier extends ChangeNotifier{
   bool isVisable=true;

  void toBeTrue(){
    isVisable=true;
    notifyListeners();
  }
  void toBeFalse(){
    isVisable=false;
    notifyListeners();
  }
}