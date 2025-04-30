
import 'package:flutter/material.dart';


import '../../Profile/profile_page.dart';
import 'Request_status.dart';


class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController instructionController = TextEditingController();

  DateTime? selectedDateTime;

  Future<void> _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Cargo Collection Management App"),
      bottom: AppBar(title: Container(
        child: Text("Cargo Collection Request Form",style: TextStyle(fontSize: 20),),
      ),),
        actions: [
          CircleAvatar(child: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileCargoPage()));
          }, icon: Icon(Icons.person)),)
        ],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: pickupController,
              decoration: InputDecoration(
                hintText: "Pickup Address",
                labelText: "Pickup Address",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20,),
            Text("OR"),

            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.my_location),
                label: Text("Use Current Location"),
              ),
            ),
SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              height: 60, // Same height as typical TextFormField
              child: ElevatedButton(
                onPressed: _pickDateTime,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Same as TextFormField
                  ),
                ),
                child: Text("Select Pickup Date & Time"),
              ),
            ),


            if (selectedDateTime != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Selected: ${selectedDateTime!.toLocal()}".split('.')[0],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

            SizedBox(height: 20),

            TextFormField(
              controller: instructionController,
              decoration: InputDecoration(
                hintText: "Additional Instructions",
                labelText: "Additional Instructions",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                if (selectedDateTime != null &&
                    pickupController.text.trim().isNotEmpty &&
                    instructionController.text.trim().isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestStatusPage(
                        pickupAddress: pickupController.text.trim(),
                        instructions: instructionController.text.trim(),
                        pickupTime: selectedDateTime!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill all fields and select date/time")),
                  );
                }
              },
              child: Text("REQUEST"),
            ),

          ],
        ),
      ),
    );
  }
}




