
import 'package:anima/models/movie.dart';
import 'package:flutter/material.dart';

class TopMovieDetail extends StatefulWidget {
  final Movie movie;

  TopMovieDetail({ @required this.movie });

  @override
  _TopMovieDetailState createState() => _TopMovieDetailState();
}

class _TopMovieDetailState extends State<TopMovieDetail> with TickerProviderStateMixin {
  Movie movie;
  bool _isNavTime = false;

  AnimationController _navAnimationController;
  Animation<double> _navAnimation;
  
  AnimationController _fadeInAnimationController;
  Animation<double> _fadeInAnimation;
  Animation<double> _descriptionFadeInAnimation;
  Animation<double> _actorsFadeInAnimation;
  

  @override
  void initState() {
    super.initState();

    this.movie = widget.movie;

    _navAnimationController = AnimationController(
      duration: Duration(milliseconds: 700), vsync: this,
    );
    _navAnimation = Tween<double> (begin: 0, end: 40).animate(
      CurvedAnimation(
        parent: _navAnimationController,
        curve: Curves.fastOutSlowIn,
      )
    )..addStatusListener((status) {

      if( status == AnimationStatus.dismissed ) {
        _navAnimationController.forward();
      }
      if( status == AnimationStatus.completed ) {
        print('nav now');
        print('_isNavTime ${this._isNavTime}');
        if( _isNavTime ) return this._viewMovieDetails(context: context);
        setState(()=> _isNavTime=false);
      }

    });


    _fadeInAnimationController = AnimationController(
      duration: Duration(milliseconds: 900), vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation( parent: _fadeInAnimationController, curve: Curves.fastOutSlowIn, )
    );
    _descriptionFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation( 
        parent: _fadeInAnimationController, 
        curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn), 
      )
    );
    _actorsFadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation( 
        parent: _fadeInAnimationController, 
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn), 
      )
    );
    
    _fadeInAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(

      body: Container(
        padding: EdgeInsets.fromLTRB( 24, 20, 24, 4 ),
        color: Colors.teal[400],

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              // movie name
              FadeTransition(
                opacity: _fadeInAnimation,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    movie.name,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40,),
              
              // movie image
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenSize.width/1.4,
                  height: screenSize.width/1.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(movie.img),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(screenSize.width/1.4),
                  ),
                ),
              ),

              SizedBox(height: 64,),

              // description
              FadeTransition(
                opacity: _descriptionFadeInAnimation,
                child: Text(
                  movie.description,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
              ),
              
              SizedBox(height: 40,),

              // actors
              FadeTransition(
                opacity: _actorsFadeInAnimation,
                child: Text(
                  'Actors',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12,),
              FadeTransition(
                opacity: _actorsFadeInAnimation,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                    
                      ...movie.actors.map((String actor) {

                        return _buildActorWidget(actor: actor);
                      }).toList()

                    ],
                  ),
                ),
              ),

              SizedBox(height: 28,),

              // View Details cta
              // Center(
              //   child: RaisedButton(
              //       color: Colors.black,
              //       textColor: Colors.white,
              //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //       child: Text('View Details Now'),
              //       onPressed: ()=> this._viewMovieDetails(context: context),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)
              //       ),
              //     ),
              // ),

            ],
          ),
        ),
        
      ),

      floatingActionButton: 
        _isNavTime 
        ?
        AnimatedBuilder(
          animation: _navAnimationController,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          builder: (ctx, child) {

            return Transform.scale(
              scale: _navAnimation.value,
              child: child,
            );
          },
        )
        :
        FloatingActionButton.extended(
          label: Text('View More'),
          onPressed: this._navNow,
          backgroundColor: Colors.teal[700],
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }

  
  Widget _buildActorWidget({ String actor }) {

    return Container(
        margin: EdgeInsets.only(right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Container(
              height: 80,
              width: 80,
              child: CircleAvatar(
                child: Text(actor[0]),
              ),
            ),

            SizedBox(height: 8,),

            Align(
              alignment: Alignment.center,
              child: Text(
                actor,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

          ],
        ),
      );
  }// Widget _buildActorWidget({ String actor }) { .. }

   _viewMovieDetails({ BuildContext context }) {
     setState(()=> _isNavTime = false);
     Navigator.of(context).push(
       MaterialPageRoute(
         builder: (BuildContext ctx)=> DummyScreen()
       )
     );
    //  _navAnimationController.reset();
   }// _viewMovieDetails() { .. }

   void _navNow() {
     setState(()=> _isNavTime = true);
     _navAnimationController.forward();
   }

}


class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Hello Dummy'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text('Hello'),

            ],
          ),
        ),
      ),
      
    );
  }
}