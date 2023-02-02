import 'package:douban/component/back_image.dart';
import 'package:douban/page/home/home.dart';
import 'package:douban/page/more/more.dart';
import 'package:douban/page/search/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'constant.dart';

class Index extends StatefulWidget {
  Index({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var pages = [
    const Home(),
    const More(),
    const Search(),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: oppositecolor),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              BackImage(backImage: selectedbackimg),
              pages[widget.index],
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            height: 60,
            index: widget.index,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.menu,
                size: 30,
                color: uppermodecolor,
              ),
            ],
            color: Colors.white10,
            buttonBackgroundColor: Colors.white10,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) => setState(() => widget.index = index),
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
