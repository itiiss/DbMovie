import 'package:douban/constant.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key, required this.title, required this.navigate})
      : super(key: key);

  final String title;
  final Widget navigate;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: uppermodecolor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '全部',
              style: TextStyle(
                fontSize: 18,
                color: uppermodecolor,
                fontWeight: FontWeight.w100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
