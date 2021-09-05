import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../menu.dart';
// import './home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text(
          'Login Screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.purple[400],
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.purple[400],
                    child: Text(
                      'create New User',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
