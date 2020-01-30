import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentNotice extends StatefulWidget {
  @override
  _StudentNoticeState createState() => _StudentNoticeState();
}

class _StudentNoticeState extends State<StudentNotice> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('Student notice').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Text('Loading');
          } else {
            // ignore: missing_return
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snapshot.data.documents[index];

                  return SingleChildScrollView(

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
          }
        });
  }
}
