import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        const Center(
          child: CircularProgressIndicator(),
        );
        final email = event.email;
        final password = event.password;

        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(AuthFailure(e.code));
          // showSnackBar(context as BuildContext, 'No user found for that email');
        } else if (e.code == 'wrong-password') {
          emit(AuthFailure(e.code));
          // showSnackBar(context as BuildContext, 'Wrong password provided for that user');
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
