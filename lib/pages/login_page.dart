import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constats.dart';
import 'package:scholar_chat/helper/show_snack_bar_method.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  final GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Container(
        color: kPrimaryColor,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                kLogo,
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                hintText: 'Email',
                onChanged: (data) {
                  email = data;
                },
              ),
              CustomTextField(
                hintText: 'Password',
                onChanged: (data) {
                  password = data;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
                          showSnackBar(context, 'Success');
                          Navigator.pushNamed(context, ChatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, 'No user found for that email');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context, 'Wrong password provided for that user');
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: kBlackColor),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: kWhiteColor,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
