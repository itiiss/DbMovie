import 'package:douban/component/list_view.dart';
import 'package:douban/component/title_bar.dart';
import 'package:douban/service/service.dart';
import 'package:flutter/material.dart';

import '../more/more.dart';

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        TitleBar(title: '最受欢迎', navigate: More()),
        ListViewData(future: ApiService().getPopularMovie(), type: 'Movie'),
        TitleBar(title: '最高评分', navigate: More()),
        ListViewData(future: ApiService().getTopRatedMovie(), type: 'Movie'),
        TitleBar(title: '即将上印', navigate: More()),
        ListViewData(future: ApiService().getUpcomingMovie(), type: 'Movie'),
        TitleBar(title: '正在热播', navigate: More()),
        ListViewData(future: ApiService().getNowPlayingMovie(), type: 'Movie')
      ],
    );
  }
}
