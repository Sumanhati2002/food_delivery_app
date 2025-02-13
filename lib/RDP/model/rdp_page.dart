import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart_model.dart';
import 'package:food_delivery_app/provider/cart.dart';
import 'package:food_delivery_app/provider/rdp_page_provider.dart';
import 'package:food_delivery_app/viewcart_page/viewcart.dart';
import 'package:provider/provider.dart';

import '../ui/menu_item.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

final List<Map<String, dynamic>> menuItems = [
  {
    "sku": "123456",
    "title": "Plant Protien Bowl",
    "price": 220.7,
    "rating": 4,
    "reviews": "11",
    "description": "[Veg preparation] Spring mix, plant based, organic...",
    "imageUrl":
        "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Eat%20Healthy%20%20page-cqqBw4KXo39q2kiHrPXqtsMXipQOxN.png"
  },
  {
    "sku": "123455",
    "title": "Plant Protien",
    "price": 220.7,
    "rating": 4,
    "reviews": "11",
    "description": "[Veg preparation] Spring mix, plant based, organic...",
    "imageUrl":
        "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Eat%20Healthy%20%20page-cqqBw4KXo39q2kiHrPXqtsMXipQOxN.png"
  },
  {
    "title": "Plant Protien Bowl",
    "price": 220.7,
    "rating": 4,
    "reviews": "11",
    "description": "[Veg preparation] Spring mix, plant based, organic...",
    "imageUrl":
        "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Eat%20Healthy%20%20page-cqqBw4KXo39q2kiHrPXqtsMXipQOxN.png"
  }
];

class _RestaurantPageState extends State<RestaurantPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  bool isVegSelected = false;
  bool isEggSelected = false;

  List<ProductModel> product = [];

  /* int cartItemCount = 0;
  double totalPrice = 0.0;

  void updateCart(int itemCount, double itemPrice) {
    setState(() {
      cartItemCount += itemCount;
      totalPrice += itemCount * itemPrice;
    });
  }*/

  @override
  void initState() {
    super.initState();
    menuItems?.forEach((element) {
      product.add(ProductModel.fromJson(element));
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final cartItem = context.watch<CartStore>().cartItem;
    return Scaffold(
      body: Consumer<RdpPageProvider>(
        builder: (context, value, child) => SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const BackButton(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Eat Healthy',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Healthy food, South Indian',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Kukatpally, Hyderabad',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '4.2',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color:
                        Colors.black, // Black background for the selected tab
                    borderRadius:
                        BorderRadius.circular(8), // Optional: rounded corners
                  ),
                  tabs: const [
                    Tab(text: 'DELIVERY'),
                    Tab(text: 'DINING'),
                    Tab(text: 'REVIEWS'),
                  ],
                ),
              ),

              // Delivery Info
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.delivery_dining, color: Colors.grey),
                            SizedBox(width: 8),
                            Text('MODE'),
                            SizedBox(width: 8),
                            Text(
                              'delivery',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.grey),
                            const SizedBox(width: 8),
                            const Text('TIME'),
                            const SizedBox(width: 8),
                            Text(
                              '40 mins',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.electric_bike, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          '₹25 distance charge',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Menu Tabs
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.black12, // Border color
                      width: 2.0,
                    )),
                child: Row(
                  children: [
                    const Text(
                      'Full Menu',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Healthy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Filters
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    FilterChip(
                      selected: isVegSelected,
                      label: const Text('Veg'),
                      onSelected: (bool value) {
                        setState(() {
                          isVegSelected = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      selected: isEggSelected,
                      label: const Text('Egg'),
                      onSelected: (bool value) {
                        setState(() {
                          isEggSelected = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.red),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Items
              Expanded(
                  child: ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        final items = product[index];
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: MenuItemCard(
                            onCartUpdate: value.updateCart,
                            model: items,
                          ),
                        );
                      })),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                child: const Text(
                  'Use code ZOMSAFETY on orders with items worth ₹159 or more',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // it will show view cart if user click on add button
              cartItem.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${cartItem.length} Items | ₹${value.totalPrice}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => CheckoutScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text("View Cart",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
