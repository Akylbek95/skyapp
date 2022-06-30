import 'package:flutter/material.dart';

class ChatWindow extends StatefulWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  State<ChatWindow> createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Chat Window",
        style: TextStyle(
          fontSize: 50,
        ),),
    );
  }
}
