import '../product_views/products.dart';

abstract class CartState {
  final List<Product> cartItem;
  final bool isGridView;
  const CartState({this.cartItem = const [], this.isGridView = true});

}

class ChangeGalleryViewState extends CartState {
  final bool isGridView;

  const ChangeGalleryViewState({required this.isGridView})
      : super(isGridView: isGridView);

  
}
