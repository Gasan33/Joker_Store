import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:new_ecommerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImage.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Reviews
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          'The user interface (UI) is the point of human-computer interaction and communication in a device. This can include display screens, keyboards, a mouse and the appearance of a desktop.',
          trimLines: 2,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary,),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary,),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Company Reviews
        TRoundedContainer(
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store", style: Theme.of(context).textTheme.titleMedium,),
                    Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const ReadMoreText(
                  'The user interface (UI) is the point of human-computer interaction and communication in a device. This can include display screens, keyboards, a mouse and the appearance of a desktop.',
                  trimLines: 2,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary,),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary,),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
