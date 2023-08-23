import 'dart:math';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration:const  Duration(seconds: 3));
    _controller.forward();
    _controller.addListener(() {
      if(_controller.isCompleted){
        _controller.reverse();
      }else if(_controller.isDismissed){
        _controller.forward();
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Paint"),
        elevation: 0,
      ),

      body: Center(
        child: AnimatedBuilder(
          builder: (context,_) {

            return Container(
              height: 300,
              width: 300,
              color: Colors.white,
              child: CustomPaint(
                painter: MyCustomPainter(_controller.value),

              ),
            );
          }, animation: _controller,
        ),

      ),
    );
  }
}

class MyCustomPainter extends CustomPainter{
   double chargevalue;
   MyCustomPainter(this.chargevalue);
  @override
  void paint(Canvas canvas, Size size) {

    // CREATING THE BRUSH
    //CREATING PAINT FOR BORDER
    Paint borderpaint=Paint()..strokeWidth=4..color=Colors.black..style = PaintingStyle.stroke;
    //CREATING PAINT FOR NOTCH
    Paint notchpaint=Paint()..color=Colors.black..style = PaintingStyle.fill;
    // CREATING THE PAINT FOR CHARGE
    Paint chargepaint=Paint()..color=Colors.green..style = PaintingStyle.fill;


    // MARGIN
    final margin=5;

//  CREATING THE RECTANGLE
    Rect rect= Rect.fromLTWH(size.width*0.1, size.height*0.35, 200, 100);

// ADD BORDER RADIUS TO THE RECTANGLE
   RRect batteryshape=  RRect.fromRectAndRadius(rect, Radius.circular(20));

// DRAWING THE BATTERY SHAPE RECTANGLE
   canvas.drawRRect(batteryshape, borderpaint);


   // CREATING THE RECTANGLE FOR NOTCH
    Rect notchrect= Rect.fromLTWH(size.width*0.1+180, size.height*0.42, 50, 50);

    
    // DRAWING THE ARC FROM NOTCH RECTANGLE
    canvas.drawArc(notchrect, degreesToRads(-90), degreesToRads(180), true, notchpaint);


    // CREATING THE RECTANGLE FOR CHARGE
    Rect chargerect= Rect.fromLTWH(size.width*0.1+margin, size.height*0.35+margin,chargevalue*190, 90);
    RRect chagre=  RRect.fromRectAndRadius(chargerect, Radius.circular(20));

// DRAWING THE CHARGE SHAPE RECTANGLE
    canvas.drawRRect(chagre, chargepaint);








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