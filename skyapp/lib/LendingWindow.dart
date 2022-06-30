import 'package:flutter/material.dart';
import 'package:sky_net/HomePage.dart';
import 'package:sky_net/LoginWindow.dart';

class LendingWindow extends StatelessWidget {
  const LendingWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage() : LoginWindow();
  }
}
