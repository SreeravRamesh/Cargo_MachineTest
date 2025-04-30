
import 'package:flutter/material.dart';




class CustomerAdminPage extends StatefulWidget {
  const CustomerAdminPage({super.key});

  @override
  State<CustomerAdminPage> createState() => _CustomerAdminPageState();
}

class _CustomerAdminPageState extends State<CustomerAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue[100],
          title: Text("CUSTOMERS",style: TextStyle(fontSize: 20),),),
        body: ListView.builder(itemBuilder: (context,index){
          return Card(color: Colors.blue[100],
            child: ListTile(
              title: Row(
                children: [
                  Text("Rahul"),
                  SizedBox(width: 20,),
                  Text("rahul@gmail.com",style: TextStyle(fontSize: 10),),
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
          );
        },itemCount: 20,)
    );
  }
}

