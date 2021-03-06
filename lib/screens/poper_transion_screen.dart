import 'package:flutter/material.dart';



class PoperTransionScreen extends StatefulWidget {
  
  @override
  _PoperTransionScreenState createState()=> _PoperTransionScreenState();

}

class _PoperTransionScreenState extends State<PoperTransionScreen> with TickerProviderStateMixin {
  AnimationController _poperAnimationController;
  Animation _poperAnimation;

  
  AnimationController _scaleAnimationController;
  Animation _scaleAnimation;


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

    _scaleAnimationController = AnimationController(
      vsync: this, duration: Duration(seconds: 4),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.5, end: 2.0,
    ).chain(
      CurveTween( curve: Curves.ease )
    )
    .animate(_scaleAnimationController)
    // ..addListener(()=> setState((){}));
    ..addStatusListener((stat) {
       
      if( stat == AnimationStatus.dismissed ) {
        _scaleAnimationController.forward();
      }
      if( stat == AnimationStatus.completed ) {
        _scaleAnimationController.reverse();
      }

    });
    
    _scaleAnimationController.repeat();
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

              SizedBox(height: 100,),

              Center(
                child: BouncingBall(
                  animation: _scaleAnimation,
                ),
              ),

            ]
          ),
        ),
      ),

      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[

      //     FloatingActionButton.extended(
      //       icon: Icon(Icons.home),
      //       label: Text('Go Next'),
      //       onPressed: this._doPoperAnimation,
      //     ),

      //     AnimatedBuilder(
      //       animation: _poperAnimation,

      //       child: Container(
      //         height: 0, width: 0,
      //         child: Text('hey'),
      //       ),

      //       builder: (ctx, chld) {
              
      //         return Transform.scale(
      //           scale: _poperAnimation.value,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Colors.blue,
      //             ),
      //             height: 100,
      //             width: 100,
      //           ),
      //         );

      //       },
      //     ),

      //   ],
      // ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FloatingActionButton.extended(
            icon: AnimatedBuilder(
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
            label: Text('Go Next'),
            onPressed: this._doPoperAnimation,
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

  @override
  void dispose() {
    super.dispose();
    _poperAnimationController.dispose();
  }

}


class BouncingBall extends AnimatedWidget {

  BouncingBall({ Key key, Animation animation }): super(
    key: key, listenable: animation,
  );

  @override 
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return AnimatedBuilder(
      animation: animation,
      child: Container(

      ),
      builder: (ctx, chld) {

        return Transform.scale(
          scale: animation.value,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            width: 100, // animation.value,
            height: 100, // animation.value,
          ),
        );
      },
    );
  }
}