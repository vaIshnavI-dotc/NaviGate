import 'package:flutter/material.dart';

class InstructionCard extends StatelessWidget {
  final String instruction;

  const InstructionCard({
    super.key,
    required this.instruction,
  });

  IconData getDirectionIcon(String text) {
    if (text.toLowerCase().contains("left")) {
      return Icons.turn_left;
    } else if (text.toLowerCase().contains("right")) {
      return Icons.turn_right;
    } else if (text.toLowerCase().contains("straight")) {
      return Icons.straight;
    } else if (text.toLowerCase().contains("destination")) {
      return Icons.location_on;
    } else {
      return Icons.directions_walk;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              getDirectionIcon(instruction),
              size: 40,
              color: Colors.blue,
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                instruction,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}