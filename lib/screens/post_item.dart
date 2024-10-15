import 'package:flutter/material.dart';

class PostItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Item Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Item Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle image upload
              },
              child: Text("Upload Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle post submission
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
