import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createNewUser(String username, String email, String password) async {
    String res = "some error";

    try {
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection("buyers").doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'buyerId': userCredential.user!.uid,
      });

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
