import 'package:checking/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class CheckList extends StatefulWidget {
  CheckList({super.key});

  List<List<dynamic>> todo = [
    [ "쇼케이스 불끄기", false ],

    [ "자동문 잠그기", false ],
    [ "카트 다 안에 넣기", false ],

    [ "컴퓨터 전원 끄기", false ],
    [ "컴퓨터 멀티탭 끄기", false ],
    [ "계산대 멀티탭 끄기", false ],
    [ "콘센트 뽑기", false ],

    [ "페기 냉장고에 넣기", false ],
    [ "냉장고 불 끄기 ", false ],
    [ "냉동고 불 끄기", false ],
    [ "화장실 불 끄기", false ],

    [ "문 잠그기", false ],
    [ "문 방범 확인하기", false ],
    [ "위에 문 방범 확인하기", false ],
  ];

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          shrinkWrap: true,
          itemCount: widget.todo.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: themeColor.withOpacity(0.4),
                    splashColor: themeColor.withOpacity(0.4),
                    onTap: () {
                      setState(() {
                        widget.todo[index][1] = !widget.todo[index][1];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        height: 50,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.todo[index][0],
                              style: const TextStyle(
                                color: themeColor,
                                fontSize: 16,
                              ),
                            ).animate(target: widget.todo[index][1] ? 1 : 0).fade(begin: 1, end: 0.3),
                            Stack(
                              children: [
                                Positioned(
                                  child: SvgPicture.asset(
                                    'assets/icon/circle.svg',
                                    color: themeColor,
                                  ).animate(target: widget.todo[index][1] ? 0 : 1).fade(),
                                ),
                                Positioned(
                                  child: SvgPicture.asset(
                                    'assets/icon/check.svg',
                                    color: themeColor,
                                  ).animate(target: widget.todo[index][1] ? 1 : 0).fade(),
                                )
                              ],
                            ),
                          ],
                        )
                    )
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
