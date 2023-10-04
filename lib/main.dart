import 'package:flutter/material.dart';
import 'pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _myApp();
}

class _myApp extends State<MyApp> with SingleTickerProviderStateMixin {
  Color? widgetYellow = const Color.fromARGB(255, 255, 215, 0);
  late PageController _pgaeController;

  @override
  void initState() {
    _pgaeController=PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pgaeController.dispose();
    super.dispose();
  }

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
                setState(() {});
              },
              icon: const Icon(Icons.change_circle_rounded),
            ),
          ),
          body: PageView(
          ),
          bottomNavigationBar: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy > 0) {
                ///拖住组件下滑可隐藏
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03, horizontal: screenWidth * 0.3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widgetYellow,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05 + 10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      3,
                      (index) => InkWell(
                            onTap: () {},
                            child: Container(
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.05)),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ));
  }
}
