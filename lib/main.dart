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

    // CREATING THE PATH
    final shape=Path();

    shape.moveTo(size.width*0.4, size.height*0.2);
    shape.relativeLineTo(size.width*0.2, 0);
    shape.relativeLineTo(0, size.height*0.2);
    shape.relativeLineTo(size.width*0.2, 0);
    shape.relativeLineTo(0, size.height*0.2);
    shape.relativeLineTo(-size.width*0.2, 0);
    shape.relativeLineTo(0, size.height*0.2);
    shape.relativeLineTo(-size.width*0.2, 0);
    shape.relativeLineTo(0, -size.height*0.2);
    shape.relativeLineTo(-size.width*0.2, 0);
    shape.relativeLineTo(0, -size.height*0.2);
    shape.relativeLineTo(size.width*0.2, 0);


     shape.close();


    canvas.drawPath(shape, brush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}

