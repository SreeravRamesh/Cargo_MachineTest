import 'package:cargocollectionmanagement/HOME/Driver_Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../REGISTER/Driver_register_page.dart';
import '../REGISTER/User_Register_page.dart';


class CargoDriverLogin extends StatefulWidget {
  const CargoDriverLogin({super.key});

  @override
  State<CargoDriverLogin> createState() => _CargoDriverLoginState();
}

class _CargoDriverLoginState extends State<CargoDriverLogin> {

  TextEditingController name=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<void> login() async{
    try{
      await auth.signInWithEmailAndPassword(
        email: username.text.trim(),
        password: password.text.trim(),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DriverHomePage()));
    }
    catch (e) {
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
              Text("DRIVER LOGIN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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

              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoDriverRegister()));},
                  child: Text("Not logged yet ? Register here")),

            ],
          ),
        ),
      ),
    );
  }
}
