import 'package:flutter/material.dart';

class BackImage extends StatelessWidget {
  const BackImage({Key? key, required this.backImage}) : super(key: key);

  final String backImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
