import 'package:scholar_chat/constats.dart';

class Message {
  final String message;

  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage]);
  }
}
