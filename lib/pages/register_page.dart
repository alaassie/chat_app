import 'package:flutter/material.dart';
import 'package:scholar_chat/constats.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });
  static String id = 'RegisterPage';
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
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const CustomTextField(
            hintText: 'Email',
          ),
          const CustomTextField(
            hintText: 'Password',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(color: kBlackColor),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account'),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: kWhiteColor,
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
