import 'package:anima/screens/clipPathnCustomPainter/clipp.dart';
import 'package:anima/screens/clipPathnCustomPainter/customp.dart';
import 'package:anima/screens/cute_login_screen.dart';
import 'package:anima/screens/implicit_anims/opacty.dart';
import 'package:anima/screens/move_screen.dart';
import 'package:anima/screens/poper_transion_screen.dart';
import 'package:anima/screens/poper_transition_screen_2.dart';
import 'package:anima/screens/top_movies/top_movies.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: AnimationPage(),
      // home: PoperTransionScreen_2(),
      // home: MoveScreen(),
      // home: CuteLoginScreen(),
      // home: Opacty(),
      // home: TopMoviesScreen(),
      // home: ClipPScreen(),
      home: CustomPScreen(),
    );
  }
}




class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with TickerProviderStateMixin{
  AnimationController animationController;
  Animation<double> animation;

  AnimationController opacityAnimationController;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  AnimationController poperAnimationController;
  Animation<double> poperAnimation;


  @override
  void initState() { 
    super.initState();
    
    animationController = AnimationController(
      vsync: this, duration: Duration(seconds: 3)
    );
    
    final curveAnimation = CurvedAnimation(
      parent: animationController, 
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeInOut,
    );

    animation = Tween<double>( 
      begin: 0, end: 2 * math.pi, 
    ).animate(curveAnimation)
     ..addListener((){
       setState(() { });
     })
     ..addStatusListener((status) {
       if( status == AnimationStatus.completed ) {
        //  animationController.reverse();
       } 
       if( status == AnimationStatus.dismissed ) {
         animationController.forward();
       }
     });
    
    animationController.forward();


    opacityAnimationController = AnimationController(
      vsync: this, duration: Duration(seconds: 1)
    );
    opacityAnimation = Tween<double>(
            begin: 0.1, end: 0.9  
          )
          .chain(CurveTween( curve: Curves.fastOutSlowIn ))
          .animate(opacityAnimationController)
          ..addListener(()=> setState((){}))
          ..addStatusListener((status) {
            if( status == AnimationStatus.completed ) {
              opacityAnimationController.reverse();
            }
            if( status == AnimationStatus.dismissed ) {
              opacityAnimationController.forward();
            }
          });
          
    scaleAnimation = Tween<double>(
            begin: 0.5, end: 2.0  
          )
          .animate(opacityAnimationController)
          ..addListener(()=> setState((){}))
          ..addStatusListener((status) {
            if( status == AnimationStatus.completed ) {
              // opacityAnimationController.reverse();
            }
          });
    opacityAnimationController.forward();


    poperAnimationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 500)
    );
    poperAnimation = Tween<double>(
      begin: 0.0, end: 20
    )
    .animate(poperAnimationController)
    ..addListener(()=> setState((){}) )
    ..addStatusListener((status) {
      if( status == AnimationStatus.dismissed ) {
        poperAnimationController.forward();
      }
      if( status == AnimationStatus.completed ) {
        // poperAnimationController.reverse();
      }
    });

    // poperAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Anima', style: TextStyle( color: Colors.black ),),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             
            SizedBox(height: 80),

            Center(
              child: Transform.rotate(
                angle: animation.value,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 200,
                  width: 200,
                  color: const Color(0xFFE8581C),
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),

            SizedBox(height: 50),

            Center(
              child: AnimatedOpacity(
                opacity: 1.0, 
                duration: Duration(seconds: 9),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                  child: Text('Hey', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

            SizedBox(height: 50),

            Center(
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: Text('simple container'),
                // transform: Matrix4.rotationX(30),
              ),
            ),

            // AnimatedBuilder(
            //   animation: opacityAnimation,
            //   child: Transform.scale(
            //     scale: scaleAnimation.value,
            //     child: Container(
            //         color: Colors.brown,
            //         height: 100,
            //         width: 100,
            //     ),
            //   ),
            //   builder: (BuildContext context, Widget child) {

            //     return Opacity(
            //       opacity: opacityAnimation.value, child: child
            //     );

            //   },
            // ),

            // GestureDetector(
            //   child: Center(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //     width: 100,
            //     height: 100,
            //     child: Transform.scale(
            //       scale: poperAnimation.value,
            //       child: Container(
            //             decoration: BoxDecoration(
            //               color: Colors.orange,
            //               borderRadius: BorderRadius.circular(50),
            //             ),
            //             height: 100,
            //             width: 100,
            //         ),
            //     ),
            //   ),
            //   ),

            //   onTap: this.startPoperAnimation,
            // ),

            // PoperWidget(
            //   animation: poperAnimation,
            //   onPressed: this.startPoperAnimation,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.yellow,
            //     ),
            //     width: 100,
            //     height: 100,
            //   ),
            // ),


          ],
        )
      ),

      // floatingActionButton: PoperWidget(
      //   child: CtaWidget(
      //     onPressed: this.startPoperAnimation,
      //   ),
      //   animation: poperAnimationController,
      // ),
      // floatingActionButton: CtaWidget(
      //     onPressed: this.startPoperAnimation,
      //   ),
      floatingActionButton: PoperWidget(
          animation: poperAnimation,
          onPressed: this.startPoperAnimation,
          child: CtaWidget(),
          // Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.yellow,
          //   ),
          //   width: 100,
          //   height: 100,
          // ),
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );

    

  }

  startPoperAnimation() {
    print('animate poper');
    this.poperAnimationController.forward();
  }


  @override
  void dispose() {
    animationController.dispose();
    opacityAnimationController.dispose();
    super.dispose();
  }

}


class CtaWidget extends StatelessWidget {
  // final Function onPressed;
  // CtaWidget({ this.onPressed });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: (){}, 
      label: Text('Get One'),
      icon: Icon(Icons.account_circle),
    );
  }
}



class PoperWidget extends AnimatedWidget {
  final Widget child;
  final Function onPressed;
  
  PoperWidget({ 
    Key key, 
    @required Animation animation,
    @required this.child, 
    @required this.onPressed,
  }): 
    super(listenable: animation, key:key);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return GestureDetector(

      child: Container(
        width: 200,
        height: 100,
        color: Colors.yellow,
        child: AnimatedBuilder(
          animation: animation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
            ),
          ),
          builder: (context, chld) {
            
            return Transform.scale(
              scale: animation.value,
              child: chld,
            );

          },
        ),
      ),

      onTap: this.onPressed,
    );
  }
}

// FadeTransition( opacity: animation, child: Widget );
// RotationTransition( opacity: animation, child: Widget );