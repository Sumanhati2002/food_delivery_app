import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/cart.dart';
import 'package:food_delivery_app/provider/rdp_page_provider.dart';
import 'package:provider/provider.dart';

import 'home_page/ui/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RdpPageProvider()),
        ChangeNotifierProvider(create: (context) => CartStore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomePage(),
      ),
    );
  }
}
