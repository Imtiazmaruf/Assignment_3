import 'dart:convert';

import 'package:assignment_3/photo_datails.dart';
import 'package:assignment_3/photos_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Photos> photoList = [];
bool _getInProgress = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo Gallery App',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Visibility(
        visible: _getInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetails(
                      title: photoList[index].title,
                      imageurl: photoList[index].url,
                      id: photoList[index].id,
                    ),
                  ),
                );
              },
              title: Text(photoList[index].title ?? ''),
              leading: Image.network(photoList[index].thumbnailUrl ?? ''),
            );
          },
        ),
      ),
    );
  }

  Future<void> getFromApi() async {
    _getInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodeRespose = jsonDecode(response.body);
      for (var list in decodeRespose) {
        Photos apiList = Photos.fromJson(list);
        photoList.add(apiList);
      }
    }
    _getInProgress = false;
    setState(() {});
  }
}
