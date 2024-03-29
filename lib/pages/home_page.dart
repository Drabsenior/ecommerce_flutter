// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_flutter/components/bottom_nav_bar.dart';
import 'package:ecommerce_flutter/pages/cart_page.dart';
import 'package:ecommerce_flutter/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigationBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Builder(
          builder: (context)=>IconButton(
          icon: Icon(Icons.menu),
          onPressed:(){
            Scaffold.of(context).openDrawer();
          } 
          )
        ),
        backgroundColor: Colors.grey[300],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('lib/images/nike-logo.png',
              color: Colors.white,
              ),
              margin: EdgeInsetsDirectional.only(bottom: 40),
            ),
           
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: ListTile(
              leading: Icon(Icons.home,color: Colors.white,),
              title: Text(
                "Home",
                
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: ListTile(
              leading: Icon(Icons.info,color: Colors.white,),
              title: Text(
                "About",
                
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: ListTile(
              leading: Icon(Icons.logout,color: Colors.white,),
              title: Text(
                "Logout",
                
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ),
           )

          ],
          
        ),
      ),
      body: _pages[_selectedIndex],
       bottomNavigationBar: BottomNavbar(onTabChange: (index)=> navigationBottomBar(index),),
    );
  }
}