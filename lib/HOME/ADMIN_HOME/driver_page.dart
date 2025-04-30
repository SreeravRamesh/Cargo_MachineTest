
import 'package:flutter/material.dart';




class DriverAdminPage extends StatefulWidget {
  const DriverAdminPage({super.key});

  @override
  State<DriverAdminPage> createState() => _DriverAdminPageState();
}

class _DriverAdminPageState extends State<DriverAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue[100],
          title: Text("DRIVERS",style: TextStyle(fontSize: 20),),),
        body: ListView.builder(itemBuilder: (context,index){
          return Card(color: Colors.blue[100],
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text("Hari"),
                      SizedBox(width: 20,),
                      Text("hari@gmail.com",style: TextStyle(fontSize: 10),),
                    ],
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Icon(Icons.edit,color: Colors.green,)),
                      SizedBox(width: 15,),
                      ElevatedButton(onPressed: (){},  child: Icon(Icons.delete,color: Colors.red,))
                    ],
                  ),


                ),


              ],
            ),
          );
        },itemCount: 20,)
    );
  }
}

