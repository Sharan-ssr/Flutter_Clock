import 'dart:async';
import 'Dial.dart';
import 'ClockHands.dart';
import 'Style.dart';
import 'package:flutter/material.dart';
import 'ClockStyle.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {
  final Color circleColor;

  final ClockText clockText;

  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  Clock(
      {this.circleColor = Colors.black,
      this.clockText = ClockText.arabic,
      this.getCurrentTime = getSystemTime,
      this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: buildClockCircle(context),
    );
  }

  Container buildClockCircle(BuildContext context) {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          new BoxShadow(
            offset: new Offset(0.0, 0.0),
            blurRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          new ClockFace(
            clockText: widget.clockText,
            dateTime: dateTime,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: new CustomPaint(
              painter: new ClockDialPainter(clockText: widget.clockText),
            ),
          ),
          new ClockHands(dateTime: dateTime),
        ],
      ),
    );
  }
}
