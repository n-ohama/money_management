import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  const DateChip({Key? key, required this.createdAt}) : super(key: key);
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        '${createdAt.month}/${createdAt.day}',
        style: const TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
