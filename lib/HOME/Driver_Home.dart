import 'package:flutter/material.dart';

import '../Profile/profile_page.dart';


class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cargo Collection Management App"),
        bottom: AppBar(title: Container(child: Text("DRIVERS",style: TextStyle(fontSize: 20),),),),
          actions: [
            CircleAvatar(child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileCargoPage()));
            }, icon: Icon(Icons.person)),)
          ],),
        body: ListView.builder(itemBuilder: (context,index){
          return Card(color: Colors.blue[100],
            child: ListTile(
              title: Row(
                children: [
                  Text("Rahul"),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text("House NO:4, 7th cross, Brigade road",style: TextStyle(fontSize: 10),),
                      Text("10:30 AM",style: TextStyle(fontSize: 10),),
                    ],

                  ),
                ],
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){}, child: Icon(Icons.done,color: Colors.green,)),
                  SizedBox(width: 15,),
                  ElevatedButton(onPressed: (){},  child: Icon(Icons.do_not_disturb,color: Colors.red,))
                ],
              ),


            ),
          );
        },itemCount: 20,)
    );
  }
}
