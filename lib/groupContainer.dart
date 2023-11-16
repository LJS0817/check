import 'dart:developer';

import 'package:checking/check.dart';
import 'package:checking/checkContainer.dart';
import 'package:checking/dataProvider.dart';
import 'package:checking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

const double TITLE_FONT_SIZE = 16;

class GroupContainer extends StatelessWidget {
  GroupContainer(String t, List<String> d, {super.key}) {
    title = t;
    data = d;
    width = getTitleLengthToWidth();
  }

  double? getTitleLengthToWidth() {
    double? result = double.maxFinite;

    result = title.length * TITLE_FONT_SIZE;
    result -= title.split(' ').length * 10;

    return result;
  }

  List<String> data = [];
  String title = "";
  double? width = 0;

  @override
  Widget build(BuildContext context) {
    if(title == "") {
      return ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CheckContainer(title, data[index], index);
              }
          )
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(0, 3),
            child: Container(
              height: 40,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                border: Border.all(width: 3, color: backgroundColor2),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: themeColor,
                  fontSize: TITLE_FONT_SIZE,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
              border: Border.all(width: 3, color: backgroundColor2),
            ),
            child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length + 1,
                    itemBuilder: (context, index) {
                      if(index < data.length) {
                        return CheckContainer(title, data[index], index);
                      } else {
                        return Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: themeColor.withOpacity(0.4),
                              highlightColor: themeColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                data.add("0");
                                Provider.of<DataProvider>(context, listen: false).setData(title, data);
                              },
                              child: Text(
                                "+",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: themeColor.withOpacity(0.5),
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }
                )
            ),
          )
        ],
      );
    }

  }
}