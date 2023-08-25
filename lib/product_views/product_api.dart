class Product {
  late String title;
  late String image;
  late int price;

  Product({required this.title, required this.image, required this.price});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    price = int.parse(json['price'].replaceAll(RegExp(r'[^0-9]'), ' '));
  }
}
