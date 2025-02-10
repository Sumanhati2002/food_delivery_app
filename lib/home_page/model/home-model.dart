import 'package:flutter/material.dart';

import '../../RDP/model/rdp_page.dart';

class FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChip({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: selected ? Colors.blue : Colors.grey[200],
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

//promotional banner section of home page
class PromotionalBanner extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  const PromotionalBanner({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCategory extends StatelessWidget {
  final String icon;
  final String label;

  const FoodCategory({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Text(
            icon,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );
  }
}

//restaurant card section
class RestaurantCard extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final bool isEcoFriendly;

  const RestaurantCard({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.isEcoFriendly,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantPage(),
          ),
        );
      },
      child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image, // Replace with your actual image path
              height: 250,
              width: 385,
              fit: BoxFit.cover,
            ),
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Rating Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '4.3',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.star, color: Colors.white, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Subtitle
                const Text(
                  'Healthy food',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),

                // Eco-friendly Text
                Row(
                  children: [
                    const Icon(Icons.eco, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Zomato funds environmental projects to offset delivery carbon footprint',
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Price and Safety Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '300 for one',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'MAX SAFETY DELIVERY',
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}