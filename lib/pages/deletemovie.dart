import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/provider/store.dart';
import 'package:movieshub/widgets/customtextfield.dart';

class DeleteMovie extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  String movieName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.delete),
        title: Text('Delete Movie'),
        centerTitle: true,
        backgroundColor: KPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  hint: 'Movie Name',
                  onSave: (value) {
                    movieName = value;
                  },
                ),
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
                          final store = Store();
                          await store.deleteMovie(movieName,context);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: KPrimaryColor,
                      child: Text(
                        'Delete',
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
          ),
        ),
      ),
    );
  }
}
