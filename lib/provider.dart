
import 'package:flutter/material.dart';

class GestNotifier extends ChangeNotifier{
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