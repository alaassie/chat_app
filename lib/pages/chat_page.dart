import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/chat_bubble.dart';
import 'package:scholar_chat/constats.dart';
import 'package:scholar_chat/models/message_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
        }

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
                  style: TextStyle(
                      color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return const ChatBubble(
                      message: 'Hello I am new to this App',
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    if (data.isNotEmpty) {
                      messages.add({
                        'message': data,
                      });
                    }
                    controller.clear();
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            messages.add({
                              'message': controller.text,
                            });
                          }
                          controller.clear();
                        }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        )),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
