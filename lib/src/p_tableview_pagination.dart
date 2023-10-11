import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

class PTableViewPagination extends StatelessWidget {
  ///Starts from 0
  final int currentPage;
  final int pagesCount;
  final int pagesVisible;
  final Function(int) onPageChanged;

  const PTableViewPagination(
      {Key? key,
        required this.currentPage,
        this.pagesVisible = 4,
        required this.pagesCount,
        required this.onPageChanged})
      : super(key: key);

  List<int> get visiblePagesRange {
    final listNotLimited = List.generate(pagesVisible * 2, (index) => currentPage - pagesVisible + index).toList();
    return listNotLimited.where((e) => e >= 0 && e < pagesCount).toList();
  }

  @override
  Widget build(BuildContext context) {
    final elements = visiblePagesRange.asMap().values.map((i) => GestureDetector(
      onTap: (){
        onPageChanged.call(i);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            width: 30,
            height: 30,
            decoration: i != currentPage
                ? null
                : BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(
                      color: i == currentPage
                          ? Colors.black
                          : Color(0xFF8B8B8B)),
                ))),
      ),
    ));
    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
              cursor: SystemMouseCursors.click, child: GestureDetector(
              onTap: () => onPageChanged.call(max(currentPage - 1, 0)),
              child: Icon(Icons.arrow_left))),
          ...elements,
          MouseRegion(
              cursor: SystemMouseCursors.click, child: GestureDetector(
              onTap: () => onPageChanged.call(min(currentPage + 1, pagesCount - 1)),
              child: Icon(Icons.arrow_right))),
        ],
      ),
    );
  }
}