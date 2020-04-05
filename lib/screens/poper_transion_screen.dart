import 'package:flutter/material.dart';



class PoperTransionScreen extends StatefulWidget {
  
  @override
  _PoperTransionScreenState createState()=> _PoperTransionScreenState();

}

class _PoperTransionScreenState extends State<PoperTransionScreen> with TickerProviderStateMixin {
  AnimationController _poperAnimationController;
  Animation _poperAnimation;


  @override
  void initState() {
    super.initState();

    _poperAnimationController = AnimationController(
      vsync: this, duration: Duration(seconds: 4),
    );
    _poperAnimation = Tween<double>(
      begin: 0, end: 30,
    ).chain(
      CurveTween( curve: Curves.ease )
    )
    .animate(_poperAnimationController)
    ..addListener(()=> setState((){}));
    
    // _poperAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: Text('Poper Transition'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              
              Text('Animate'),

            ]
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FloatingActionButton.extended(
            icon: Icon(Icons.home),
            label: Text('Go Next'),
            onPressed: this._doPoperAnimation,
          ),

          AnimatedBuilder(
            animation: _poperAnimation,

            child: Container(
              height: 0, width: 0,
              child: Text('hey'),
            ),

            builder: (ctx, chld) {
              
              return Transform.scale(
                scale: _poperAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  height: 100,
                  width: 100,
                ),
              );

            },
          ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  void _doPoperAnimation() {
    print('_doPoperAnimation method');
    this._poperAnimationController.forward();
  }

}