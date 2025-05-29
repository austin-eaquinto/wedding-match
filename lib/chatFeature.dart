import 'package:flutter/material.dart';

class ChatFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Feature'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const ChatScreen()),
            );
          },
          child: const Text('Start Chat'),
        ),
      ),
    );
  }
}

// Move ChatScreen outside of ChatFeature
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the chat!'),
      ),
    );
  }
}