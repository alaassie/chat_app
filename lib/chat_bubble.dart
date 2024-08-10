import 'package:flutter/material.dart';
import 'package:scholar_chat/constats.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Text(
        message,
        style: const TextStyle(color: kWhiteColor),
      ),
    );
  }
}
