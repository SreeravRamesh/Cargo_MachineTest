import 'dart:async';

import 'package:cargocollectionmanagement/LOGIN/User_login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import '../firebase_options.dart';

void main()
async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: CargoSplash(),
  debugShowCheckedModeBanner: false,));
}




class CargoSplash extends StatefulWidget {
  const CargoSplash({super.key});

  @override
  State<CargoSplash> createState() => _CargoSplashState();
}

class _CargoSplashState extends State<CargoSplash> {

  @override
  void initState(){
    Timer(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CargoUserLogin()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        height: double.infinity,width: double.infinity,

        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text("CARGO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),)
          ],
        ),),
    );
  }
}
