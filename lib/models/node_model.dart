class Neighbor {
  final String node;
  final int distance;
  final String direction;

  Neighbor({
    required this.node,
    required this.distance,
    required this.direction,
  });
}

class Node {
  final String name;
  final List<Neighbor> neighbors;

  Node({
    required this.name,
    required this.neighbors,
  });
}