import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _myApp();
}

class _myApp extends State<MyApp> {
  Color? widgetYellow = const Color.fromARGB(255, 255, 215, 0);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: widgetYellow,
            leading: IconButton(
              ///测试动画用
              onPressed: () {
                setState(() {

                });
              },
              icon: const Icon(Icons.change_circle_rounded),
            ),
          ),
          body: GestureDetector(),
          bottomNavigationBar: GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03, horizontal: screenWidth * 0.3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widgetYellow, borderRadius: BorderRadius.circular(screenWidth*0.05+10)
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [...List.generate(3, (index) => InkWell(
                  onTap: (){},
                  child: Container(
                    width: screenWidth*0.1,
                    height: screenWidth*0.1,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(screenWidth*0.05)
                    ),
                  ),
                ))],
              ),
            ),
          ),
        ));
  }
}
