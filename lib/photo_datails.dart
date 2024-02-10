import 'package:flutter/material.dart';

class PhotoDetails extends StatefulWidget {


  const PhotoDetails({super.key, this.title, this.imageurl, this.id});
  final title;
  final imageurl;
  final id;
  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.network(widget.imageurl),
            const SizedBox(
              height: 17,
            ),
            Text('Title : ${widget.title.toString()}'),
            Text('Id : ${widget.id.toString()}'),
          ],
        ),
      ),
    );
  }
}
