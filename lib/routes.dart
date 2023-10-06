import 'package:flutter/material.dart';
import 'pages.dart';

class TapContent {
  Icon selected;
  Widget unSelected;

  TapContent(this.selected, this.unSelected);
}

List<Widget> pageList=[
  HomePage(),const PersonalPage()
];
