import 'package:get/get.dart';

import '../../product_views/products.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  addToCart(Product product) {
    cartItems.add(product);
  }

  removeFromCart(Product product) {
    cartItems.remove(product);
  }
}
