import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final String price;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFF0EFEF),
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 10.0,
              bottom: 2,
            ),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              category,
              style: const TextStyle(color: Colors.black54, fontSize: 11),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4, bottom: 10),
            child: Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}