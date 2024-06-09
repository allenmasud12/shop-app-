import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/views/screens/auth/registration_screen.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../widgets/input_text.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                 const Text(
                    "Login Screen",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      letterSpacing: 4
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                  const SizedBox(height: 10,),
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
                  const SizedBox(height: 30,),
                  showprogressBar == false?
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: InkWell(
                          onTap: (){
                            if(_formkey.currentState!.validate()){
                              setState(() {
                                showprogressBar = true;
                              });
                              print("valid");
                            }else{
                              print("invalid");
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ):const SimpleCircularProgressBar(
                    progressColors: [
                      Colors.green,
                      Colors.blue,
                      Colors.red,
                      Colors.amber,
                      Colors.blueAccent
                    ],
                    backColor: Colors.white30,
                    animationDuration: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not have an Account? ",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),),
                      InkWell(
                        onTap: () {
                          Get.to(() => const RegistrationScreen());
                        },
                        child: const Text("SignUp Now",style: TextStyle(
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
    );
  }
}
