import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'dart:typed_data';

import '../../../widgets/input_text.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showProgessBar = false;
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Uint8List? _image;

  Future<void> galleryImage() async {
    Uint8List? im = await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future<void> captureImage() async {
    Uint8List? im = await _authController.pickProfileImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              30.height,
              GestureDetector(
                onTap: galleryImage,
                child: _image == null
                    ? const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  backgroundImage:
                  AssetImage("assets/images/profile_avatar.jpg"),
                )
                    : CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  backgroundImage: MemoryImage(_image!),
                ),
              ),
              15.height,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  emptyText: "Username is required",
                  textEditingController: userNameEditingController,
                  labelString: 'Username',
                  isObscure: false,
                  iconData: Icons.person_outline,
                ),
              ),
              10.height,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  emptyText: "Email is required",
                  textEditingController: emailEditingController,
                  labelString: 'Email',
                  isObscure: false,
                  iconData: Icons.email_outlined,
                ),
              ),
              10.height,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  emptyText: "Password is required",
                  textEditingController: passwordEditingController,
                  labelString: 'Password',
                  isObscure: true,
                  iconData: Icons.lock_outline,
                ),
              ),
             20.height,
              showProgessBar == false
                  ? Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            showProgessBar = true;
                          });
                          String res = await _authController.createNewUser(
                            userNameEditingController.text,
                            emailEditingController.text,
                            passwordEditingController.text,
                            _image,
                          );
                          setState(() {
                            showProgessBar = false;
                          });

                          if (res == 'success') {
                            Get.to(() => const LoginScreen());
                          } else {
                            print("Error: $res");
                          }
                        } else {
                          print("not valid");
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              )
                  : const SimpleCircularProgressBar(
                progressColors: [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                  Colors.amber,
                  Colors.blueAccent
                ],
                backColor: Colors.white70,
                animationDuration: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
