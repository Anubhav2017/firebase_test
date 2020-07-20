import 'package:firebase_test/screens/home/home.dart';
import 'package:flutter/material.dart';

class ThankyouPage extends StatefulWidget {
  @override
  _ThankyouPageState createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: size.height * (size.height >= size.width ? 0.5 : 0.9),
                  width: size.width,
                  alignment: Alignment.bottomCenter,
                  child: Image(
                      image: AssetImage('assets/thankyou.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Thank You!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    'Res',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[300],
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    'Skill',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * (size.height >= size.width ? 0.5 : 0.3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF0A76D2),
                        Color(0xFF0AA5F5),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("Let's go!", style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
