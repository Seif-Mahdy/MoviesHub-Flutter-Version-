import 'package:flutter/material.dart';
import 'package:movieshub/models/movie.dart';
import 'package:movieshub/widgets/stars.dart';

import 'genere.dart';

class MovieOfTheWeek extends StatelessWidget {
  final Movie movie;
  MovieOfTheWeek(this.movie);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: <Widget>[
            Positioned(
              //bottom: 20,
              child: Container(
                height: constraints.maxHeight * 0.9,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: constraints.maxWidth*0.59,
                        child: Text(
                          movie.getName(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SecularOne',
                              fontSize: constraints.maxHeight*0.065),
                        ),
                      ),
                      StarRow(movie.getRating(), MainAxisAlignment.start, constraints.maxHeight*0.1),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 1,
                        width: 200,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Director: ${movie.getDirector()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            fontFamily: 'SecularOne'),
                      ),
                      Text(
                        'Duration: ${movie.getDuration()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            fontFamily: 'SecularOne'),
                      ),
                      Text(
                        'Release Year: ${movie.getReleaseYear()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            fontFamily: 'SecularOne'),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: movie.getGenere().map((genere) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: GenreBadge(genere),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width - 167.0),
              child: Container(
                height: constraints.maxHeight * 0.9,
                width: 167.00,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 100.0,
                      // has the effect of softening the shadow
                      spreadRadius: 1.0,
                      // has the effect of extending the shadow
                      offset: Offset(
                        -5.0, // horizontal, move right 10
                        10.0, // vertical, move down 10
                      ),
                    )
                  ],
                  color: Colors.blue,
                  image: DecorationImage(
                    image: Image.network("${movie.getPosterUrl()}").image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
