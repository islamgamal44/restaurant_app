// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/navigator_controller.dart';
import 'package:food_app/moduels/home_screen.dart';
import 'package:food_app/moduels/landscape_screen.dart';
import 'package:food_app/moduels/profile_screen.dart';
import 'package:food_app/moduels/wallet_screen.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class MainNavigator extends StatelessWidget {
  // Screens
  final List<Widget> screens = [
    HomePage(),
    WalletPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Controller
    final _controller = Get.find<NavigatorController>();
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          /// Screens
          body: GetBuilder<NavigatorController>(
              id: "change NavBar Index",
              builder: (context) {
                return screens[_controller.currentIndex];
              }),

          /// bottomNavigationBar
          bottomNavigationBar: GetBuilder<NavigatorController>(
              id: "change NavBar Index",
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: CustomNavigationBar(
                    elevation: 40,
                    iconSize: 30.0,
                    scaleFactor: 0.3,
                    borderRadius: const Radius.circular(20),
                    unSelectedColor: Colors.grey,
                    strokeColor: Colors.white,
                    backgroundColor: Colors.black,
                    selectedColor: Colors.white,
                    isFloating: true,
                    currentIndex: _controller.currentIndex,
                    onTap: (index) {
                      _controller.changeNavBarIndex(index);
                    },
                    items: [
                      /// Home
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.home,
                        ),
                      ),

                      /// Wallet
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.wallet,
                        ),
                      ),

                      /// User Profile
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.user,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      );
    } else {
      return const LandScape();
    }
  }
}
