import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  ///```
  ///key - Title
  ///value - CheckList
  ///value String first value
  ///0 - false
  ///1 - true
  ///```
  ///1 ~ length
  ///String value
  Map<String, List<String>> todo = {
    "" : [ "0쇼케이스 불끄기", "0자동문 잠그기", "0카트 다 안에 넣기", "0컴퓨터 전원 끄기", "0컴퓨터 멀티탭 끄기", "0계산대 멀티탭 끄기", "0콘센트 뽑기", "0페기 냉장고에 넣기", "0냉장고 불 끄기 ", "0냉동고 불 끄기", "0화장실 불 끄기", "0문 잠그기", "0문 방범 확인하기", "0위에 문 방범 확인하기", ],
    "te123 st 123" : [ "0askdasj", "0askdasj" ],
  };

  TimeOfDay resetTime = const TimeOfDay(hour: 0, minute: 0);

  void setTime(TimeOfDay t) {
    resetTime = t;
    notifyListeners();
  }

  void setData(String key, List<String> value) {
    todo[key] = value;
    notifyListeners();
  }

  void setDataWithString(String key, int index, String value) {
    if(index >= todo[key]!.length) {
      todo[key]!.add(value);
    } else {
      todo[key]![index] = value;
    }
    notifyListeners();
  }
}