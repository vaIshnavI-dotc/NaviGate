import 'package:flutter/material.dart';
import 'navigation_screen.dart';

class VoiceInputScreen extends StatefulWidget {
  const VoiceInputScreen({super.key});

  @override
  State<VoiceInputScreen> createState() => _VoiceInputScreenState();
}

class _VoiceInputScreenState extends State<VoiceInputScreen> {
  final TextEditingController _destinationController = TextEditingController();

  void _goToNavigation() {
    final destination = _destinationController.text.trim();

    if (destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a destination')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationScreen(destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Destination Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter or speak your destination',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _destinationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Example: Room101 or Pharmacy',
                labelText: 'Destination',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToNavigation,
              child: const Text('Start Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}