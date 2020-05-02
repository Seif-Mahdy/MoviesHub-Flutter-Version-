import 'package:flutter/material.dart';
import 'package:movieshub/constants.dart';
import 'package:movieshub/pages/home.dart';
import 'package:movieshub/pages/signup.dart';
import 'package:movieshub/provider/admin.dart';
import 'package:movieshub/provider/provider.dart';
import 'package:movieshub/widgets/customtextfield.dart';
import 'package:movieshub/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String id = 'login';
  final _key = GlobalKey<FormState>();
  final _auth = Auth();
  String email;
  String password;
  final adminPassword = "admin1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(KPrimaryColor),
          ),
          inAsyncCall: Provider.of<ModelHud>(context).isShown,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ///image
                  Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      width: MediaQuery.of(context).size.width,
                      child:
                          Container(child: Image.asset('lib/images/logo.png'))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),

                  ///text
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'DISCOVER THE\nLATEST MOVIES,',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'secularOne',
                              fontSize: 25,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'with all rates and insights.',
                            style: TextStyle(
                              color: KPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'secularOne',
                              fontSize: 20,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  ///form
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.42,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: _key,
                        child: Column(
                          children: <Widget>[
                            CustomTextField("Email", (value) {
                              email = value;
                            }),
//
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextField("Password", (value) {
                              password = value;
                            }),
//
                            SizedBox(
                              height: 25,
                            ),

                            ///button
                            Container(
                              height: 40,
                              width: 120,
                              child: Builder(
                                builder: (context) => RaisedButton(
                                  onPressed: () {
                                    _validateUser(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  color: KPrimaryColor,
                                  child: Text(
                                    'Log In',
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
                            SizedBox(
                              height: 15,
                            ),

                            ///sign up row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don\'t Have An Account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SecularOne',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    'Sign Up.',
                                    style: TextStyle(
                                      color: KPrimaryColor,
                                      fontFamily: 'SecularOne',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),

                            ///Admin user widget
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    final isAdmin = Provider.of<AdminMode>(
                                        context,
                                        listen: false);
                                    isAdmin.changeIsAdmin(true);
                                  },
                                  child: Text(
                                    'Admin?',
                                    style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? Colors.black
                                          : KPrimaryColor,
                                      fontFamily: 'SecularOne',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final isAdmin = Provider.of<AdminMode>(
                                        context,
                                        listen: false);
                                    isAdmin.changeIsAdmin(false);
                                  },
                                  child: Text(
                                    'User?',
                                    style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? KPrimaryColor
                                          : Colors.black,
                                      fontFamily: 'SecularOne',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateUser(BuildContext context) async {
    if (Provider.of<AdminMode>(context, listen: false).isAdmin == true) {
      final modelHud = Provider.of<ModelHud>(context, listen: false);
      modelHud.changeIsShow(true);
      if (_key.currentState.validate()) {
        _key.currentState.save();
        if (password == adminPassword) {
          try {
            await _auth.signIn(email, password);
            modelHud.changeIsShow(false);

          } catch (e) {
            modelHud.changeIsShow(false);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                e.message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: KPrimaryColor,
            ));
          }
        } else {
          modelHud.changeIsShow(false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              "Something Went Wrong",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: KPrimaryColor,
          ));
        }
      }
    } else if (Provider.of<AdminMode>(context, listen: false).isAdmin ==
        false) {
      final modelHud = Provider.of<ModelHud>(context, listen: false);
      modelHud.changeIsShow(true);
      if (_key.currentState.validate()) {
        _key.currentState.save();
        try {
          await _auth.signIn(email, password);
          modelHud.changeIsShow(false);
        } catch (e) {
          modelHud.changeIsShow(false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              e.message,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: KPrimaryColor,
          ));
        }
      }
      modelHud.changeIsShow(false);
    }
  }
}
