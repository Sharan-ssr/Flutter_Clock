import 'Style.dart';
import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          width: 280.0,
          height: 280,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage("assets/1.jpg"),
            ),
          ),
          child: new Stack(
            children: <Widget>[
              //centerpoint
              new Center(
                child: new Container(
                  width: 19.0,
                  height: 19.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
