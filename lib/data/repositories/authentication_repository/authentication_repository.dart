import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:new_ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singUp/verify_email.dart';
import 'package:new_ecommerce_app/navigation_menu.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to show Relevant screen
  screenRedirect() async {
    final user=_auth.currentUser;
    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // if the user's email is verified. navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // if the user's email is not verified. navigate to the Verify Email Screen
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // local storage
      if (kDebugMode) {
        print(
            '========================== GET STORAGE AUTH REPO ========================== ');
        print(deviceStorage.read("isFirstTime"));
      }
      deviceStorage.writeIfNull("isFirstTime", true);

      // check if it's the first time launching the app
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen()) // Redirect to login screen if not the first time
          : Get.offAll(() => const OnBoardingScreen()); // Redirect to onBoarding screen if it's the first time
    }
  }

  /* ------------------------------  Email & Password sing-in -------------------------------- */

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailAuthentication] - Forget Password

/* ------------------------------  Federated identity & social sing-in -------------------------------- */

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

/* ------------------------------  ./end Federated identity & social sing-in -------------------------------- */

  /// [LogoutUser] - Valid for any authentication
 Future<void> logout()async{
   try {
     await FirebaseAuth.instance.signOut();
     Get.offAll(()=> const LoginScreen());
   } on FirebaseAuthException catch (e) {
     throw TFirebaseAuthException(e.code).message;
   } on FirebaseException catch (e) {
     throw TFirebaseException(e.code).message;
   } on FormatException catch (_) {
     throw const TFormatException();
   } on PlatformException catch (e) {
     throw TPlatformException(e.code).message;
   } catch (e) {
     throw 'Something went wrong. Please try again';
   }
  }

  /// DELETE USER - Remove user Auth and FireStore Account
}
