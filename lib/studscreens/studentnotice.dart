import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('Student notice').snapshots(),
        builder: (context, snapshots) {
          return ListView.builder(
              itemCount: snapshots.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mypost = snapshots.data.documents[index];

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${mypost['notice']}',
                        style: TextStyle(
                            fontSize: 17.0, color: Colors.purpleAccent),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                );
              });
        });
  }
}
