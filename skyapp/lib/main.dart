// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sky_net/AdminWindow.dart';
import 'package:sky_net/LoginWindow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sky_net/NavigatorClass.dart';
import 'package:sky_net/News.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'FirstWindow.dart';
import 'HomePage.dart';
import 'Registration.dart';
import 'NewsWindow.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "SkyNet",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/HomePage': (context) => HomePage(),
        '/Registration': (context) => Registration(),
        '/LoginWindow': (context) => LoginWindow(),
        '/NewsWindow': (context) => NewsWindows(),
        '/AdminWindow' : (context) => AdminWindow(),
        '/News' : (context) => News(),
        '/NavigatorClass' : (context) => NavigationClass(),
      },
    );
  }
}
