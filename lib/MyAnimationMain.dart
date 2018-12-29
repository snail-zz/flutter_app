import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyAnimationMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAnimationState();
  }
}

class _MyAnimationState extends State<MyAnimationMain>
    with TickerProviderStateMixin {
  final random = new Random();
  int dataset = 50;
  AnimationController animationController;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 400));

    tween = new Tween(begin: 0.0, end: dataset.toDouble());
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      dataset = random.nextInt(100);
      tween = new Tween(
          begin: tween.evaluate(animationController), end: dataset.toDouble());

      animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('动画'),
      ),
      body: new Center(
          child: new CustomPaint(
        size: new Size(200.0, 100.0),
        painter: new BarChartPainter(tween.animate(animationController)),
      )),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 100.0;

  final Animation<double> animation;

  BarChartPainter(Animation<double> animation)
      : animation = animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double barHeight = animation.value;

    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        new Rect.fromLTWH(size.width - barWidth / 2, size.height - barHeight,
            barWidth, barHeight),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter old) {
    // TODO: implement shouldRepaint
    return false;
  }
}
