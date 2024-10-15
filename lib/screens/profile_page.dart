import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';  
import 'package:lostnfound_app/screens/signin_screen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("My Posted Items", style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Dummy data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Posted Item $index"),
                  );
                },
              ),
              ),
              ElevatedButton(
        onPressed:() {
          //firebase added
          FirebaseAuth.instance.signOut().then((value) {
            print('Signed Out');
            Navigator.push(context,MaterialPageRoute(builder:(context) => const SignInScreen()));
          });
        },
          child: const Text(
          'Logout',
        ),
        ),
          ],
        ),
      ),
    );
  }
}


