import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Gasan Mansour',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(width: TSizes.spaceBtwItems/2,),

        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('+971-545-671677',style: Theme.of(context).textTheme.bodyLarge,),

          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems/2,),

        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('South Liane, Maine 887695, USA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),

          ],
        ),
      ],
    );
  }
}
