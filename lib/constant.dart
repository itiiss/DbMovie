import 'package:flutter/material.dart';

const Color darkmode = Colors.white;
const Color lightmode = Colors.black;
const Color cyan = Color.fromARGB(255, 98, 216, 232);
const List<String> backimage = [
  'https://www.asianpaints.com/content/dam/asian_paints/colours/swatches/K085.png.transform/cc-width-720-height-540/image.png',
  'https://images.pexels.com/videos/3045163/free-video-3045163.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
];

Color oppositecolor = Colors.black;
Color uppermodecolor = darkmode;
Color canvasmodecolor = darkmode;
Color lowermodecolor = lightmode;
Color primaryColor = lightmode;
String selectedbackimg = backimage[1];
bool isDarkMode = true;

List<String> languageList = <String>['zh-CN', 'en-US'];
String language = languageList.first;
