import '../models/node_model.dart';

class Dijkstra {
  static List<String> shortestPath(
    Map<String, List<Neighbor>> graph,
    String start,
    String end,
  ) {
    final Map<String, int> distances = {};
    final Map<String, String?> previous = {};
    final List<String> nodes = [];

    graph.forEach((node, _) {
      distances[node] = node == start ? 0 : 999999;
      previous[node] = null;
      nodes.add(node);
    });

    while (nodes.isNotEmpty) {
      nodes.sort((a, b) => distances[a]!.compareTo(distances[b]!));
      String current = nodes.removeAt(0);

      if (current == end) {
        final List<String> path = [];
        while (previous[current] != null) {
          path.insert(0, current);
          current = previous[current]!;
        }
        path.insert(0, start);
        return path;
      }

      for (final neighbor in graph[current] ?? []) {
       final int alt = (distances[current]! + neighbor.distance).toInt();

        if (alt < (distances[neighbor.node] ?? 999999)) {
          distances[neighbor.node] = alt;
          previous[neighbor.node] = current;
        }
      }
    }

    return [];
  }
}