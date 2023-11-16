import 'package:checking/checkContainer.dart';
import 'package:checking/dataProvider.dart';
import 'package:checking/groupContainer.dart';
import 'package:checking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class CheckList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DataProvider data = Provider.of<DataProvider>(context);
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          shrinkWrap: true,
          itemCount: data.todo.length,
          itemBuilder: (context, index) {
            return GroupContainer(data.todo.keys.elementAt(index), data.todo.values.elementAt(index));
          },
        ),
      ),
    );
  }
}
