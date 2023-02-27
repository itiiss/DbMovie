import 'package:carousel_slider/carousel_slider.dart';
import 'package:douban/component/list_view.dart';
import 'package:douban/component/title_bar.dart';
import 'package:douban/constant.dart';
import 'package:douban/model/models.dart';
import 'package:douban/page/detail/movie_detail.dart';
import 'package:douban/page/more/more.dart';
import 'package:flutter/material.dart';

import '../../service/service.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Widget banner() {
    return FutureBuilder(
        future: ApiService().getTrendingAll(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: 10,
                itemBuilder: (context, index, realIndex) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(
                              id: snapshot.data[index].id,
                              type: ShowType.movie,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Stack(children: <Widget>[
                            Image.network(
                              'https://image.tmdb.org/t/p/original/${snapshot.data[index].posterPath}',
                              fit: BoxFit.fill,
                            )
                          ]),
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  aspectRatio: 9 / 9,
                  autoPlay: true,
                  viewportFraction: 1,
                ));
          } else {
            return CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) => Container(
                width: 270,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              options: CarouselOptions(
                aspectRatio: 9 / 9,
                autoPlay: true,
                viewportFraction: 0.9,
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        banner(),
        const TitleBar(title: '热门电影', navigate: More()),
        ListViewData(
          future: ApiService().getTrendingMovie(),
          type: ShowType.movie,
        ),
        const TitleBar(title: '热门电视剧', navigate: More()),
        ListViewData(
          future: ApiService().getTrendingTVshow(),
          type: ShowType.tvshow,
        ),
      ],
    );
  }
}
