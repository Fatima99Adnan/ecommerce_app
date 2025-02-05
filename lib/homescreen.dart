import 'package:ecommerce_app/page/Favorites.dart';
import 'package:ecommerce_app/page/bage.dart';
import 'package:ecommerce_app/page/home.dart';
import 'package:ecommerce_app/page/profile.dart';
import 'package:ecommerce_app/page/shope.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Home(),
    const Shope(),
    const Bage(),
    const Favorites(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
            height: 70,
            child: BottomNavigationBar(
                currentIndex: _currentIndex, // تحديد العنصر المحدد حاليًا
                onTap: (index) {
                  setState(() {
                    _currentIndex =
                        index; // تغيير الـ index عند النقر على أي عنصر
                  });
                },
                backgroundColor: Color(0xffFFFFFF),
                selectedItemColor: Color(0xffEF0602),
                unselectedItemColor: Color(0xffC4C4C4),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart_checkout_rounded,
                      ),
                      label: "Shop"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                      ),
                      label: "Bag"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      label: "Favorites"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_2_outlined,
                      ),
                      label: "Profile"),
                ])),
      ),
    );
  }
}
