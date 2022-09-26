import 'package:animate_do/animate_do.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/navigator.dart';
import 'package:food_app/models/introduction_model.dart';
import 'package:food_app/moduels/landscape_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
//

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          body: ConcentricPageView(
              curve: Curves.linear,
              colors: const <Color>[
                Colors.orange,
                Colors.black54,
                Colors.amber,
                Colors.black54,
              ],
              itemCount: concentrics.length,
              onFinish: () {
                Get.offAll(() => MainNavigator(),
                    transition: Transition.cupertino);
              },
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (int index) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.offAll(() => MainNavigator(),
                                transition: Transition.cupertino);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      child: SizedBox(
                        height: 290,
                        width: 300,
                        child: Lottie.network(concentrics[index].lottie,
                            animate: true),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      child: Text(
                        concentrics[index].text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 100),
                        child: Text(
                          "${index + 1} / ${concentrics.length}",
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      );
    } else {
      return const LandScape();
    }
  }
}
