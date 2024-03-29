import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/constants/text_strings.dart';
import 'package:new_ecommerce_app/utils/vaildators/vaildation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),

            /// Text Fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
                validator: TValidator.validateEmail,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                  () => controller.sendPasswordResetEmail(),

                child: const Text(TTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
