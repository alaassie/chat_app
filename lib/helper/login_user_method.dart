import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginUserMethod(String email, String password) async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
}
