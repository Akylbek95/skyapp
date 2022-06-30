// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sky_net/NewsWindow.dart';





class News extends StatefulWidget {

  final index;


  const News({Key? key,this.index}) : super(key: key);



  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новости'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('News').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            child: Column(
              children: [
                // title новости
                Text(snapshot.data!.docs[widget.index].get('title'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),),
                // фото новости
                Image.network(
                  snapshot.data!.docs[widget.index].get('mediaURL'),
                  width: 350,
                  height: 350,),
                // текст новости
                Text(snapshot.data!.docs[widget.index].get('text'),
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),),
                // Количество лайка и его логика
                Row(
                  children: [
                    IconButton(
                      icon:Icon(Icons.heart_broken_sharp),
                      onPressed: (){
                        likeClick();

                      },
                    ),
                    Text(" " + snapshot.data!.docs[widget.index].get('likes').toString()),
                    Text(" Нравится")

                  ],
                )

              ],
            ),
          );
        },
      ),
    );
  }
// логика кнопки лайка
  likeClick() {
  }
}
