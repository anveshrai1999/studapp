import 'package:flutter/material.dart';
import 'package:schoolmanagement/screens/studentdashboard.dart';

class studentspage extends StatefulWidget {
  @override
  _studentspageState createState() => _studentspageState();
}

class _studentspageState extends State<studentspage> {
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
      body: studentdashboard(),
    );
  }
}
