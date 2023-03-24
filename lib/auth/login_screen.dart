import 'package:bmi_calculator/auth/signup_screen.dart';
import 'package:bmi_calculator/provider/firebase_provider.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/widgets/custom_textfield.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
            child: Image.asset(
              'assets/images/bmi.png',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red.shade200,
              ),
              child: Form(
                key: _loginKey,
                child:
                    // Consumer<FirebaseProvider>(
                    //     builder: (context, firpro, child) {
                    //   return
                    Column(
                  children: [
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Enter your Email Id',
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    Container(
                      // padding: EdgeInsets.all(12),
                      width: 250,

                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_loginKey.currentState!.validate()) {
                            //   firpro
                            //       .loginWithFirebase(
                            //           email: _emailController.text,
                            //           password: _passwordController.text)
                            //       .then((value) {
                            //     if (value) {
                            //       BotToast.showText(text: 'Login Successful');
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => MyHomePage()));
                            //     }
                            //   });
                            // }
                            // ;
                          },
                          child: Text('Sign In'),
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Do not have an account,  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text('Sign Up',
                            style: TextStyle(color: Colors.white70)),
                      ))
                    ]))
                  ],
                ),
                // }
              )),
          // )
        ],
      ),
    );
  }
}
