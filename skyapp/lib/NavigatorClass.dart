
import 'package:flutter/material.dart';
import 'package:sky_net/AdminWindow.dart';
import 'package:sky_net/ChatWindow.dart';

import 'News.dart';
import 'NewsWindow.dart';
import 'SettingWindow.dart';
import 'HomePage.dart';

class NavigationClass extends StatefulWidget {
  const NavigationClass({Key? key}) : super(key: key);

  @override
  State<NavigationClass> createState() => _HomePageState();
}

class _HomePageState extends State<NavigationClass> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    NewsWindows(),
    SettingWindow(),
    ChatWindow(),
    AdminWindow(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Профиль'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Новости'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чат'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'Admin')
        ],
      ),
    );
  }
}
