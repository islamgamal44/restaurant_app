// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/soup_controller.dart';
import 'package:food_app/controllers/switch_controller.dart';
import 'package:food_app/controllers/wallet_controller.dart';
import 'package:food_app/moduels/details_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class SoupsScreen extends StatelessWidget {
  const SoupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MiddleSoupPageView(),
        BottomSoupGridView(),
      ],
    );
  }
}

/// bottom soup gridview components
class BottomSoupGridView extends StatelessWidget {
  const BottomSoupGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _soupController = Get.find<SoupController>();
    return SizedBox(
      width: w,
      height: h / 2.9,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _soupController.soups.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.currentIndex = index;
                Get.to(() => const DetailsPage());
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1500),
                        child: Container(
                          width: w / 2.4,
                          height: h / 4,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1600),
                        child: Spin(
                          delay: const Duration(milliseconds: 1650),
                          child: SizedBox(
                            width: w / 2.8,
                            height: h / 5.5,
                            child: Center(
                              child: Image.asset(
                                _soupController.soups[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 140,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1700),
                        child: SizedBox(
                          width: w / 2.7,
                          height: h / 30,
                          child: Center(
                            child: Text(
                              _soupController.soups[index].title,
                              style: GoogleFonts.oxygen(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      top: 165,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1800),
                        child: Text(
                          _soupController.soups[index].subtitle,
                          style: GoogleFonts.oxygen(
                              color: const Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 55,
                      top: 185,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1900),
                        child: Text(
                          "\$${_soupController.soups[index].price.toStringAsFixed(2)}",
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 7,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1950),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                              onPressed: () {
                                Get.find<WalletController>().add(
                                  id: _soupController.soups[index].id,
                                  img: _soupController.soups[index].img,
                                  title: _soupController.soups[index].title,
                                  subtitle:
                                      _soupController.soups[index].subtitle,
                                  price: _soupController.soups[index].price,
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: unSelectedColor,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/// Middle soup PageView Widget Components
class MiddleSoupPageView extends StatelessWidget {
  const MiddleSoupPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<SoupController>();
    return SizedBox(
        width: w,
        height: h / 4.5,
        child: PageView.builder(
            itemCount: _foodController.soups.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.currentIndex = index;
                  Get.to(() => const DetailsPage());
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: w / 1.1,
                  child: Stack(children: [
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: FadeInLeft(
                        delay: const Duration(milliseconds: 900),
                        child: Container(
                          width: w / 1.3,
                          height: h / 5.5,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      child: FadeInLeft(
                        delay: const Duration(milliseconds: 1000),
                        child: Spin(
                          delay: const Duration(milliseconds: 1100),
                          child: SizedBox(
                            width: w / 2.5,
                            height: h / 5,
                            child: Hero(
                              tag: _foodController.soups[index].id,
                              child: Image.asset(
                                _foodController.soups[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 170,
                      top: 40,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1200),
                        child: Text(
                          _foodController.soups[index].title,
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 171,
                      top: 75,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1300),
                        child: Text(
                          _foodController.soups[index].subtitle,
                          style: GoogleFonts.oxygen(
                              color: const Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 171,
                      top: 95,
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 1400),
                        child: Text(
                          "\$${_foodController.soups[index].price.toStringAsFixed(2)}",
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 10,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1450),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                              onPressed: () {
                                Get.find<WalletController>().add(
                                  id: _foodController.soups[index].id,
                                  img: _foodController.soups[index].img,
                                  title: _foodController.soups[index].title,
                                  subtitle:
                                      _foodController.soups[index].subtitle,
                                  price: _foodController.soups[index].price,
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: unSelectedColor,
                              )),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }));
  }
}
