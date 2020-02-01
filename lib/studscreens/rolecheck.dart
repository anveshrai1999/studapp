import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolmanagement/studscreens/studentspage.dart';

class roleCheck extends StatelessWidget {
  const roleCheck({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Student')
            .document(user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return checkRole(snapshot.data);
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }

  Container checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data == null) {
      return Container(
        child: Text('no data set in the userId document in firestore'),
      );
    }
    if (snapshot.data['role'] == 'student') {
      return studpagePage(snapshot);
    } else {
      return null;
    }
  }

  Container studpagePage(DocumentSnapshot snapshot) {
    return Container(
      child: studentsPage(user: user),
    );
  }
}
