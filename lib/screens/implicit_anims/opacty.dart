import 'package:flutter/material.dart';



class Opacty extends StatefulWidget {
  @override
  _OpactyState createState() => _OpactyState();
}

class _OpactyState extends State<Opacty> {
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            FlatButton(
              child: Text('Show Greeting'),
              onPressed: () {
                setState(()=> _opacity = 1);
              },
            ),

            SizedBox(height: 60,),

            AnimatedOpacity(
              opacity: _opacity,
              child: Text(
                'Hola'
              ),
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 4),
            ),

          ],
        ),
      ),
      
    );
  }
}