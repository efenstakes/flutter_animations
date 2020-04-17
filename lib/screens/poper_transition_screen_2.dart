import 'package:flutter/material.dart';



class PoperTransionScreen_2 extends StatefulWidget {
  
  @override
  _PoperTransionScreen_2State createState()=> _PoperTransionScreen_2State();

}

class _PoperTransionScreen_2State extends State<PoperTransionScreen_2> with TickerProviderStateMixin {
  AnimationController _poperAnimationController;
  Animation _poperAnimation;

  
  AnimationController _scaleAnimationController;
  Animation _scaleAnimation;

  bool _showPoper = false;


  @override
  void initState() {
    super.initState();

    _poperAnimationController = AnimationController(
      vsync: this, duration: Duration(seconds: 1),
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

              // Center(
              //   child: BouncingBall(
              //     animation: _scaleAnimation,
              //   ),
              // ),

              Transform(
                transform: Matrix4.translationValues(0, 60, 1),
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.yellow,
                ),
              ),

            ]
          ),
        ),
      ),

      floatingActionButton: 
        _showPoper
         ?
         Container(
          //  color: Colors.blue,
           child: AnimatedBuilder(
             animation: _poperAnimationController,
             child: Container(
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.blue,
               ),
             ),
             builder: (ctx, child) {
               
               return Transform.scale(
                 scale: _poperAnimation.value,
                //  child: child,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    width: 80,
                    height: 80,
                  ),
               );

             },
           ),
         )
        // Container(
        //   child: Text('hey'),
        // )
         :
         FloatingActionButton.extended(
           label: Text('Lets Go'),
           icon: Icon(Icons.account_circle),
           onPressed: this._togglePoper,
         ),
        
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }


  void _togglePoper() {
    setState(()=> _showPoper = !this._showPoper );
    this._poperAnimationController.forward();
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