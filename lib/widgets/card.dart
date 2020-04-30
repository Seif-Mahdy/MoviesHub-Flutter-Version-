import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/models/movie.dart';
import 'package:movieshub/widgets/stars.dart';

import 'genere.dart';

class MyCard extends StatelessWidget {
  final Movie movie;
  MyCard(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: constraints.maxHeight * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 17),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            movie.getName(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SecularOne',
                                fontSize: constraints.maxHeight * 0.15,
                                letterSpacing: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: StarRow(
                              movie.getRating(),
                              MainAxisAlignment.start,
                              constraints.maxHeight * 0.18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: movie.getGenere().map((genere) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: GenreBadge(genere),
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: constraints.maxHeight * 0.65,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${movie.getPosterUrl()}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.1,
              right: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[600],
                      blurRadius: 7.0,
                      offset: Offset(-4, 1),
                    ),
                  ],
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      print('loved');
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
