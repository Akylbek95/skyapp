import 'dart:ui';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sky_net/News.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsWindows extends StatefulWidget {
  const NewsWindows({Key? key}) : super(key: key);

  @override
  State<NewsWindows> createState() => NewsWindowsState();
}

class NewsWindowsState extends State<NewsWindows> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Новости"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('News').snapshots(),
            builder:
            //Проверка есть ли данные в бд
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                //Иконка загрузки
                return const CircularProgressIndicator();
              }
              // Если данные есть возвращаем ListView
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(snapshot.data!.docs[index].id),
                      child: Card(
                        child: ListTile(
                          title: Center(
                            //Картинка в ListView
                            child: Image.network(
                              snapshot.data!.docs[index].get('mediaURL'),
                              width: 150,
                              height: 150,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              // Значения заголовка из бд
                              Center(
                                child: Text(
                                  snapshot.data!.docs[index].get('title'),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              // Текст новости из бд
                              Text(
                                snapshot.data!.docs[index].get('text'),
                                maxLines: 3,
                                overflow: TextOverflow.clip,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                // Количество лайков

                                child: Row(
                                  children:[
                                    Text('Нравится :',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    Text(" " + snapshot.data!.docs[index].get('likes').toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.deepOrangeAccent,
                            ),
                            onPressed: () {

                              Navigator.push(context,MaterialPageRoute(builder: (context) => News(index: index,)));

                            },
                          ),
                        ),
                      ),
                      onDismissed: (direction) {},
                    );
                  });
            }));
  }

}
