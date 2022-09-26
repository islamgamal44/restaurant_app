import 'package:flutter/material.dart';
import 'package:food_app/bindings/all_bindigs.dart';
import 'package:food_app/moduels/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      home: SplashPage(),
    );
  }
}
