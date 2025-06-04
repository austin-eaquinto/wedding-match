import 'package:flutter/material.dart';
import 'chatFeature.dart'; // Import the chatFeature class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Center(
          child: Text('Engaged Dating Vendors'))),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context) => ChatFeature())); // Returns to the previous screen
  },
  child: const Text('Go to chat'),
) 
          ),
        ),
      );
  }
}