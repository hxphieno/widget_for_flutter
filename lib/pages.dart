import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

///首先是三个图标对应的页面：主页，个人页，发布页
///主页要做成带Scroll可滚动
///个人页用来控制点击事件，目前做成Stateless关系不大
///目前发布页关系不大

class HomePage extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  bool valid=true;///防止函数被多次执行

  @override
  Widget build(BuildContext context) {
    final gestNotifier=Provider.of<GestNotifier>(context);
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          controller: _controller
            ..addListener(() async {
              if(valid){
                if (_controller.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  valid=false;
                  gestNotifier.toBeFalse();
                  await Future.delayed(const Duration(milliseconds: 200));
                  valid=true;
                } else if (_controller.position.userScrollDirection ==
                    ScrollDirection.forward) {
                  valid=false;
                  gestNotifier.toBeTrue();
                  await Future.delayed(const Duration(milliseconds: 200));
                  valid=true;
                }
              }
            }),
          children: [
            ...List.generate(
                100,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 400,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 255, 215, 0)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("Message $index",
                              style: const TextStyle(fontSize: 20))),
                    ))
          ],
        ));
  }
}

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gestNotifier=Provider.of<GestNotifier>(context);
    return GestureDetector(
      onTap: (){
        gestNotifier.toBeTrue();
      },
      child: const Center(
        child: Text('Personal Page')
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Post Page"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Post Page'),
        ));
  }
}
