// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';

class LoginWindow extends StatelessWidget {
  LoginWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.redAccent,
          )
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20.0, right: 50.0, left: 50.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Логин",
                    helperText: "Логин используется для входа в систему",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Пароль",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/NavigatorClass');
                  },
                  child: Text("Войти"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Registration');
                  },
                  child: Text("Зарегистрироваться"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
