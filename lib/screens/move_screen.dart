import 'package:flutter/material.dart';



class MoveScreen extends StatefulWidget {
  @override
  _MoveScreenState createState() => _MoveScreenState();
}

class _MoveScreenState extends State<MoveScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation<Offset> _offsetAnimation;


  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this, duration: Duration(seconds: 2),
    );

    _animation = Tween<double>( begin: -1.0, end: 0.0 )
                  .animate(
                    CurvedAnimation(
                      parent: _animationController, curve: Curves.bounceIn,
                    )
                  );
                  // ..addListener(()=> setState((){}));
                  // ..addStatusListener((stat) {
                           
                  //   if( stat == AnimationStatus.dismissed ) {
                  //     _animationController.forward();
                  //   }
                  //   if( stat == AnimationStatus.completed ) {
                  //     // _animationController.reverse();
                  //   }

                  // });
    
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0), end: Offset(0, 0), 
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      )
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: Text('Mover'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text('hello'),
              
              // move the box from the left of the screen to the center/view
              AnimatedBuilder(
                animation: _animationController,
                builder: (ctx, child) {

                  return Transform.translate(
                    offset: Offset(
                      0, // _animation.value*screenSize.width, 
                      _animation.value*screenSize.height
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.green,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  );

                },
              ),

              AnimatedBuilder(
                animation: _animationController,
                child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.brown,
                  ),
                builder: (ctx, child) {

                  return Transform(
                    transform: Matrix4.translationValues(
                      _animation.value*screenSize.width, 0, 0
                    ),
                    child: child,
                  );
                },
              ),

              // Transform.translate(
              //   offset: Offset(_animation.value*screenSize.width, 0),
              //   child: Center(
              //     child: Container(
              //       color: Colors.green,
              //       width: 200,
              //       height: 200,
              //     ),
              //   ),
              // ),

              // using slide transition
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  color: Colors.pink,
                ),
              ),

              
              Align(
                alignment: Alignment.bottomCenter,
                child: Text('hi'),
              ),

            ],
          ),
        ),
      ),
      
    );
  }// Widget build(BuildContext context) { .. }


}