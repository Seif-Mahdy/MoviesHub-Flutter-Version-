import 'package:flutter/material.dart';

class GenreBadge extends StatelessWidget {
  final String genreName;

  GenreBadge(this.genreName);
  Color getColor() {
    switch (genreName) {
      case 'Action':
        return Colors.blue;
        break;
      case 'Adventure':
        return Colors.lightGreen[700];
        break;
      case 'Horror':
        return Colors.red;
        break;
      case 'Drama':
        return Colors.purple;
        break;
      case 'Romance':
        return Colors.pinkAccent;
        break;
      case 'Comedy':
        return Colors.amberAccent;
        break;
      default:
        return null;
    }
  }

  Widget createBadge(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.028,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          genreName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SecularOne',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return createBadge(context);
  }
}
