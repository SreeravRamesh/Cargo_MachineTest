import 'package:flutter/material.dart';

class ReqColAdminPage extends StatefulWidget {
  const ReqColAdminPage({super.key});

  @override
  State<ReqColAdminPage> createState() => _ReqColAdminPageState();
}

class _ReqColAdminPageState extends State<ReqColAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[100],
        title: Text("Pending Collections",style: TextStyle(fontSize: 20),),),
      body: LayoutBuilder(builder: (context,index){
        return Card(
          child: ListTile(
            title: Text("Customer : Rahul"),
            subtitle: Text("Driver : Hari"),
            trailing: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete,color: Colors.red,)),
          ),
        );
      },),
    );
  }
}
