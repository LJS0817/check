import 'package:checking/dataProvider.dart';
import 'package:checking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckContainer extends StatelessWidget {
  CheckContainer(String Key, String data, int idx, {super.key}) {
    isChecked = data[0] == "0" ? false : true;
    title = data.substring(1);
    index = idx;
    _key = Key;
  }

  bool isChecked = false;
  String title = "";
  int index = 0;
  String _key = "";

  String getData() {
    return "${isChecked ? "1" : "0"}${title}";
  }

  bool isNotGroup() {
    return _key == "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: isNotGroup() ? BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(20),
      ) : null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: themeColor.withOpacity(0.4),
            splashColor: themeColor.withOpacity(0.4),
            onTap: () {
              isChecked = !isChecked;
              Provider.of<DataProvider>(context, listen: false).setDataWithString(_key, index, getData());
            },
            child: Container(
                padding: isNotGroup() ? const EdgeInsets.symmetric(horizontal: 35) : const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                height: isNotGroup() ? 50 : 30,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isNotGroup() ? title : "•  ${title}",
                      style: const TextStyle(
                        color: themeColor,
                        fontSize: 16,
                      ),
                    ).animate(target: isChecked ? 1 : 0).fade(begin: 1, end: 0.3),
                    Stack(
                      children: [
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/icon/circle.svg',
                            color: themeColor,
                          ).animate(target: isChecked ? 0 : 1).fade(),
                        ),
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/icon/check.svg',
                            color: themeColor,
                          ).animate(target: isChecked ? 1 : 0).fade(),
                        )
                      ],
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }
}

