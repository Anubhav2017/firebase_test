import 'package:firebase_test/services/authwrapper.dart';
import 'package:firebase_test/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/screens/thankyou.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  authWrapper user = authWrapper();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: deviceHeight *
                          (deviceHeight >= deviceWidth ? 0.5 : 0.9),
                      width: deviceWidth,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/sign_in_cover.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0,
                                  0.1 * deviceHeight,
                                  0.4 * deviceWidth,
                                  0.02 * deviceHeight),
                              child: Text(
                                'Sign Up!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    fontSize: 40),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0.07 * deviceWidth, 0, 0, 0.1 * deviceHeight),
                              child: Text(
                                  'Choose an option to log in to an existing account or create a new one',
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 15),
                                  textAlign: TextAlign.left)),
                        ],
                      )),
                  Container(
                    color: Colors.white,
                    height: deviceHeight * 0.05,
                  ),
                  Container(
                      color: Colors.white,
                      width: deviceWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              width: deviceWidth * 0.8,
                              child: OutlineButton(
                                onPressed: () async {
                                  setState(() => loading = true);
                                  String result = await user.signInWithGoogle();
                                  setState(() => loading = false);
                                  print(result);

                                  if (result != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThankyouPage()));
                                  }
                                },
                                splashColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                highlightElevation: 0,
                                borderSide: BorderSide(color: Colors.grey),
                                child: googleChild,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              width: deviceWidth * 0.8,
                              child: RaisedButton(
                                onPressed: () async {
                                  setState(() => loading = true);
                                  String result =
                                      await user.signInWithFacebook();
                                  setState(() => loading = false);
                                  print(result);

                                  if (result != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThankyouPage()));
                                  }
                                },
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: fbchild,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Container(
                                  width: deviceWidth * 0.8,
                                  child: _EmailButton(context))),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0.1 * deviceWidth,
                                  0.05 * deviceHeight, 0.1 * deviceWidth, 0),
                              child: Text(
                                  "* by logging in you are agreeing to our Terms and Conditions and Privacy Policy",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                      fontSize: 15)))
                        ],
                      ))
                ],
              ),
            ),
          );
  }
}

Padding googleChild = Padding(
  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Sign in with Google',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      )
    ],
  ),
);

Padding fbchild = Padding(
  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image(image: AssetImage("assets/fb.png"), height: 35.0),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Sign in with Facebook',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      )
    ],
  ),
);

Widget _EmailButton(BuildContext context) {
  return RaisedButton(
    color: Colors.yellow,
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.email,
            size: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Continue With Email',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
