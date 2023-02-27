import 'package:douban/constant.dart';
import 'package:douban/model/models.dart';
import 'package:douban/service/service.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key, required this.id, required this.type})
      : super(key: key);

  final int id;
  final ShowType type;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: oppositecolor),
      home: Scaffold(
        body: FutureBuilder(
          future: type == ShowType.movie
              ? ApiService().getMovieDetail(id.toString())
              : ApiService().getTVDetail(id.toString()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        child: (snapshot.data?.backdropPath == null)
                            ? Container(
                                height: 300, width: 1000, color: uppermodecolor)
                            : SizedBox(
                                height: 300,
                                width: 1000,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(30)),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/original/${snapshot.data.backdropPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 30,
                        ),
                        child: Text(
                          snapshot.data.title,
                          style: TextStyle(
                            fontSize: 24,
                            color: uppermodecolor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 26,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 9,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.blueGrey,
                            ),
                            child: Text(
                              snapshot.data.releaseDate
                                      ?.toString()
                                      .substring(0, 4) ??
                                  'N/A',
                              style: TextStyle(
                                  fontSize: 14, color: uppermodecolor),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '|',
                            style:
                                TextStyle(fontSize: 30, color: uppermodecolor),
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 25,
                              ),
                              Text(
                                snapshot.data.voteAverage.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: uppermodecolor,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '|',
                            style:
                                TextStyle(fontSize: 30, color: uppermodecolor),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '${snapshot.data.runtime} min',
                            style:
                                TextStyle(fontSize: 16, color: uppermodecolor),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          snapshot.data.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 16,
                          style: TextStyle(
                            fontSize: 18,
                            color: uppermodecolor,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 2,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: Center(
                          child: Text(
                            '在线观看',
                            style: TextStyle(
                              fontSize: 22,
                              color: uppermodecolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
