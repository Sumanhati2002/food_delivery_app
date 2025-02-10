import 'package:flutter/material.dart';

class MenuItemCard extends StatefulWidget {
  final String title;
  final String price;
  final String rating;
  final String reviews;
  final String description;
  final String imageUrl;
  final Function(int, double) onCartUpdate;

  const MenuItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.imageUrl,
    required this.onCartUpdate,
  });

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int count = 0; // Counter state

  @override
  Widget build(BuildContext context) {
    double itemPrice = double.parse(widget.price.replaceAll("₹", ""));
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber[700]),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${widget.reviews})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Must Try',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              count == 0
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count = 1;
                        });
                        widget.onCartUpdate(1, itemPrice); // Add item to cart
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        side: const BorderSide(color: Colors.pink),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('ADD'),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                } else {
                                  count = 0; // Reset to "ADD" button
                                }
                              });
                              widget.onCartUpdate(
                                  -1, itemPrice); // Remove item from cart
                            },
                            icon: const Icon(Icons.remove, color: Colors.pink),
                          ),
                          Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                              widget.onCartUpdate(
                                  1, itemPrice); // Add item to cart
                            },
                            icon: const Icon(Icons.add, color: Colors.pink),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
