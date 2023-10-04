import 'package:flutter/material.dart';
import 'pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(), // 将 Stateful Widget 添加到应用的主页
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex=0;

  @override
  void initState() {
    _pageController=PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 215, 0),
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
              color: Color.fromARGB(255, 255, 215, 0),
              borderRadius: BorderRadius.circular(screenWidth * 0.05 + 10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                  3,
                      (index) => InkWell(
                    onTap: () {
                      setState(() {
                        if(index==1){///发布页单独控制
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostPage()));
                        }else{
                          _currentIndex=index;
                          _pageController.animateToPage(_currentIndex,
                              duration:
                              const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn);
                        }
                      });
                    },
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
    );
  }
}
