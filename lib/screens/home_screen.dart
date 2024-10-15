// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lostnfound_app/screens/signin_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() {
//     return _HomeScreenState();
//   }
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: ElevatedButton(
//         onPressed:() {
//           //firebase added
//           FirebaseAuth.instance.signOut().then((value) {
//             print('Signed Out');
//             Navigator.push(context,MaterialPageRoute(builder:(context) => const SignInScreen()));
//           });
//         },
//           child: const Text(
//           'Logout',
//         ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'post_item.dart';  
import 'profile_page.dart';   

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLostItems = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lost and Found"),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLostItems = true;
                  });
                },
                child: Text("Lost Items"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLostItems = false;
                  });
                },
                child: const Text("Found Items"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Dummy data
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.image), // Placeholder for item image
                    title: Text(isLostItems
                        ? "Lost Item $index"
                        : "Found Item $index"),
                    subtitle: const Text("Details about the item"),
                    onTap: () {
                      // Navigate to the ItemDetailScreen when tapped
                    },
                        ),
                      );
                    },
                  ),
                ),
                  ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Post Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      );
  }
}