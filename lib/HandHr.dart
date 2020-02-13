import 'dart:math';
import 'package:flutter/material.dart';

class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint;
  int hours;
  int minutes;

  HourHandPainter({this.hours, this.minutes}) : hourHandPaint = new Paint() {
    hourHandPaint.color = Colors.white;
    hourHandPaint.style = PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 6;
    hourHandPaint.strokeCap = StrokeCap.square;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));
    Path path = new Path();

    path.moveTo(0.0, -radius * 0.6);
    path.lineTo(0.0, radius * -0.09);
    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) {
    return true;
  }
}
