import 'package:flutter/material.dart';
import 'package:movieshub/models/movie.dart';
import 'package:movieshub/widgets/card.dart';
import 'package:movieshub/widgets/movieoftheweek.dart';

class HomePage extends StatelessWidget {
  final List<String> list = ['Action', 'Adventure'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
        
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child:
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "What Are You",
                    style: TextStyle(
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.03,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Watching ",
                        style: TextStyle(
                          fontFamily: "SecularOne",
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height*0.03,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Today?",
                        style: TextStyle(
                          fontFamily: "SecularOne",
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height*0.03,
                          color: Color(0xffffa31a),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              //color: Colors.green,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MyCard(Movie(
                      'Spiderman Home Coming',
                      list,
                      4.5,
                      'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                      '2hrs',
                      'seif alaa',
                      '2019')),
                  SizedBox(
                    width: 10,
                  ),
                  MyCard(Movie(
                      'Spiderman Home Coming',
                      list,
                      4.5,
                      'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                      '2hrs',
                      'seif alaa',
                      '2019')),
                  SizedBox(
                    width: 10,
                  ),
                  MyCard(Movie(
                      'Spiderman Home Coming',
                      list,
                      4.5,
                      'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                      '2hrs',
                      'seif alaa',
                      '2019')),
                  SizedBox(
                    width: 10,
                  ),
                  MyCard(Movie(
                      'Spiderman Home Coming',
                      list,
                      4.5,
                      'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                      '2hrs',
                      'seif alaa',
                      '2019')),
                  SizedBox(
                    width: 10,
                  ),
                  MyCard(Movie(
                      'Spiderman Home Coming',
                      list,
                      4.5,
                      'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                      '2hrs',
                      'seif alaa',
                      '2019')),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Movie Of The",
                    style: TextStyle(
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.03,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Week!",
                    style: TextStyle(
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.03,
                      color: Color(0xffffa31a),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.34,
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child: MovieOfTheWeek(Movie(
                  'Spiderman Home Coming',
                  list,
                  4.5,
                  'https://img.youm7.com/ArticleImgs/2017/7/11/6449311-Spider-Man-Homecoming-(1).jpg',
                  '2hrs',
                  'seif alaa',
                  '2019')),
            ),
          ],
        ),
      ),
    );
  }
}
