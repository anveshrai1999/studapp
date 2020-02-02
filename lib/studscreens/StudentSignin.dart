import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/studscreens/rolecheck.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        Container(
          height: 400,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('images/background.png'))),
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 30,
                  width: 80,
                  height: 250,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/light-1.png'))),
                  )),
              Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/light-2.png'))),
                  )),
              Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/clock.png'))),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an email';
                    }
                    if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(input)) {
                      return 'please enter a valid email id';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'EMAIL', icon: Icon(Icons.email)),
                  onSaved: (input) => _email = input,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(labelText: 'PASSWORD',icon: Icon(Icons.input),suffixIcon: Icon(Icons.remove_red_eye,
                  )),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                RaisedButton(
                  elevation: 5,

                  color: Colors.white,
                  onPressed: signIn,
                  child: Text('Sign in',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,

                  ),),
                ),
              ],
            )),
      ]),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => roleCheck(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
