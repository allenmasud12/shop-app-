import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class AuthController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// function to select image from gallery or camera
  Future<Uint8List?> pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? file = await _imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    } else {
      print("No image selected");
      return null;
    }
  }

  /// upload image
  Future<String> uploadImageToStorage(Uint8List? image) async {
    if (image == null) {
      throw ArgumentError("Image data cannot be null");
    }

    Reference ref = _storage.ref().child("profileImages").child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  /// user auth registration
  Future<String> createNewUser(String username, String email, String password, Uint8List? image) async {
    String res = "some error";

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String? photoUrl;
      if (image != null) {
        photoUrl = await uploadImageToStorage(image);
      }

      await _firestore.collection("buyers").doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'buyerId': userCredential.user!.uid,
        'photoUrl': photoUrl,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  /// LOGIN
    Future<String> loginUser(String email, String password)async{
    String res = "error";
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    }catch(e){
      res = e.toString();
    }
    return res;
    }

}
