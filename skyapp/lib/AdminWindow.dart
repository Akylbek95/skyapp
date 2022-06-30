// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: prefer_const_constructors

// class AdminWindow extends StatefulWidget {
//   const AdminWindow({Key? key}) : super(key: key);
//
//   @override
//   State<AdminWindow> createState() => _AdminWindowState();
// }
//
// class _AdminWindowState extends State<AdminWindow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Админ панель'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0,top: 20.0),
//             child: ElevatedButton(
//               child: Text("Добавить новость"),
//               style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0)),shadowColor: Colors.black26),
//               onPressed: () {
//                 addNews();
//               },
//             ),
//           )
//           ],
//       ),
//     );
//   }
//   addNews(){
//
//   }
// }

class AdminWindow extends StatefulWidget {
  const AdminWindow({Key? key}) : super(key: key);

  @override
  State<AdminWindow> createState() => _AdminWindowState();
}

class _AdminWindowState extends State<AdminWindow> {
  File? image;
  File? imageName;
  String titleNews = "";
  String textNews = "";


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagename = File(image.name);
      final imageTemporary = File(image.path);
      setState(() {
        this.imageName = imagename;
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image : $e');
    }
  }

  Future uploadImage(String imagePath, String imageName) async {
    File file = File(imagePath);
    try {
      await FirebaseStorage.instance
          .ref('NewsPicture/$imageName')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить новость'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [



// Добавление заголовка новостей
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Заголовок новости',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              onChanged: (String title){
                titleNews = title;
              },
              obscureText: false,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),




// Добавление текста новости
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Новость',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              onChanged: (String text) {
                textNews = text;
              },
              maxLines: 6,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), fillColor: Colors.black),
            ),


// Добавление фото для новости
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: Text("Выбрать изображение",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    shadowColor: Colors.black26),
                onPressed: () {
                  pickImage();
                },
              ),
            ),



//Препросмотр новости
            Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10.0,right: 5.0),
                      child: ElevatedButton(
                        child: Text("Препросмотр новости",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            shadowColor: Colors.black26),
                        onPressed: () {},
                      )),



                  // Загрузить новость
                  Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: ElevatedButton(
                        child: Text("Загрузить новость",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            shadowColor: Colors.black26),
                        onPressed: () {
                          uploadImage(image!.path,imageName!.path);
                          FirebaseFirestore.instance.collection('News').add({'likes': 0 , 'mediaURL': "" , 'text' : textNews , 'title' : titleNews});
                        },
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
