import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/models/movie.dart';

class Store {
  final Firestore _fireStore = Firestore.instance;
  addMovie(Movie movie, BuildContext context) {
    _fireStore.collection('Movies').document('${movie.getName()}').setData({
      'Name': movie.getName(),
      'Rating': movie.getRating(),
      'PosterUrl': movie.getPosterUrl(),
      'Genere': movie.getGenere().toString(),
      'Duration': movie.getDuration(),
      'Director': movie.getDirector(),
      'ReleaseYear': movie.getReleaseYear(),
    }).then((doc) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Movie Added Successfully',style: TextStyle(color: Colors.white),),
        backgroundColor: KPrimaryColor,
      ));
    });
  }

  deleteMovie(String movieName,BuildContext context) {
    _fireStore.collection('Movies').document('$movieName').delete().then((doc) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Movie Deleted Successfully',style: TextStyle(color: Colors.white),),
        backgroundColor: KPrimaryColor,
      ));
    });
  }
}
