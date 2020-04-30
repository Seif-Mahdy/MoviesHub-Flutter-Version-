import 'package:flutter/material.dart';

class StarRow extends StatelessWidget {
  final double _rating;
  final MainAxisAlignment _alignment;
  final double _size;

  StarRow(this._rating, this._alignment, this._size);

  final primary = Color.fromRGBO(255, 163, 26, 1);

  List createIcon() {
    
    List<Widget> widgets = List();
    for (int i = 0; i < _rating.truncate(); i++) {
      widgets.add(Icon(
        Icons.star,
        size: _size,
        color: primary,
      ));
    }
    if (_rating.truncate() != _rating) {
      widgets.add(Icon(
        Icons.star_half,
        size: _size,
        color: primary,
      ));
      for (int i = 0; i < 5 - _rating.truncate() - 1; i++) {
        widgets.add(Icon(
          Icons.star_border,
          size: _size,
          color: primary,
        ));
      }
    } else {
      for (int i = 0; i < 5 - _rating.truncate(); i++) {
        widgets.add(Icon(
          Icons.star_border,
          size: _size,
          color: primary,
        ));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _alignment,
      children: createIcon(),
    );
  }
}