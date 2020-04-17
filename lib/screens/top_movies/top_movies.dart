import 'package:anima/models/movie.dart';
import 'package:anima/screens/top_movies/top_movie_detail.dart';
import 'package:anima/screens/top_movies/top_movie_detail_2.dart';
import 'package:flutter/material.dart';



class TopMoviesScreen extends StatefulWidget {
  @override
  _TopMoviesScreenState createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  final _pageController = PageController( initialPage: 0, );
  List<Movie> _movies = [
    Movie(
      id: '1',
      name: 'Fast n Furious',
      img: 'assets/images/fastnfurious.png',
      description: 'Fast & Furious is an American media franchise centered on a series of action films that are largely concerned with illegal street racing, heists and spies. The franchise also includes short films, a television series, live shows, video games and theme park attractions.', 
      actors: [ 'The Rock', 'Vin Diesel', 'Ludacris' ], 
    ),
    Movie(
      id: '2',
      name: 'Sonic the Hedgehog',
      img: 'assets/images/sonic.jpg',
      description: 'The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik.',
      actors: [ 'The Rock', 'Vin Diesel', 'Ludacris' ], 
    ),
    Movie(
      id: '3',
      name: 'Almost Family',
      img: 'assets/images/almost-family.jpg',
      description: 'Only child Julia Bechley finds her life turned upside down when her father reveals that, over the course of his prize-winning career as a pioneering fertility doctor, he used his own genetic material to conceive dozens of children.',
      actors: [ 'The Rock', 'Vin Diesel', 'Ludacris', 'The Rock', 'Vin Diesel', 'Ludacris', 'The Rock', 'Vin Diesel', 'Ludacris' ], 
    ),
    Movie(
      id: '1',
      name: 'Bold Type',
      img: 'assets/images/bold-type.jpg',
      description: 'Putting together a magazine is not an easy task, requiring a lot of teamwork to finish the job and get the publication on newsstand shelves. That\'s why the staffers responsible for producing global women\'s magazine Scarlet lean on one another as they try to find their own voices. ',
      actors: [ 'Katie', 'Lisa', ], 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: null,

      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            
            ..._movies.map((Movie movie) {

              return TopMovieDetail(
                movie: movie,
              );

            }).toList(),

          ],
        ),
      ),
      
    );
  }// Widget build(BuildContext context) { .. }






  


}