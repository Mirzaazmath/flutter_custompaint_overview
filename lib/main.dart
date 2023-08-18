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
    final triangle=Path();
    // MOVING THE BRUSH TO TOP CENTER ON CANVAS
    // NOW THE SIZE.WIDTH/2 BECOME THE INITIAL POINT
    triangle.moveTo(size.width/2, 0);
    // ASSIGNING THE CORDINATES TO DRAW THE LINE FROM INITIAL POINT TO THE GIVEN CORDINATES

    triangle.relativeLineTo(size.width/2, size.height*0.8);

    // NOW THE LAST CORDINATES BECOMES ZERO
    // ASSIGNING THE CORDINATES TO DRAW THE LINE FROM INITIAL POINT TO THE GIVEN CORDINATES
    triangle.relativeLineTo(-size.width, 0);
    // CLOSING THE PATH THIS WILL AUTOMATICALLY CREATES THE LINE TO AND CONNECT THE VERY INITIAL POINT OF
    // CANVAS
    triangle.close();

    
    



    //DRAWING THE TRIANGLE IN CANVAS
    canvas.drawPath(triangle, brush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }

}

