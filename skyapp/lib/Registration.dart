// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}



class _RegistrationState extends State<Registration> {



  @override
  void initState() {
    super.initState();
  }

  String password = "";
  String login = "";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Регистрация",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20.0, right: 50.0, left: 50.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(children:  [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: TextField(
                obscureText: false,
                onChanged: (String UserLogin){
                  login = UserLogin;
                },
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
                obscureText: false,
                onChanged: (String userpassword){
                  password = userpassword;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Пароль",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: TextField(
                obscureText: false,
                onChanged: (String confirmPassword){
                  if(confirmPassword == password){
                    password = confirmPassword;
                  }else{
                    // password = "";
                    print(confirmPassword);
                    print(password);
                    print(login);
                    print("Пароли не совпадают");
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Подтвердите пароль",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  if(password == "" || login == ""){
                    print("Заполните все поля!");
                  }else {

                    FirebaseFirestore.instance.collection('User').add({'login': login , 'password':password});

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/HomePage', (route) => false);
                  }
                },
                child: Text("Войти"),
              ),
            ),
          ],
          ),
        )
    );
  }

}
