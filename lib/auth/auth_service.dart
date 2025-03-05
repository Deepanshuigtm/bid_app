import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(String email, String password)async{
    try{
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }catch(e){
      log('Something error1');
    }
  }

  Future<User?> signInUserWithEmailAndPassword(String email, String password)async{
    try{
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }catch(e){
      log('Something error2');
    }
  }
  Future<User?> signInWithCredential(AuthCredential credential)async{
    try{
      final cred = await _auth.signInWithCredential(credential);
      return cred.user;
    }catch(e){
      log('Something error5');
    }
  }

  Future<void> signOutAuth(String email, String password)async{
    try{
      await _auth.signOut();
    }catch(e){
      log('Something error3');
    }
  }
}