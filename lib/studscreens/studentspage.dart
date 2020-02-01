import 'package:flutter/material.dart';
import 'package:schoolmanagement/studscreens/studentdashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class studentsPage extends StatelessWidget {
  const studentsPage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Student Dashboard'),
        actions: <Widget>[
          RaisedButton(
            focusColor: Colors.white,
            onPressed: () {},
            color: Colors.green,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
      body: studentDashboard(user: user),
    );
  }
}
