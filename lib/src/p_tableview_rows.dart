import 'package:flutter/material.dart';

abstract class PTableViewRow extends StatelessWidget {
  final Widget child;
  const PTableViewRow({Key? key, required this.child}) : super(key: key);
}

class PTableViewRowFractional extends PTableViewRow{
  final int flex;
  const PTableViewRowFractional({super.key, this.flex = 1, required super.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: child);
  }
}

class PTableViewRowFixed extends PTableViewRow{
  final double width;

  const PTableViewRowFixed({super.key,
    required this.width, required super.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: child,);
  }
}

