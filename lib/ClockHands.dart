import 'dart:async';
import 'HandHr.dart';
import 'HandMin.dart';
import 'package:flutter/material.dart';

class ClockHands extends StatelessWidget {
  final DateTime dateTime;
  final bool showHourHandleHeartShape;

  ClockHands({this.dateTime, this.showHourHandleHeartShape = false});

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
        aspectRatio: 1.0,
        child: new Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: new Stack(fit: StackFit.expand, children: <Widget>[
              new CustomPaint(
                painter: new HourHandPainter(
                    hours: dateTime.hour, minutes: dateTime.minute),
              ),
              new CustomPaint(
                painter: new MinuteHandPainter(
                    minutes: dateTime.minute, seconds: dateTime.second),
              ),
            ])));
  }
}
