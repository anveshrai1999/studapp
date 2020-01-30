import 'package:flutter/material.dart';
import 'studentnotice.dart';
import 'StudentSylabbus.dart';

class studentdashboard extends StatefulWidget {
  @override
  _studentdashboardState createState() => _studentdashboardState();
}

class _studentdashboardState extends State<studentdashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(6),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.redAccent,
              child: Container(
                height: 200,
                child: Card(
                    elevation: 10,
                    margin: EdgeInsets.all(4),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          child: Text('R'),
                          radius: 35,
                        ),
                        Text(
                          'Name:Ramesh',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Email:Ramesh@gmail.com',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'USN:20',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Class:B.E 5th sem',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.green,
              child: Container(
                height: 200,
                child: Card(
                  child: StudentNotice(),

                    ),
              ),
            ),
            Card(
              color: Colors.blue,
              child: Container(
                height: 200,
                child: Card(
                    child:StudentSylabbus(),
                ),
              ),
            ),
            Card(
              color: Colors.orange,
              child: Card(
                child: Text('Attendence'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
