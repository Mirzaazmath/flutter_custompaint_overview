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
    // CREATING THE BRUSH
    Paint brush=Paint()..strokeWidth=5..color=Colors.blueAccent..style = PaintingStyle.stroke;

    // DRAWING THE Oval IN CANVAS
// DRAW OVAL REQUIRED RECT SO WE ARE CREATING RECT FROM CENTER OF OUR CANVAS
// RECT SYNTAX
   // final Rect oval =Rect.fromCenter(center:CENTERLOCATION, width: WIDTH, height: HEIGHT);
    final Rect oval =Rect.fromCenter(center: Offset(size.width/2,size.height/2), width: 200, height: 100);

    canvas.drawOval(oval, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}

