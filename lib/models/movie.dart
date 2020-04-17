import 'package:flutter/material.dart';


class Movie {
  String id;
  String name;
  String img;
  String description;
  List<String> actors;

  Movie({ @required this.name, this.id, this.description, this.actors, this.img});
}