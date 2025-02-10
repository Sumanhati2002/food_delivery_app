import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int quantity = 1;
  bool isEmergencyOrder = false;
  int? selectedTip;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        height: screenHeight * 0.88,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close, size: 24, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              children: [
                // Delivery Address
                ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                  ),
                  title: const Text(
                      'Delivery at Home - Flat no. 301, SVR Enclave, Hyper Nagar'),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                ),

                // Delivery Time
                ListTile(
                  leading: const Icon(
                    Icons.access_time,
                    color: Colors.green,
                  ),
                  title: const Text('Delivery in 42 mins'),
                ),

                /*const Divider(),*/

                // Order Item
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text('Plant Protien Bowl',
                          style: TextStyle(fontSize: 16)),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() => quantity--);
                          }
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
                      Text('₹${279 * quantity}'),
                    ],
                  ),
                ),

                // Promo Code
                ListTile(
                  leading: const Icon(Icons.local_offer_outlined),
                  title: const Text('Select a promo code'),
                  trailing: const Text('View offers',
                      style: TextStyle(color: Colors.red)),
                ),

                // Tip Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Please tip your valet',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text(
                          'Support your valet and make their day! 100% of your tip will be transferred to your valet.'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTipButton(20),
                          _buildTipButton(30),
                          _buildTipButton(50),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Custom'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Order Summary
                Container(
                  color: Colors.yellow[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildPriceRow('Item Total', '₹${279 * quantity}'),
                        _buildPriceRow('Delivery Charge', '₹50'),
                        _buildPriceRow('Taxes', '₹5.00'),
                        const Divider(),
                        _buildPriceRow(
                            'Grand Total', '₹${(279 * quantity) + 50 + 5}',
                            isTotal: true),
                      ],
                    ),
                  ),
                ),

                // COVID-19 Checkbox
                CheckboxListTile(
                  value: isEmergencyOrder,
                  onChanged: (value) =>
                      setState(() => isEmergencyOrder = value!),
                  title: const Text(
                      'This order is related to a COVID-19 emergency'),
                  subtitle: const Text(
                      'This order will be prepared and delivered on priority. It will be a contactless delivery.'),
                ),

                // Delivery Instructions
                ListTile(
                  title: const Text('Delivery instructions'),
                  trailing:
                      const Text('Change', style: TextStyle(color: Colors.red)),
                ),

                // Climate Conscious Delivery
                ListTile(
                  leading: const Icon(Icons.eco, color: Colors.green),
                  title: const Text('Climate conscious delivery'),
                  subtitle: const Text(
                      'We fund environmental projects to offset the carbon footprint of our deliveries.'),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget _buildTipButton(int amount) {
    bool isSelected = selectedTip == amount;
    return OutlinedButton(
      onPressed: () => setState(() => selectedTip = amount),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red[50] : null,
        side: BorderSide(color: isSelected ? Colors.red : Colors.grey),
      ),
      child: Text(
        '₹$amount',
        style: TextStyle(color: isSelected ? Colors.red : Colors.black),
      ),
    );
  }

  Widget _buildPriceRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
