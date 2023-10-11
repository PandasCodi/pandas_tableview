import 'package:flutter/material.dart';
import 'package:pandas_tableview/src/p_tableview_rows.dart';

class PTableViewColumn extends StatelessWidget {
  final List<PTableViewRow> rows;
  const PTableViewColumn({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rows
      )
    );
  }
}
