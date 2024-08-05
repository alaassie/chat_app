import 'package:flutter/material.dart';
import 'package:scholar_chat/constats.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });
  static String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: kPrimaryColor,
      width: double.infinity,
      child: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/scholar.png',
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
                    color: kWhiteColor,
                  ),
                ),
              ],
            ),
          ),
          CustomTextField(
            hintText: 'Email',
          ),
          CustomTextField(
            hintText: 'Password',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
