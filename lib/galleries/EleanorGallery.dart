import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firephotogallery/pages/Eleanor.dart';
import 'package:flutter/material.dart';

class EleanorGalleryScreen extends StatefulWidget {
  @override
  _EleanorGalleryScreenState createState() => _EleanorGalleryScreenState();
}

class _EleanorGalleryScreenState extends State<EleanorGalleryScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('Eleanor'),
        actions: [
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EleanorUploadScreen()));
              })
        ],
      ),
      body: Container(
        color: Colors.purple[300],
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("eleanor").snapshots(),
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
