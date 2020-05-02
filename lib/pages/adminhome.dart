import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/pages/addmovie.dart';
import 'package:movieshub/pages/deletemovie.dart';
import 'package:movieshub/pages/updatemovie.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: Text('Admin Operations'),
        centerTitle: true,
        leading: Icon(Icons.settings_applications),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: KPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddMovie()));
              },
              child: Text(
                'Add Movie',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SecularOne',
                    fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              color: KPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateMovie()));
              },
              child: Text(
                'Edit Movie',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SecularOne',
                    fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              color: KPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteMovie()));
              },
              child: Text(
                'Delete Movie',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SecularOne',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
