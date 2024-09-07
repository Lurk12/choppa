import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String status;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const TextSpan(
                            text: ' | ',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: status,
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.shopping_basket_outlined,
                      color: Color.fromRGBO(12, 81, 63, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}