import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  };

  TimeOfDay resetTime = const TimeOfDay(hour: 0, minute: 0);

  DataProvider() {
    init();
  }

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();
    for (int i = 0; i < keys.length; i++) {
      log(keys.elementAt(i));
      if (keys.elementAt(i) == "time") {
        resetTime = TimeOfDay(
            hour: int.parse(prefs.getString("time")!.split(':')[0]),
            minute: int.parse(prefs.getString("time")!.split(':')[1]));
      } else {
        log(prefs.getStringList(keys.elementAt(i)).toString());
        todo[keys.elementAt(i)] = prefs.getStringList(keys.elementAt(i))!;
      }
    }
  }

  void setTime(TimeOfDay t) async {
    resetTime = t;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('time', "${resetTime.hour}:${resetTime.minute}");
    // SharedPreferences
    notifyListeners();
  }

  void setData(String key, List<String> value) async {
    todo[key] = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
    notifyListeners();
  }

  void setDataWithString(String key, int index, String value) async {
    if(todo[key] == null) {
      todo[key] = [];
    }
    if(index >= todo[key]!.length) {
      todo[key]!.add(value);
    } else {
      todo[key]![index] = value;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, todo[key]!);
    notifyListeners();
  }
}