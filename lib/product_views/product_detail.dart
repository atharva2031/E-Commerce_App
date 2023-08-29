import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:untitled/state_management/controllers/cart_controller.dart';
import 'package:untitled/widgets/button.dart';
import 'package:untitled/widgets/checkout_widget.dart';

import '../widgets/app_theme.dart';
import '../widgets/count_controller.dart';
import 'products.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  int? countControllerValue;

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF57636C),
            size: 24,
          ),
        ),
        title: Text(
          widget.product.name,
          style: AppTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF151B1E),
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          GetX<CartController>(builder: (controller) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
              child: badges.Badge(
                badgeContent: Text(
                  '${controller.cartItems.length}',
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
                showBadge: true,
                shape: badges.BadgeShape.circle,
                badgeColor: AppTheme.of(context).primaryColor,
                elevation: 4,
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                position: badges.BadgePosition.topEnd(),
                animationType: badges.BadgeAnimationType.scale,
                toAnimate: true,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppTheme.of(context).secondaryText,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutWidget(),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Hero(
              tag: 'mainImage',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.product.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Text(
              'Detailed Product',
              style: AppTheme.of(context).title1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
            child: Text(
              '\$${widget.product.price}',
              textAlign: TextAlign.start,
              style: AppTheme.of(context).subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
              style: AppTheme.of(context).bodyText2,
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x320F1113),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 34),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppTheme.of(context).primaryBackground,
                          width: 2,
                        ),
                      ),
                      child: CountController(
                        decrementIconBuilder: (enabled) => Icon(
                          Icons.remove_rounded,
                          color: enabled
                              ? AppTheme.of(context).secondaryText
                              : AppTheme.of(context).secondaryText,
                          size: 16,
                        ),
                        incrementIconBuilder: (enabled) => Icon(
                          Icons.add_rounded,
                          color: enabled
                              ? AppTheme.of(context).primaryColor
                              : AppTheme.of(context).secondaryText,
                          size: 16,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: AppTheme.of(context).subtitle1,
                        ),
                        count: countControllerValue ??= 1,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 1,
                        minimum: 1,
                      ),
                    ),
                    MyButtonWidget(
                      onPressed: () {
                        Product p = widget.product;
                        p.quantity = countControllerValue!.toInt();
                        cartController.addToCart(widget.product);
                      },
                      text: 'Add to Cart',
                      options: ButtonOptions(
                          width: 160,
                          height: 50,
                          color: AppTheme.of(context).primaryColor,
                          textStyle: AppTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                          elevation: 5,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
