import 'package:flutter/material.dart';
import 'package:pandas_tableview/src/p_tableview_content.dart';
import 'package:pandas_tableview/src/p_tableview_header.dart';

class PTableView extends StatelessWidget {
  final PTableViewHeader header;
  final PTableViewContent content;
  final double headerHeight;
  final BorderRadius? borderRadius;
  final double? fixedHeight;
  const PTableView({Key? key, required this.header, required this.content, required this.headerHeight, this.borderRadius, this.fixedHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        height: fixedHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: headerHeight,
                child: header),
            fixedHeight != null ? Expanded(child: content) : content,
          ],
        ),
      ),
    );
  }
}
