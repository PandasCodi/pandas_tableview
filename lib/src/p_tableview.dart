import 'package:flutter/material.dart';
import 'package:pandas_tableview/src/p_tableview_content.dart';
import 'package:pandas_tableview/src/p_tableview_header.dart';
import 'package:pandas_tableview/src/p_tableview_pagination.dart';

class PTableView extends StatefulWidget {
  final PTableViewHeader header;
  final PTableViewContent content;
  final PTableViewPagination pagination;
  final Color? paginationBackgroundColor;
  final double headerHeight;
  final BorderRadius? borderRadius;
  final double? fixedHeight;

  const PTableView(
      {Key? key, required this.header, required this.content, this.paginationBackgroundColor, required this.pagination, required this.headerHeight, this.borderRadius, this.fixedHeight})
      : super(key: key);

  @override
  State<PTableView> createState() => _PTableViewState();
}

class _PTableViewState extends State<PTableView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) =>
        ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.zero,
          child: SizedBox(
            height: widget.fixedHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConstrainedBox(constraints: BoxConstraints(
                              minWidth: constraints.maxWidth
                          ), child: SizedBox(
                              height: widget.headerHeight,
                              child: widget.header),),
                          widget.fixedHeight != null ? Expanded(child:
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: constraints.maxWidth
                            ),
                            child: widget.content,
                          ),): widget.content,
                        ],
                      ),
                    )
                ),),
                widget.pagination != null ? Container(
                  color: widget.paginationBackgroundColor ?? Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: widget.pagination,
                  ),
                ) : SizedBox.shrink()
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
