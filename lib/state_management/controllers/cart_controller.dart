import 'package:get/get.dart';

import '../../product_views/products.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  addToCart(Product product) {
    if (!cartItems.contains(product)) {
      cartItems.add(product);
    }
    update();
  }

  removeFromCart(Product product) {
    if (cartItems.contains(product)) {
      cartItems.remove(product);
    }
    update();
  }
}
