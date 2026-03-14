import 'package:flutter/material.dart';
import '../models/node_model.dart';
import '../services/navigation_service.dart';
import '../services/tts_service.dart';

class NavigationScreen extends StatefulWidget {
  final String destination;

  const NavigationScreen({super.key, required this.destination});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final TTSService _ttsService = TTSService();

  List<String> path = [];
  List<String> instructions = [];
  @override
  void initState() {
    super.initState();
    _setupNavigation();
  }

  Future<void> _setupNavigation() async {
    final Map<String, List<Neighbor>> graph = {
      'Entrance': [
        Neighbor(node: 'Corridor', distance: 1, direction: 'straight'),
      ],
      'Corridor': [
        Neighbor(node: 'Entrance', distance: 1, direction: 'straight'),
        Neighbor(node: 'Junction', distance: 1, direction: 'straight'),
      ],
      'Junction': [
        Neighbor(node: 'Corridor', distance: 1, direction: 'straight'),
        Neighbor(node: 'Room101', distance: 1, direction: 'left'),
        Neighbor(node: 'Room102', distance: 1, direction: 'right'),
        Neighbor(node: 'Pharmacy', distance: 1, direction: 'straight'),
      ],
      'Room101': [
        Neighbor(node: 'Junction', distance: 1, direction: 'right'),
      ],
      'Room102': [
        Neighbor(node: 'Junction', distance: 1, direction: 'left'),
      ],
      'Pharmacy': [
        Neighbor(node: 'Junction', distance: 1, direction: 'straight'),
      ],
    };

    path = NavigationService.findRoute(
      graph,
      'Entrance',
      widget.destination,
    );

    instructions = NavigationService.convertToInstructions(path, graph);

    await _ttsService.initTTS();
    await _ttsService.speak(instructions.join('. '));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _ttsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty && instructions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate to ${widget.destination}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () async {
              await _ttsService.speak(instructions.join('. '));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Shortest Path',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              path.join(' → '),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),
            const Text(
              'Instructions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...instructions.map(
              (step) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  step,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
