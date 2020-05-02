import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onSave;

  CustomTextField({this.hint, this.onSave});

  // ignore: missing_return
  IconData getIcon() {
    switch (hint) {
      case "Email":
        return Icons.email;
        break;
      case "Password":
        return Icons.vpn_key;
        break;
      case "Name":
        return Icons.person;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      obscureText: (hint == 'Password') ? true : false,
      validator: (value) {
        if (value.isEmpty) {
          return '$hint Can\'t Be Empty';
        }
        return null;
      },
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText: 'Enter Your $hint',
        prefixIcon: Icon(
          getIcon(),
          color: KPrimaryColor,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: KPrimaryColor),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KPrimaryColor),
          borderRadius: BorderRadius.circular(100),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
