import 'package:firebase_auth/firebase_auth.dart';
import 'package:firephotogallery/screens/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      // ignore: deprecated_member_use
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          color: Colors.amber[700],
          onPressed: () {
            auth.signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
