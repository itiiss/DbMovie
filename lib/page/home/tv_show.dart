import 'package:douban/model/models.dart';
import 'package:flutter/material.dart';

import '../../component/list_view.dart';
import '../../component/title_bar.dart';
import '../../service/service.dart';
import '../more/more.dart';

class TvShow extends StatefulWidget {
  const TvShow({Key? key}) : super(key: key);

  @override
  State<TvShow> createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        const TitleBar(title: '最受欢迎', navigate: More()),
        ListViewData(
          future: ApiService().getPopularTVshow(),
          type: ShowType.tvshow,
        ),
        const TitleBar(title: '最高评分', navigate: More()),
        ListViewData(
          future: ApiService().getTopRatedTVshow(),
          type: ShowType.tvshow,
        ),
        const TitleBar(title: '即将上印', navigate: More()),
        ListViewData(
          future: ApiService().getUpcomingTVshow(),
          type: ShowType.tvshow,
        ),
        const TitleBar(title: '正在热播', navigate: More()),
        ListViewData(
          future: ApiService().getNowPlayingTVshow(),
          type: ShowType.tvshow,
        )
      ],
    );
  }
}
