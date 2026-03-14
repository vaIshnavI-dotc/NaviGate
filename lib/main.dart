import 'package:flutter/material.dart';
import 'models/node_model.dart';
import 'services/navigation_service.dart';

void main() {
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

  final List<String> path =
      NavigationService.findRoute(graph, 'Entrance', 'Room101');

  final List<String> instructions =
      NavigationService.convertToInstructions(path, graph);

  runApp(MyApp(path: path, instructions: instructions));
}

class MyApp extends StatelessWidget {
  final List<String> path;
  final List<String> instructions;

  const MyApp({
    super.key,
    required this.path,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Algorithm Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'Shortest Path:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                path.join(' → '),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Instructions:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...instructions.map(
                (step) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    step,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}