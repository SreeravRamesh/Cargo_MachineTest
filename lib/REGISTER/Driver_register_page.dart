
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CargoDriverRegister extends StatefulWidget {
  const CargoDriverRegister({super.key});

  @override
  State<CargoDriverRegister> createState() => _CargoDriverRegisterState();
}

class _CargoDriverRegisterState extends State<CargoDriverRegister> {

  final TextEditingController name=TextEditingController();
  final TextEditingController username=TextEditingController();
  final TextEditingController password=TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<void> register() async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: username.text.trim(),
        password: password.text.trim(),
      );
      await firestore.collection('newDriver').doc(userCredential.user!.uid).set({
        'name':name.text.trim(),
        'email':username.text.trim(),
        'password':password.text.trim(),

        'createdAt':FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const  SnackBar(content: Text("Registration Succcessful")),
      );
      Navigator.pop(context);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Register Error: ${e.toString()}"))
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(color: Colors.blue[300],
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 305,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text("DRIVER REGISTER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),),
              ),
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
                  ),
                ),
              ),
              SizedBox(height: 30,),

              ElevatedButton(onPressed:register,
                  child: Text("REGISTER")),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
