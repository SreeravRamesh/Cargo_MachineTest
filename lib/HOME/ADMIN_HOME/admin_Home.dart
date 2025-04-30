import 'package:cargocollectionmanagement/HOME/ADMIN_HOME/pending_requets.dart';
import 'package:flutter/material.dart';

import '../../Profile/profile_page.dart';
import 'customer_page.dart';
import 'driver_page.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var screen=[
    ReqColAdminPage(),
    CustomerAdminPage(),
    DriverAdminPage(),
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Cargo Collection Management App"),
      actions: [
        CircleAvatar(child: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileCargoPage()));
        }, icon: Icon(Icons.person)),)
      ],
      ),
      body:  screen[index],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.yellow,
            unselectedItemColor: Colors.red,
            backgroundColor: Colors.blue,
            currentIndex: index,
            onTap: (tapindex){
              setState(() {
                index=tapindex;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.help),label: "COLLECTION REQUESTS"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "CUSTOMERS"),
              BottomNavigationBarItem(icon: Icon(Icons.drive_eta_rounded),label: "DRIVERS"),

            ]),
    );
  }
}
