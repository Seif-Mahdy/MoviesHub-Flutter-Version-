import 'package:flutter/material.dart';
import 'package:movieshub/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:movieshub/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final primary = Color.fromRGBO(255, 163, 26, 1);
  final _key = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String name, email, password;

  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(primary),
        ),
        inAsyncCall: Provider.of<ModelHud>(context).isShown,
        child: ListView(
          //physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  height: 158,
                  width: 242,
                  child: Image.asset('lib/images/logo.png')),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'DISCOVER THE\nLATEST MOVIES,',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'secularOne',
                      fontSize: 28,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'with all rates and insights.',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'secularOne',
                      fontSize: 20,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email Can\'t Be Empty';
                        }
                        return null;
                      },
                      cursorColor: primary,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: primary,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name Can\'t Be Empty';
                        }
                        return null;
                      },
                      cursorColor: primary,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: primary,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        password = value;
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password Can\'t Be Empty';
                        }
                        return null;
                      },
                      cursorColor: primary,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: primary,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 40,
                width: 120,
                child: Builder(
                  builder: (context) => RaisedButton(
                    onPressed: () async {
                      final modelHud =
                          Provider.of<ModelHud>(context, listen: false);
                      modelHud.changeIsShow(true);
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        try {
                          await _auth.signUp(email, password);
                          modelHud.changeIsShow(false);
                        } catch (e) {
                          modelHud.changeIsShow(false);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                              e.message,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: primary,
                          ));
                        }
                      }
                      modelHud.changeIsShow(false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    color: primary,
                    child: Text(
                      'Sign Up',
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
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already Have An Account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SecularOne',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Log In.',
                    style: TextStyle(
                      color: primary,
                      fontFamily: 'SecularOne',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
