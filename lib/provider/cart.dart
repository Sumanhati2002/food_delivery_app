import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/cart_model.dart';

class CartStore extends ChangeNotifier{
  List<ProductModel> cartItem=[];
  void addToCart(ProductModel product){
    bool itemExists = false;

    for (int i = 0; i < cartItem.length; i++) {
      if (cartItem[i].sku == product.sku) {
        cartItem[i] = cartItem[i].copyWith(quanity: (cartItem[i].quanity ?? 0) + 1);
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      cartItem.add(product.copyWith(quanity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    for (int i = 0; i < cartItem.length; i++) {
      if (cartItem[i].sku == product.sku) {
        int currentQuantity = cartItem[i].quanity ?? 0;
        if (currentQuantity > 1) {
          // Decrease the quantity
          cartItem[i] = cartItem[i].copyWith(quanity: currentQuantity - 1);
        } else {
          // Remove the item completely if the quantity is 1
          cartItem.removeAt(i);
        }
        break;
      }
    }
    notifyListeners();
  }
}