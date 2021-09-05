import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firephotogallery/pages/Elysia.dart';
import 'package:flutter/material.dart';

class ElysiaGalleryScreen extends StatefulWidget {
  @override
  _ElysiaGalleryScreenState createState() => _ElysiaGalleryScreenState();
}

class _ElysiaGalleryScreenState extends State<ElysiaGalleryScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text('Elysia'),
        actions: [
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ElysiaUploadScreen()));
              })
        ],
      ),
      body: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("elysia").snapshots(),
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
