import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  backgroundImage:
                      AssetImage("assets/images/profile_avatar.jpg"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 20,
              ),
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
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  showProgessBar = true;
                                });
                                _authController.createNewUser(
                                    userNameEditingController.text,
                                    emailEditingController.text ,
                                    passwordEditingController.text,
                                );
                                print(userNameEditingController);
                                print(emailEditingController);
                                print(passwordEditingController);
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
                      Get.to(LoginScreen());
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
