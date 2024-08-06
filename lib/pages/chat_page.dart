import 'package:flutter/material.dart';
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
      body: Container(
        alignment: Alignment.centerLeft,
        height: double.minPositive,
        width: double.minPositive,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: const Text('Hello I am new to this App'),
      ),
    );
  }
}
