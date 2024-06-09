import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/views/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'test app',
      options: const FirebaseOptions(
    apiKey: "AIzaSyDA1HmvoL3Wj5oZpjk9rpuoJQYaY8d-FCU",
    appId: "1:1089360954742:android:26a2736d894a9b655ee657",
    messagingSenderId: "1089360954742",
    projectId: "test-app-5edb5",
    storageBucket: "gs://test-app-5edb5.appspot.com",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
