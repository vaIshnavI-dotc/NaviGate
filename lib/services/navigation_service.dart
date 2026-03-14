import '../algorithms/dijkstra.dart';
import '../models/node_model.dart';

class NavigationService {
  static List<String> findRoute(
    Map<String, List<Neighbor>> graph,
    String start,
    String destination,
  ) {
    return Dijkstra.shortestPath(graph, start, destination);
  }

  static List<String> convertToInstructions(
    List<String> path,
    Map<String, List<Neighbor>> graph,
  ) {
    final List<String> instructions = [];

    for (int i = 0; i < path.length - 1; i++) {
      final String current = path[i];
      final String next = path[i + 1];

      final neighbor = graph[current]!.firstWhere(
        (element) => element.node == next,
      );

      instructions.add('${neighbor.direction.toUpperCase()} to $next');
    }

    return instructions;
  }
}