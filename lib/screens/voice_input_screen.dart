import 'package:flutter/material.dart';

class VoiceInputScreen extends StatelessWidget {
  final String location;

  const VoiceInputScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Destination"),
      ),
      body: Center(
        child: Text(
          "Current Location: $location\nSay your destination",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}