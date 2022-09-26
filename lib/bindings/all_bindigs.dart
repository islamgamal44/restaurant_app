import 'package:food_app/controllers/discount_controller.dart';
import 'package:food_app/controllers/navigator_controller.dart';
import 'package:food_app/controllers/soup_controller.dart';
import 'package:food_app/controllers/tabbar_controller.dart';
import 'package:get/get.dart';

///
import '../controllers/drawer_controller.dart';
import '../controllers/food_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/switch_controller.dart';
import '../controllers/wallet_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => TabBarController());
    Get.lazyPut(() => SwitchController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => SoupController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => MainDrawerController());
    Get.lazyPut(() => DiscountController());
  }
}
