import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firephotogallery/pages/Emberley.dart';
import 'package:flutter/material.dart';

class EmberleyGalleryScreen extends StatefulWidget {
  @override
  _EmberleyGalleryScreenState createState() => _EmberleyGalleryScreenState();
}

class _EmberleyGalleryScreenState extends State<EmberleyGalleryScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        centerTitle: true,
        title: Text('Emberley'),
        actions: [
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmberleyUploadScreen()));
              })
        ],
      ),
      body: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("emberley").snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasError
                ? Center(
                    child: Text("There was an issue loading your images"),
                  )
                : snapshot.hasData
                    ? GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1,
                        children: snapshot.data!.docs
                            .map((e) => Image.network(e.get("url")))
                            .toList(),
                      )
                    : Container();
          },
        ),
      ),
    );
  }
}
