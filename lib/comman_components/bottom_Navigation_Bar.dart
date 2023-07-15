import 'package:flutter/material.dart';
import 'package:pet_pic_application/module/homescreen/home_page.dart';
import 'package:pet_pic_application/module/vetnearby/vetNearme.dart';

import '../utils/colors.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);
   final List<Widget> _widgetOptions = <Widget>[
  HomeScreen(),
 VetNearMeScreen(),
  HomeScreen(),
  ];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false, // <-- HERE
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 20,

          selectedIconTheme: IconThemeData(color: Colors.black),
          // selectedItemColor: Colors.amberAccent,

          backgroundColor: Colors.white,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,size: 40,
              ),
              icon: Icon(
                Icons.home,
               color: lightBlackColor,
              ),
                label: "Home",
             
              //backgroundColor: white
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.location_on_outlined,size: 40,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.location_on_outlined,
                  color: lightBlackColor,
                ),
                  label: "Vet Location",
                ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.add_outlined,size: 40,
                  color: Colors.black,
                ),
                  label: "vet grocery",
                icon: Icon(Icons.add_outlined, color:lightBlackColor ),
                ),
         
          ],
          // type: BottomNavigationBarType.fixed,
          //  selectedFontSize: 20,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: lightBlackColor,
          onTap: _onItemTapped,
        ),
          body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),


    );
    

  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // controller.jumpToPage(_selectedIndex);
    });
  }
}