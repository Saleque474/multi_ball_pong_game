import 'package:flutter/material.dart';

class Bat extends StatelessWidget {
  const Bat({
    Key key,
    @required this.batHeight,
    @required this.batWidth,
  }) : super(key: key);

  final double batHeight;
  final double batWidth;

  @override
  Widget build(BuildContext context) {
    return Container(height: batHeight, width: batWidth, color: Colors.purple);
  }
}
