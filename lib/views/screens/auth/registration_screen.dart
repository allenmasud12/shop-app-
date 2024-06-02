import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),

              const SizedBox(
                height: 15,
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
                  textEditingController: userNameEditingController,
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
                  textEditingController: userNameEditingController,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showProgessBar = true;
                        });
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
                backColor: Colors.white30,
                animationDuration: 30,
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
                    onTap: (){
                      Get.to(LoginScreen());
                    },
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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