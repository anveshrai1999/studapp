import 'package:flutter/material.dart';
import 'studscreens/StudentSignin.dart';

class Frontpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightGreenAccent[200], Colors.cyan[100]])),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset('images/animated-student-image-0003.gif'),
              Container(
                  height: 70,
                  width: 150,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Student'),
                    color: Colors.purple[100],
                  )),
              SizedBox(
                height: 100,
              ),
              Image.asset('images/animated-teacher-image-0002.gif'),
              Container(
                  height: 70,
                  width: 150,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Faculty'),
                    color: Colors.purple[100],
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}
