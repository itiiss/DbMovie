import 'package:douban/constant.dart';
import 'package:douban/page/home/feed.dart';
import 'package:douban/page/home/movie.dart';
import 'package:douban/page/home/tv_show.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Image.asset('assets/tmdb.png', width: 180, height: 90),
        ),
        const SizedBox(
          height: 10,
        ),
        TabBar(
          controller: tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '主页',
                style: TextStyle(
                    fontSize: 20,
                    color: uppermodecolor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '电影',
                style: TextStyle(
                    fontSize: 20,
                    color: uppermodecolor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '电视剧',
                style: TextStyle(
                    fontSize: 20,
                    color: uppermodecolor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 630,
          child: TabBarView(
            controller: tabController,
            children: const [
              Feed(),
              Movie(),
              TvShow(),
            ],
          ),
        )
      ],
    );
  }
}
