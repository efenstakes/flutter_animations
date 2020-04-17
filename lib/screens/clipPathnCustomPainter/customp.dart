import 'package:flutter/material.dart';



class CustomPScreen extends StatefulWidget {
  @override
  _CustomPScreenState createState() => _CustomPScreenState();
}

class _CustomPScreenState extends State<CustomPScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(

      // appBar: AppBar(

      // ),

      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: CustomPaint(
          size: screenSize,
          painter: CustomPainterClass(),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
             
                  Text('hey'),

                  ...[1, 2, 3, 5, 6, 8, 9, 0, ].map((num) {

                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 400,
                      height: 400,
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(num.toString()),
                      ),
                    );

                  }).toList()

                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}


class CustomPainterClass extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double fullWidth = size.width;
    double fullHeight = size.height;

    Paint paint = Paint()
       ..color = Colors.teal.shade50
       ..style = PaintingStyle.fill
       ..strokeWidth = 40;

    Path path = Path();

    // add a curved paint at page top
    path.lineTo(0.0, fullHeight*0.3);
    path.quadraticBezierTo(
      fullWidth*0.5, fullHeight*0.4, 
      fullWidth, fullHeight*0.3
    );
    path.lineTo(fullWidth, 0.0);
    // path.close();


    // add a style at the bottom
    // path.lineTo(0.0, fullHeight*0.92);
    // path.quadraticBezierTo(
    //   fullWidth*0.25, fullHeight*0.86,
    //   fullWidth*0.5, fullHeight*0.92
    // );
    // path.quadraticBezierTo(
    //   fullWidth*0.75, fullHeight*0.98,
    //   fullWidth, fullHeight*0.92
    // );
    // path.lineTo(fullWidth, fullHeight);
    // path.lineTo(0.0, fullHeight);

    // OR

    // add a style at the bottom
    // path.moveTo(0, size.height * 0.9167);
    // path.quadraticBezierTo(
    //   size.width * 0.25, size.height * 0.84,
    //   size.width * 0.5, size.height * 0.92
    // );
    // path.quadraticBezierTo(
    //   size.width * 0.75, size.height * 0.98,
    //   size.width * 1.0, size.height * 0.9167
    // );
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    
    canvas.drawPath(path, paint);
  }// void paint(Canvas canvas, Size size) { .. }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}