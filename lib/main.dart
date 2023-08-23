import 'package:flutter/material.dart';
import 'dart:math';

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
    * NOTE : YOU NEED A BOUNDING BOX , A START ANGLE AND A SWEEP ANGLE TO DRAW AN ARC*/


    // CREATING THE BRUSH
    Paint brush=Paint()..strokeWidth=5..color=Colors.blueAccent..style = PaintingStyle.stroke;

     // DEFINING THE CENTER
     final arcCenter = Offset(size.width/2,size.height/2 );
     // CREATING THE RECT WITH CENTER AND RADIUS
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    // ASSIGNING THE START ANGLE
    // degreesToRads IT USE TO CONVERT DEGREE TO RADIAN
    final startAngle = degreesToRads(0);
    // ASSIGNING THE SWEEP OR END ANGLE
    final sweepAngle = degreesToRads(90);
    // CREATING THE ARC
    // SYNTAX
  //  canvas.drawArc(RECT OR CIRCLE, startAngle, sweepAngle, false, brush);

    canvas.drawArc(arcRect, startAngle, sweepAngle,true, brush);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}

// CONVERTING THE DEGREE TO RADIAN TO FORM AN ANGLE
double degreesToRads(num deg) {
  return (deg * pi) / 180.0;
}

