import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/models/movie.dart';
import 'package:movieshub/provider/store.dart';
import 'package:movieshub/widgets/customtextfield.dart';

class AddMovie extends StatelessWidget {
  String name;
  List<String> genere;
  double rating;
  String posterUrl;
  String duration;
  String director;
  String releaseYear;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: Text('Add Movie'),
        centerTitle: true,
        leading: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _key,
          child: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                    hint: 'Movie Name',
                    onSave: (value) {
                      name = value;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Rating',
                    onSave: (value) {
                      rating = double.parse(value);
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Genere',
                    onSave: (value) {
                      genere = value.split(',');
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Poster Url',
                    onSave: (value) {
                      posterUrl = value;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Duration',
                    onSave: (value) {
                      duration = value;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Director',
                    onSave: (value) {
                      director = value;
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: 'Movie Release Year',
                    onSave: (value) {
                      releaseYear = value;
                    }),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 120,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () async {
                        if (_key.currentState.validate()) {
                          _key.currentState.save();
                          final Movie movie = Movie(name, genere, rating,
                              posterUrl, duration, director, releaseYear);
                          final store = Store();
                          bool temp = await store.addMovie(movie,context);
                          print(temp);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: KPrimaryColor,
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontFamily: 'SecularOne',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
