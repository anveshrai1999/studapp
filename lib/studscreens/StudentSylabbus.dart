import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentSylabbus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('Sylabbus').snapshots(),
        builder: (context, snapshot) {
          // ignore: missing_return
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snapshot.data.documents[index];

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Subject:${mypost['Subject']}',
                            style: TextStyle(fontSize: 20.0, color: Colors.blue),
                          ),
                          Text(
                            'TextBook:${mypost['TextBook']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          Text(
                            'Unit 1:${mypost['Unit 1']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          Text(
                            'Unit 2:${mypost['Unit 2']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          Text(
                            'Unit 3:${mypost['Unit 3']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          Text(
                            'Unit 4:${mypost['Unit 4']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          Text(
                            'Unit 5:${mypost['Unit 5']}',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.orange),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
    ;
  }
}
