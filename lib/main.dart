import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _myApp();
}

class _myApp extends State<MyApp> {
  Color? widgetyellow=Color.fromARGB(255, 255, 215, 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor:widgetyellow ,
            leading: IconButton(///测试动画用
              onPressed: () {},
              icon: Icon(Icons.change_circle_rounded),
            ),
          ),
          body: GestureDetector(),
          bottomNavigationBar: GestureDetector(),
        ));
  }
}
