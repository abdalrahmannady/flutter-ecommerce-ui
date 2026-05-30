import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  CategoryItem({super.key, required this.imagePath, required this.label});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
