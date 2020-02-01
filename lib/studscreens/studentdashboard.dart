import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'studentnotice.dart';
import 'StudentSylabbus.dart';



class studentDashboard extends StatelessWidget {
  const studentDashboard({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Student')
            .document(user.uid)
            .snapshots(),
        builder: (context, snapshots) {
          DocumentSnapshot mypost = snapshots.data;
          return ListView(padding: EdgeInsets.all(6), children: <Widget>[
            // ignore: missing_return

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
                              child: Text('${mypost['Name']}',
                                style: TextStyle(fontSize: 20),),
                              radius: 35,
                            ),
                            Text(
                              'Name:${mypost['Name']}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Email:${mypost['Email']}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'USN:${mypost['USN']}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Class:${mypost['Branch']} ${mypost['Sem']} ${mypost['Sec']}',
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
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.blue,
                  child: Container(
                    height: 200,
                    child: Card(
                      child: StudentSylabbus(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.orange,
                  child: Card(
                    child: Text('Attendence'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.cyan,
                  child: Card(
                    child: Text('Timetable'),
                  ),
                )
              ],
            ),
          ]);
        });
  }
}
