import 'package:douban/constant.dart';
import 'package:douban/index.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: darkmode);

  TextStyle itemStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: darkmode);

  void toggleDarkMode(val) {
    isDarkMode = val;
    if (val) {
      setState(() {
        canvasmodecolor = Colors.black54;
        uppermodecolor = darkmode;
        oppositecolor = Colors.black54;
        selectedbackimg = backimage[1];
      });
    } else {
      setState(() {
        canvasmodecolor = Colors.white54;
        uppermodecolor = lightmode;
        oppositecolor = Colors.white70;
        selectedbackimg = backimage[0];
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Index(index: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设置',
              style: TextStyle(
                fontSize: 24,
                color: darkmode,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '通用',
                  style: headingStyle,
                )
              ],
            ),
            ListTile(
              iconColor: darkmode,
              textColor: darkmode,
              leading: const Icon(Icons.language),
              title: const Text('语言'),
              trailing: DropdownButton(
                value: language,
                underline: Container(height: 0),
                onChanged: (value) {
                  setState(() {
                    language = value!;
                  });
                },
                items: languageList.map<DropdownMenuItem<String>>((v) {
                  return DropdownMenuItem<String>(
                    value: v,
                    child: Text(
                      v,
                      style: itemStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            ListTile(
              iconColor: darkmode,
              textColor: darkmode,
              leading: const Icon(Icons.dark_mode),
              title: const Text("黑暗模式"),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (val) {
                  toggleDarkMode(val);
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
