import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';



class ClipPScreen extends StatefulWidget {

  @override
  _ClipPScreenState createState()=> _ClipPScreenState();
}


class _ClipPScreenState extends State<ClipPScreen> {


  @override 
  Widget build(BuildContext context) {

    return Scaffold(

      // appBar: AppBar(
      //   title: Text('ClipP'),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.grey[50],
      // ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              ClipPath(
                clipper: ClipPainter(),
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Image(
                    image: AssetImage('assets/images/sonic.jpg'),
                    fit: BoxFit.cover,
                  ),
                )
              ),

              SizedBox(height: 12,),

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 16,),

                    // name
                    Center(
                      child: Text(
                        'Sonic the HedgeHog',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 12,),

                    // rating
                    StarRating(
                      rating: 3.7,
                      starConfig: StarConfig(
                        strokeWidth: 0,
                        strokeColor: Colors.teal[900],
                        fillColor: Colors.teal[900],
                        size: 24,
                        emptyColor: Colors.teal[50],
                      ),
                    ),

                    SizedBox(height: 40,),

                    // description
                    Text(
                      'The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 40,),

                    Text(
                      'Actors',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          
                          ...[
                            'The Rock', 'Ludacris', 'Chris Hayes',
                            'The Rock', 'Ludacris', 'Chris Hayes',
                            'The Rock', 'Ludacris', 'Chris Hayes', 
                            'The Rock', 'Ludacris', 'Chris Hayes'
                          ].map((String actor) {
                            return _buildActorCard(actor: actor);
                          }).toList()

                        ],
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.watch),
        label: Text('Watch Now'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }


  
  Widget _buildActorCard({ String actor }) {

    return Container(
      margin: EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            width: 72,
            height: 72,
            child: CircleAvatar(
              child: Text(
                actor[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            actor,
            style: TextStyle(),
          ),

        ],
      ),
    );
  }// Widget _buildActorCard({ String actor }) { .. }


}


class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double screenWidth = size.width;
    double screenHeight = size.height;

    Path path = new Path();

    path.lineTo(0.0, screenHeight*0.8);
    // path.quadraticBezierTo(
    //   screenWidth*0.5, screenHeight, 
    //   screenWidth, screenHeight*0.6
    // );
    path.quadraticBezierTo(
      screenWidth*0.25, screenHeight, 
      screenWidth*0.5, screenHeight
    );
    path.quadraticBezierTo(
      screenWidth*0.75, screenHeight, 
      screenWidth, screenHeight*0.8
    );
    path.lineTo(screenWidth, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }


}