import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:new_ecommerce_app/common/widgets/success_screens/success_screen.dart';
import 'package:new_ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:new_ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:new_ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:new_ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:new_ecommerce_app/navigation_menu.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Coupon TextField
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Payment Method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Address
                    TBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() =>  SuccessScreen(
              image: TImage.success,
              title: 'Payment Success',
              subTitle: 'Your item will be shipping soon!',
              onPressed: ()=> Get.offAll(()=>const NavigationMenu())
          ),
          ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
