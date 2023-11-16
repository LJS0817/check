import 'package:checking/main.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

//요일을 넘겨준다.
  String getWeekday(int i) {
    switch(i) {
      case 1: return "월요일";
      case 2: return "화요일";
      case 3: return "수요일";
      case 4: return "목요일";
      case 5: return "금요일";
      case 6: return "토요일";
      case 7: return "일요일";
      default: return "월요일";
    }
  }


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${now.month} / ${now.day}",
                style: const TextStyle(
                  color: themeColor,
                  fontSize: 30,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                now.year.toString(),
                style: const TextStyle(
                  color: themeColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            getWeekday(now.weekday),
            style: const TextStyle(
              color: themeColor,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
