import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_for_flutter/provider.dart';
import 'pages.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>GestNotifier(),child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(), // 将 Stateful Widget 添加到应用的主页
    ));
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
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
    List<TapContent> contentList = [
      TapContent(
          const Icon(Icons.home, color: Colors.white),
          Container(
            margin: const EdgeInsets.all(5),
            width: 0.075 * screenWidth,
            height: 0.075 * screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.075 * screenWidth * 0.5)),
            child: ClipOval(
              child: Image.network(
                'https://x0.ifengimg.com/res/2020/5708936A11E5A0BBFCFE450E89E545D859BE0296_size13_w411_h410.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          )),
      TapContent(
          const Icon(Icons.add, size: 35, color: Colors.white),
          Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.1 * 0.5)),
            child: const Center(
                child: Icon(Icons.add,
                    color: Color.fromARGB(255, 255, 215, 0), size: 30)),
          )),
      TapContent(
          const Icon(
            Icons.person,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: 0.075 * screenWidth,
            height: 0.075 * screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.075 * screenWidth * 0.5)),
            child: ClipOval(
              child: Image.network(
                'https://pic.qtfm.cn/device/d2d6e63c7b114ebd96ad573196b73521/1592448006874_PI1DBnQtG.png',
                fit: BoxFit.fill,
              ),
            ),
          ))
    ];
    final gestNotifier=Provider.of<GestNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 215, 0),
          leading: IconButton(
            ///测试动画用
            onPressed: () {
              setState(() {
                gestNotifier.isVisable=!gestNotifier.isVisable;
              });
            },
            icon: const Icon(Icons.change_circle_rounded),
          ),
          centerTitle: true,
          title: Text("测试用状态栏，来测")),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = 2 * index;
            gestNotifier.isVisable=true;
          });
        },
        children: pageList,
      ),
      bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          child: Transform.translate(
            offset: Offset(0, gestNotifier.isVisable?0:200),
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dy > 0) {
                  ///拖住组件下滑可隐藏
                  print("drag");
                  setState(() {
                    gestNotifier.isVisable=false;
                  });
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03, horizontal: screenWidth * 0.3),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 215, 0),
                    borderRadius: BorderRadius.circular(screenWidth * 0.05 + 10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                        3,
                            (index) => InkWell(
                          onTap: () {
                            setState(() {
                              if (index == 1) {
                                ///发布页单独控制
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostPage()));
                              } else {
                                _currentIndex = index;
                                _pageController.animateToPage(_currentIndex,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              }
                            });
                          },
                          child: Container(
                            width: screenWidth * 0.1,
                            height: screenWidth * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius:
                                BorderRadius.circular(screenWidth * 0.05)),
                            child: (_currentIndex == index)
                                ? contentList[index].selected
                                : contentList[index].unSelected,
                          ),
                        ))
                  ],
                ),
              ),
            )
          ),
        ),

    );
  }
}
