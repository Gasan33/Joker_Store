import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singUp/verify_email.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singUp/widgets/terms_and_conditions_check_box.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSingUpForm extends StatelessWidget {
  const TSingUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputField,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// TermConditions CheckBox
          const TTermsAndConditionCheckBox(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// SIng Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(
                () => const VerifyEmailScreen(),
              ),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
