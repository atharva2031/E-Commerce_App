import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/widgets/count_controller.dart';

import '../product_views/products.dart';
import '../state_management/controllers/cart_controller.dart';
import 'app_theme.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cartController = Get.put(CartController());

  var cartItems = <Product>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cartItems = cartController.cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: AppTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: AppTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Back',
                        style: AppTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Cart',
                    style: AppTheme.of(context).title1,
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetX<CartController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      AppTheme.of(context).secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x320E151B),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Hero(
                                        tag: 'ControllerImage',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            controller.cartItems[index].image,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Text(
                                                controller
                                                    .cartItems[index].name,
                                                style: AppTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          AppTheme.of(context)
                                                              .primaryText,
                                                    ),
                                              ),
                                            ),
                                            Text(
                                              '\$${controller.cartItems[index].price}',
                                              style: AppTheme.of(context)
                                                  .bodyText2,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                'Quanity: ${controller.cartItems[index].quantity}',
                                                style: AppTheme.of(context)
                                                    .bodyText2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          CountController(
                                            decrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.remove_rounded,
                                              color: enabled
                                                  ? AppTheme.of(context)
                                                      .secondaryText
                                                  : AppTheme.of(context)
                                                      .secondaryText,
                                              size: 16,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.add_rounded,
                                              color: enabled
                                                  ? AppTheme.of(context)
                                                      .primaryColor
                                                  : AppTheme.of(context)
                                                      .secondaryText,
                                              size: 16,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style: AppTheme.of(context)
                                                  .subtitle1,
                                            ),
                                            count: controller
                                                .cartItems[index].quantity,
                                            updateCount: (count) => setState(
                                                () => controller
                                                    .cartItems[index]
                                                    .quantity = count),
                                            stepSize: 1,
                                            minimum: 1,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete_outline_rounded,
                                              color: Color(0xFFE86969),
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              controller.removeFromCart(
                                                  cartItems[index]);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Price Breakdown',
                              style: AppTheme.of(context).bodyText2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Base Price',
                              style: AppTheme.of(context).subtitle2,
                            ),
                            Text(
                              '\$${controller.totalPrice}',
                              style: AppTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxes',
                              style: AppTheme.of(context).subtitle2,
                            ),
                            Text(
                              controller.totalPrice == 0 ? '\$0.00' : '\$24.20',
                              style: AppTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cleaning Fee',
                              style: AppTheme.of(context).subtitle2,
                            ),
                            Text(
                              controller.totalPrice == 0 ? '\$0.00' : '\$40.00',
                              style: AppTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Total',
                                  style: AppTheme.of(context).subtitle2,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.info_outlined,
                                    color: Color(0xFF57636C),
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                            Text(
                              controller.totalPrice == 0
                                  ? '0.00'
                                  : '\$${controller.totalPrice + 24.20 + 40.00}',
                              style: AppTheme.of(context).title1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x320E151B),
                      offset: Offset(0, -2),
                    )
                  ],
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(0),
                  //   bottomRight: Radius.circular(0),
                  //   topLeft: Radius.circular(16),
                  //   topRight: Radius.circular(16),
                  // ),
                ),
                alignment: AlignmentDirectional(0, -0.35),
                child: Text(
                  controller.totalPrice == 0
                      ? 'Checkout (\$0.00)'
                      : 'Checkout (\$${controller.totalPrice + 24.20 + 40.00})',
                  style: AppTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: AppTheme.of(context).primaryBtnText,
                      ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
