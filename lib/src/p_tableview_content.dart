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
  final Function(int)? onTap;

  const PTableViewContent(
      {Key? key, this.divider, required this.columns, this.onTap, this.backgroundColor, this.decoration, this.contentPadding, this.pagination})
      : super(key: key);

  @override
  State<PTableViewContent> createState() => _PTableViewContentState();
}

class _PTableViewContentState extends State<PTableViewContent> {
  var _scrollController = ScrollController();
  int _highlightIndex = -1;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Container(
          height: 200,
            color: widget.backgroundColor,
            decoration: widget.decoration,
            child: RawScrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...widget.columns
                      .asMap()
                      .entries
                      .map((e) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(onTap: () => widget.onTap?.call(e.key),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) {
                                  setState(() {
                                    _highlightIndex = e.key;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _highlightIndex = -1;
                                  });
                                },
                                child: Container(
                                  color: _highlightIndex == e.key ? Colors.grey
                                      .withOpacity(0.2) : Colors.transparent,
                                  child: Container(
                                    padding: widget.contentPadding ?? EdgeInsets.zero,
                                    child: e.value,
                                  ),
                                ),
                              )), widget.divider ?? SizedBox.shrink()],
                      ))
                      .toList(),
                  ],),
              ),
            )
        )
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

