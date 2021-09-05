import 'package:firephotogallery/galleries/EmberleyGallery.dart';
import 'package:flutter/material.dart';

import 'galleries/EleanorGallery.dart';
import 'galleries/ElysiaGallery.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          'Galleries',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.pink[200],
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ElysiaGalleryScreen();
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    ' Elysia Rose  ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                color: Colors.pink,
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return EleanorGalleryScreen();
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Eleanor Violet',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                color: Colors.pink,
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return EmberleyGalleryScreen();
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Emberley Aster',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
