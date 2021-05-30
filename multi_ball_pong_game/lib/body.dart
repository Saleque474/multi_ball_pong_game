import 'package:flutter/material.dart';

import 'bat.dart';
import 'ball.dart';
import 'constaints.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  double height;
  double width;
  double batHeight;
  double batWidth;
  double batPosition = 40;
  AnimationController _controller;
  Animation _animation;
  List poses = [60, 70, 80, 90, 100, 110, 120, 130, 140, 150];
  Ball ball1 = Ball(posX: 60, posY: 60);
  Ball ball2 = Ball(posX: 70, posY: 70);
  Ball ball3 = Ball(posX: 80, posY: 80);
  Ball ball4 = Ball(posX: 90, posY: 90);
  Ball ball5 = Ball(posX: 100, posY: 100);
  Ball ball6 = Ball(posX: 110, posY: 110);
  Ball ball7 = Ball(posX: 120, posY: 120);
  Ball ball8 = Ball(posX: 130, posY: 130);
  Ball ball9 = Ball(posX: 140, posY: 140);
  Ball ball10 = Ball(posX: 150, posY: 150);
  List<Ball> balls;

  Future showMessage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gave Over"),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Text("Your Score is : $score"),
                  Text(" Would You like to play again? ")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    for (int i = 0; i < balls.length; i++) {
                      balls[i].reset(poses[i], poses[i]);
                    }
                    _controller.repeat();
                  },
                  child: Text("Yes")),
              TextButton(onPressed: null, child: Text("No"))
            ],
          );
        });
  }

  @override
  void initState() {
    balls = [
      ball1,
      ball2,
      ball3,
      ball4,
      ball5,
      ball6,
      ball7,
      ball8,
      ball9,
      ball10
    ];
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 10000));
    _animation = Tween(begin: 0, end: 1).animate(_controller);
    _animation.addListener(() {
      setState(() {
        for (int i = 0; i < balls.length; i++) {
          balls[i].ballRun();
          balls[i].checkBorder(
              batHeight: batHeight,
              batWidth: batWidth,
              height: height,
              width: width,
              batPosition: batPosition,
              controller: _controller,
              context: context,
              showMessage: showMessage);
        }
      });
    });
    _controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      batHeight = height / 25;
      batWidth = width / 4;
      return GestureDetector(
        onHorizontalDragUpdate: (update) {
          setState(() {
            batPosition += update.delta.dx;
          });
        },
        child: Stack(children: [
          Positioned(
              bottom: 0,
              left: batPosition,
              child: Bat(batHeight: batHeight, batWidth: batWidth)),
          ...balls
              .map(
                (Ball ball) =>
                    Positioned(bottom: ball.posY, left: ball.posX, child: ball),
              )
              .toList(),
          Positioned(
            top: 40,
            right: 40,
            child: Text("Score : $score"),
          ),
          Container(),
        ]),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
