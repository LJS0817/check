import 'dart:developer';

import 'package:checking/check.dart';
import 'package:checking/dataProvider.dart';
import 'package:checking/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String DEFAULT_TITLE = "Untitle";

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider data = Provider.of<DataProvider>(context);
    return Container(
        padding: const EdgeInsets.only(right: 30, left: 20, top: 20, bottom: 5),
        width: double.maxFinite,
        height: 105,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "오늘 할 일",
                    style: TextStyle(
                      color: themeColor,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      highlightColor: themeColor.withOpacity(0.3),
                      splashColor: themeColor.withOpacity(0.3),
                      onTap: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          cancelText: "취소",
                          confirmText: "확인",
                          helpText: "시간 선택하기",
                          context: context,
                          initialTime: data.resetTime,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                textButtonTheme: TextButtonThemeData(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateColor.resolveWith((states) => themeColor),
                                  )
                                ),
                                timePickerTheme: TimePickerThemeData(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(color: backgroundColor2, width: 3),
                                  ),
                                  inputDecorationTheme: const InputDecorationTheme(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                  helpTextStyle: const TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  hourMinuteColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? themeColor : backgroundColor2),
                                  hourMinuteTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? backgroundColor2 : themeColor),
                                  entryModeIconColor: themeColor,
                                  backgroundColor: backgroundColor,
                                  dialBackgroundColor: backgroundColor2,
                                  dialHandColor: themeColor,
                                  dialTextColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? backgroundColor2 : themeColor),
                                )
                              ),
                              child: child!,
                            );
                          }
                        );
                        if (timeOfDay != null) {
                          data.setTime(timeOfDay);
                        }
                      },
                      child: Container(
                        width: 155,
                        height: 44,
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "초기화 시간 - ${data.resetTime.hour < 10 ? "0${data.resetTime.hour}" : data.resetTime.hour}:${data.resetTime.minute < 10 ? "0${data.resetTime.minute}" : data.resetTime.minute}",
                              style: const TextStyle(
                                color: themeColor,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "터치하여 재설정하기",
                              style: TextStyle(
                                color: themeColor.withOpacity(0.4),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
            Material(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: themeColor.withOpacity(0.3),
                highlightColor: themeColor.withOpacity(0.3),
                onTap: () {
                  data.setDataWithString("", data.todo[""]!.length, "0");
                },
                onLongPress: () {
                  data.setDataWithString(data.todo[DEFAULT_TITLE] != null ? "$DEFAULT_TITLE ${data.todo.keys.toString().split(DEFAULT_TITLE).length}" : DEFAULT_TITLE, data.todo[DEFAULT_TITLE] == null ? 0 : data.todo[DEFAULT_TITLE]!.length, "0");
                },
                child: const SizedBox(
                  width: 53,
                  height: 53,
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.37,
                      color: themeColor,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}