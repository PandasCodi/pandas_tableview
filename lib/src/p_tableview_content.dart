import 'package:flutter/material.dart';
import 'package:pandas_tableview/src/p_tableview_pagination.dart';

import 'p_tableview_column.dart';

class PTableViewContent extends StatefulWidget {
  final Widget? divider;
  final Color? backgroundColor;
  final List<PTableViewColumn> columns;
  final PTableViewPagination? pagination;
  final EdgeInsets? contentPadding;
  final Decoration? decoration;

  const PTableViewContent({Key? key, this.divider, required this.columns, this.backgroundColor, this.decoration, this.contentPadding, this.pagination})
      : super(key: key);

  @override
  State<PTableViewContent> createState() => _PTableViewContentState();
}

class _PTableViewContentState extends State<PTableViewContent> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      decoration: widget.decoration,
      padding: widget.contentPadding ?? EdgeInsets.zero,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...widget.columns
              .map((e) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [e, widget.divider ?? SizedBox.shrink()],
                  ))
              .toList(),
              Spacer(),
              widget.pagination ?? SizedBox.shrink()],),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
