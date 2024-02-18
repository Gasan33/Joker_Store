import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:new_ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:new_ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// -- Items in Cart
        child: TCartItems()
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=>Get.to(()=> const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}

