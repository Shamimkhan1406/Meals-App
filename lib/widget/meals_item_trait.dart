import 'package:flutter/material.dart';

class MealsItemTrait extends StatelessWidget {
  const MealsItemTrait({
    super.key,
    required this.icon,
    required this.lebel,
  });
  final IconData icon;
  final String lebel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          lebel,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
