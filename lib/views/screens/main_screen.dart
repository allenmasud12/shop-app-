import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/views/screens/account_screen.dart';
import 'package:shop_app/views/screens/cart_screen.dart';
import 'package:shop_app/views/screens/categories_screen.dart';
import 'package:shop_app/views/screens/favorite_screen.dart';
import 'package:shop_app/views/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (v){
          setState(() {
            pageIndex = v;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: primaryColor,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/store-1.png',
              width: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/explore.svg"),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/favorite.svg"),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/account.svg"),
            label: "Account",
          )
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
