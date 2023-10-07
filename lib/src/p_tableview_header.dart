import 'package:flutter/material.dart';
import 'package:pandas_tableview/src/p_tableview_rows.dart';

class PTableViewHeader extends StatelessWidget {
  final Color backgroundColor;
  final List<PTableViewRow> rows;
  final EdgeInsets? contentPadding;
  const PTableViewHeader({Key? key, required this.rows, required this.backgroundColor, this.contentPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: contentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: rows,
      ),
    );
  }
}
