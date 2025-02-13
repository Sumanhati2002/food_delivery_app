
 import 'package:flutter/cupertino.dart';

class RdpPageProvider with ChangeNotifier{

  int cartItemCount = 0;
  double totalPrice = 0.0;

  void updateCart(int itemCount, double itemPrice) {
      cartItemCount += itemCount;
      totalPrice += itemCount * itemPrice;
      notifyListeners();
  }
 }

