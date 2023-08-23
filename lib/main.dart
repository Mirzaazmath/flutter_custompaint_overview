import 'dart:ui';

import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Paint Triangle"),
      ),

      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: CustomPaint(
            painter: MyCustomPainter(),

          ),
        ),

      ),
    );
  }
}
class MyCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
/*
* Adds a quadratic bezier segment that curves from the current point to the point at the offset (x2,y2)
*  from the current point, using the control point at the offset (x1,y1) from the current point.*/


    // CREATING THE BRUSH
    Paint brush=Paint()..strokeWidth=5..color=Colors.blueAccent..style = PaintingStyle.fill;

    Path qbezier=Path();
    // MOVE THE STARTING POINT
    qbezier.moveTo(0, size.height/2);
    // DEFINING THE PATH FOR QUADRATIC BEZIER CURVE
    // SYNTAX
    // DX DY DEFINES THE CONTROL POINT OFFSET
    // 2DX 2DY DEFINES THE ENDPOINT OFFSET
    // THE LAST OR SAY OUR FIRST POINT WILL BE OUR CURRENT POINT
    //qbezier.relativeQuadraticBezierTo(DX, DY, 2DX, 2DY);

    qbezier.relativeQuadraticBezierTo(size.width/2, -size.height/2, size.width, 0);
    // DRAWING THE QUADRATIC BEZIER CURVE
    canvas.drawPath(qbezier, brush);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}



