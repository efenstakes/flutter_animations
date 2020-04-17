import 'package:flutter/material.dart';



class CuteLoginScreen extends StatefulWidget {
  @override
  _CuteLoginScreenState createState() => _CuteLoginScreenState();
}

class _CuteLoginScreenState extends State<CuteLoginScreen> with TickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AnimationController _animationController;
  Animation<double> _wooAnimation;
  Animation<double> _formAnimation;
  Animation<double> _ctasAnimation;

  
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 2), vsync: this,
    );
    
    _wooAnimation = Tween<double>(
      begin: -1.0, end: 0.0
    ).animate(
      CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut,
      )
    );
    _formAnimation = Tween<double>(
      begin: 1.0, end: 0.0
    ).animate(
      CurvedAnimation(
        parent: _animationController, 
        curve: Interval(0.4, 1.0, curve: Curves.bounceInOut),
      )
    );
    _ctasAnimation = Tween<double>(
      begin: -1.0, end: 0.0
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.bounceInOut)
      )
    );

    _animationController.forward();
  }// void initState() { .. }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        // title: Text('Cute Login'),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: screenSize.width/8, 
              right: screenSize.width/8, 
              top: screenSize.width/8
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // woo
                WooTextAW(
                  animation: _wooAnimation,
                ),
                // AnimatedBuilder(
                //   animation: _animationController,
                //   child: WooText(),
                //   builder: (ctx, child) {

                //     return Transform(
                //       transform: Matrix4.translationValues(
                //         _wooAnimation.value*screenSize.width, 0, 0
                //       ),
                //       child: child,
                //     );
                //   },
                // ),

                SizedBox(height: 120,),
                
                // form
                AnimatedBuilder(
                  animation: _animationController,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // email
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your email',
                            hintText: 'bota@mail.com',
                            prefixIcon: Icon(Icons.alternate_email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        // password
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Enter your password',
                            hintText: '***********',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),

                      ],
                    ),
                  ),
                  builder: (ctx, child) {

                    return Transform.translate(
                      offset: Offset(_formAnimation.value*screenSize.width, 0),
                      child: child,
                    );
                  },
                ),

                SizedBox(height: 64,),
                
                // login button
                AnimatedBuilder(
                  animation: _animationController,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240,
                      child: FloatingActionButton.extended(
                      label: Text(
                        'Login Now',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      icon: Icon(Icons.lock),
                      onPressed: () {

                      },
                    ),
                    ),
                  ),
                  builder: (ctx, child) {

                    return Transform(
                      transform: Matrix4.translationValues(
                        _ctasAnimation.value*screenSize.width, 0, 0
                      ),
                      child: child,
                    );
                  },
                ),

                // Spacer(),

                SizedBox(height: 6,),
                
                // register link
                AnimatedBuilder(
                  animation: _animationController,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      child: Text(
                        'Already have an account? Register here',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  builder: (ctx, child) {

                    return Transform(
                      transform: Matrix4.translationValues(
                        _ctasAnimation.value*screenSize.width, 0, 0
                      ),
                      child: child,
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      
    );
  }




}


class WooText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        Text(
          'Welcome to Cuty',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
        // Text(
        //   'Login Now',
          // style: TextStyle(
          //   fontSize: 32,
          //   fontWeight: FontWeight.bold
          // ),
        // ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black
            ),
            children: <TextSpan> [
               
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),

            ]
          ),
        ),

      ],
    );
  }
}

class WooTextAW extends AnimatedWidget {
  
  WooTextAW({ Key key, @required Animation<double> animation }): super(
    key: key, listenable: animation,
  );

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    Size screenSize = MediaQuery.of(context).size;

    return Transform(
      transform: Matrix4.translationValues(
        animation.value*screenSize.width, 0, 0
      ),
      child: WooText(),
    );
  }
}