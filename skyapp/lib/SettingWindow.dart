import 'dart:ui';

import 'package:flutter/material.dart';

class SettingWindow extends StatelessWidget {
  const SettingWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings Page",
        style: TextStyle(fontSize: 50),),
    );
  }
}
