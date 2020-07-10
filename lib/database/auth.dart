import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fire_base/database/dataBase.dart';
import 'package:flutter_fire_base/model/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User userFromFireBase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => userFromFireBase(user));
  }

  Future singInAnonimous() async {
    try {
      AuthResult resolt = await _auth.signInAnonymously();

      FirebaseUser user = resolt.user;

      return userFromFireBase(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future singInEmail(String email, String password) async {
    try {
      AuthResult resoltEmail = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      FirebaseUser userEmail = resoltEmail.user;
      return userEmail;
    } catch (e) {
      print("problemmm sing in");
      print(e.toString());
      return null;
    }
  }

  Future<User> singUpEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
      // creat a document for the user whith the uid
      await DatabasseService(uid: user.uid).updateUserData('2', 'Person', 100);
      return userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
