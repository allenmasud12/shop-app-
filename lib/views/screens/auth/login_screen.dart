import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/views/screens/auth/registration_screen.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../widgets/input_text.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showprogressBar = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  loginUser() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        showprogressBar = true;
      });
      String res = await _authController.loginUser(
          emailTextEditingController.text, passwordEditingController.text);
      setState(() {
        showprogressBar = false;
      });
      if (res == 'success') {
        Get.snackbar("Login Success", "You are now logged in",
            backgroundColor: Colors.blue);
        Get.to(() => const HomeScreen());
      } else {
        Get.snackbar("Error Occurred", res.toString(),
            backgroundColor: Colors.red);
      }
    }
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    200.height,
                    const Text(
                      "Login Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 4
                      ),
                    ),
                    10.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: InputTextWidget(
                        emptyText: "Enter your valid Email",
                        textEditingController: emailTextEditingController,
                        labelString: "Email",
                        iconData: Icons.email_outlined,
                        isObscure: false,
                      ),
                    ),
                    10.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: InputTextWidget(
                        emptyText: "password is required",
                        textEditingController: passwordEditingController,
                        labelString: "Password",
                        iconData: Icons.lock,
                        isObscure: true,
                      ),
                    ),
                    30.height,
                    showprogressBar == false
                        ? Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 50 > 0 ? MediaQuery.of(context).size.width - 50 : 0,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                loginUser();
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
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
                      animationDuration: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not have an Account? ", style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16
                        ),),
                        InkWell(
                          onTap: () {
                            Get.to(() => const RegistrationScreen());
                          },
                          child: const Text("SignUp Now", style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
