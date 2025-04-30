import 'package:flutter/material.dart';

class RequestStatusPage extends StatelessWidget {
  final String pickupAddress;
  final String instructions;
  final DateTime pickupTime;

  const RequestStatusPage({
    super.key,
    required this.pickupAddress,
    required this.instructions,
    required this.pickupTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
          title: Text("Request Status")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pickup Address: $pickupAddress", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Instructions: $instructions", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Pickup Time: ${pickupTime.toLocal()}".split('.')[0], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
