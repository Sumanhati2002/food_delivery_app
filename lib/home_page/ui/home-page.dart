import 'package:flutter/material.dart';
import '../../explore_page/explorepage.dart';
import '../../favorites_page/favoritespage.dart';
import '../../signup_page/signup.dart';
import '../homepage_ui.dart';
import '../model/home-model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage1(),
    ExplorePage(),
    FavoritesPage(),
    signup(),
  ];


  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Profile Button Clicked
      setState(() {});
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  //RestaurantCard list
  /*final List<Map<String, dynamic>> RestaurantCardList = [
    {
      "image": "assets/burger2.jpg",
      "name": "New Arrivals",
      "rating": "2.1",
      "isEcoFriendly": true
    },
    {
      "image": "assets/burger2.jpg",
      "name": "New Arrivals",
      "rating": "2.1",
      "isEcoFriendly": true
    }
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 0,
        leading: const Icon(Icons.location_on_outlined, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
