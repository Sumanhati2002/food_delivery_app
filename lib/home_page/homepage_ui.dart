import 'package:flutter/material.dart';

import 'model/home-model.dart';

class HomePage1 extends StatelessWidget{

  final List<Map<String, dynamic>> banners = [
    {
      "color": Colors.blue,
      "title": "New Arrivals",
      "subtitle": "Check them out!"
    },
    {
      "color": Colors.green,
      "title": "Limited Offer",
      "subtitle": "Grab before it ends!"
    },
    {
      "color": Colors.red,
      "title": "Discount 50%",
      "subtitle": "Save big today!"
    },
    {
      "color": Colors.orange,
      "title": "Flash Sale",
      "subtitle": "Only for 24 hours!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                hintText: 'Restaurant name, cuisine, or a dish...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),

          // Filter Options
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [],
            ),
          ),

          // Promotional Banners
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  final banner = banners[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: PromotionalBanner(
                      color: banner["color"],
                      title: banner["title"],
                      subtitle: banner["subtitle"],
                    ),
                  );
                }),
          ),

          // Food Categories
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eat what makes you happy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: const [
                    FoodCategory(icon: '🥗', label: 'Healthy'),
                    FoodCategory(icon: '🍔', label: 'Burger'),
                    FoodCategory(icon: '🍕', label: 'Pizza'),
                    FoodCategory(icon: '🥘', label: 'Haleem'),
                    FoodCategory(icon: '🍗', label: 'Chicken'),
                    FoodCategory(icon: '🍔', label: 'Burger'),
                    FoodCategory(icon: '🍰', label: 'Cake'),
                    FoodCategory(icon: '🥙', label: 'Shawarma'),
                  ],
                ),
              ],
            ),
          ),

          //see more option

          // Restaurant Listings
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '396 restaurants around you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                RestaurantCard(
                  image: 'assets/burger2.jpg',
                  name: 'Amul',
                  rating: 4.5,
                  isEcoFriendly: true,
                ),
                SizedBox(
                  height: 16,
                ),
                RestaurantCard(
                  image: 'assets/bruger.jpg',
                  name: 'Amul',
                  rating: 4.5,
                  isEcoFriendly: true,
                ),
                SizedBox(
                  height: 16,
                ),
                RestaurantCard(
                  image: 'assets/burger2.jpg',
                  name: 'Amul',
                  rating: 4.5,
                  isEcoFriendly: true,
                )
                // Add more restaurant cards...
              ],
            ),
          ),
        ],
      ),
    );
  }
}