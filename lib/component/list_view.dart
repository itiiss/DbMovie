import 'package:douban/model/models.dart';
import 'package:douban/page/detail/movie_detail.dart';
import 'package:flutter/material.dart';

class ListViewData extends StatelessWidget {
  const ListViewData({Key? key, required this.future, required this.type})
      : super(key: key);

  final Future future;
  final ShowType type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(
                          id: snapshot.data[index].id,
                          type: type,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 115,
                    margin:
                        const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 2,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 115,
                  margin: const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.asset(
                      'assets/custommovieimage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
