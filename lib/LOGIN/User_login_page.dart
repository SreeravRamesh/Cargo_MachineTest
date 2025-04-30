import 'package:cargocollectionmanagement/HOME/USER_HOME/User_Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../HOME/ADMIN_HOME/admin_Home.dart';
import '../firebase_options.dart';
import 'Driver_login_page.dart';
import '../REGISTER/User_Register_page.dart';



class CargoUserLogin extends StatefulWidget {
  const CargoUserLogin({super.key});

  @override
  State<CargoUserLogin> createState() => _CargoUserLoginState();
}

class _CargoUserLoginState extends State<CargoUserLogin> {

  TextEditingController name=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;


  Future<void> login() async {
    try {
      String email = username.text.trim();
      String pass = password.text.trim();

      await auth.signInWithEmailAndPassword(email: email, password: pass);

      if (email == "admin@gmail.com" && pass == "admin123") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserHomePage()));
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Error: ${e.toString()}")),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue[300],
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 340,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text("CUSTOMER LOGIN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),),
              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),),
              ),
              SizedBox(height: 30,),

              ElevatedButton(onPressed:login,
                  child: const Text("LOGIN")),

              SizedBox(height: 30,),

              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoUserRegister()));},
                  child: Text("Not logged yet ? Register here")),

              SizedBox(height: 30,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoDriverLogin()));
            }, child: Text("Not a Customer ? Login here as a Driver"))



            ],
          ),
        ),
      ),
    );
  }
}
