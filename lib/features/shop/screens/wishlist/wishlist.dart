import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:new_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:new_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/home.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add,onPressed: ()=>Get.to(const HomeScreen()),),

        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_,index)=>TProductCardVertical(

                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
