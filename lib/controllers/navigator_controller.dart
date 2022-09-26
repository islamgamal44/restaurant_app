import 'package:get/get.dart';

class NavigatorController extends GetxController {
  int currentIndex = 0;

  void changeNavBarIndex(int index) {
    currentIndex = index;
    update(["change NavBar Index"]);
  }
}
