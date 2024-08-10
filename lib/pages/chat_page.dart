import 'package:flutter/material.dart';
import 'package:scholar_chat/chat_bubble.dart';
import 'package:scholar_chat/constats.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text(
              'Chat App',
              style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const ChatBubble(
            message: 'Hello I am new to this App',
          );
        },
      ),
    );
  }
}
