import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  var currentIndex = 0.obs;
}

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
