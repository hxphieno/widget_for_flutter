
import 'package:flutter/material.dart';

class GestureNotifier extends ChangeNotifier{
   bool isSeen=true;

  void toBeTrue(){
    isSeen=true;
    notifyListeners();
  }
  void toBeFalse(){
    isSeen=false;
    notifyListeners();
  }
}