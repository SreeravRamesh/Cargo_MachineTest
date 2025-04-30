import 'package:cargocollectionmanagement/LOGIN/User_login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileCargoPage extends StatefulWidget {
  const ProfileCargoPage({super.key});

  @override
  State<ProfileCargoPage> createState() => _ProfileCargoPageState();
}

class _ProfileCargoPageState extends State<ProfileCargoPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  String name = "";
  String username = "";

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getUserInfo2();
  }

  Future<void> getUserInfo() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
      await _firestore.collection('newUser').doc(user.uid).get();
      if (snapshot.exists) {
        setState(() {
          name = snapshot['name'] ?? '';
          username = snapshot['email'] ?? '';
        });
      }
    }
  }
  Future<void> getUserInfo2() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
      await _firestore.collection('newDriver').doc(user.uid).get();
      if (snapshot.exists) {
        setState(() {
          name = snapshot['name'] ?? '';
          username = snapshot['email'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Cargo Collection Management App",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ),
              const SizedBox(height: 30),
              Text(
                "Name : $name",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                "Email : $username",
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 30),


              ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoUserLogin()));
                },
                icon: const Icon(Icons.logout),
                label: const Text("LOGOUT", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
