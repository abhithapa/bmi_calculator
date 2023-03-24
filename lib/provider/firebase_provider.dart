import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<bool> loginWithFirebase(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      print(user?.email);
      print(user?.uid);
      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        BotToast.showText(text: 'No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        BotToast.showText(text: 'Wrong Password provided for the user');
        return false;
      } else {
        BotToast.showText(text: '${e.message}');
        return false;
      }
    }
  }

  Future<bool> signUpWithFirebase(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        BotToast.showText(text: 'The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        BotToast.showText(text: 'The account already exists for that email.');
        return false;
      } else {
        BotToast.showText(text: '${e.message}');
        return false;
      }
    }
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
