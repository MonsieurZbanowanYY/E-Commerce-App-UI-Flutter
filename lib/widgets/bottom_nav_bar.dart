import 'package:e_commerce_ui/pages/home_page.dart';
import 'package:e_commerce_ui/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

Widget buildBottomNavBar(int currIndex, Size size, bool isDarkMode) {
  return BottomNavigationBar(
    iconSize: size.width * 0.07,
    elevation: 0,
    selectedLabelStyle: const TextStyle(fontSize: 0),
    unselectedLabelStyle: const TextStyle(fontSize: 0),
    currentIndex: currIndex,
    backgroundColor: const Color(0x00ffffff),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: isDarkMode ? Colors.indigoAccent : Colors.black,
    unselectedItemColor: const Color(0xff3b22a1),
    onTap: (value) {
      if (value != currIndex) {
        if (value == 0) {
          Get.off(const HomePage());
        }
      }
    },
    items: [
      buildBottomNavItem(
        UniconsLine.home,
        isDarkMode,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.heart,
        isDarkMode,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.shopping_cart_alt,
        isDarkMode,
        size,
      ),
      buildBottomNavItem(
        UniconsLine.user,
        isDarkMode,
        size,
      ),
    ],
  );
}
