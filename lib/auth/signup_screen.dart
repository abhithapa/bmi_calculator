import 'package:flutter/material.dart';
import 'package:bmi_calculator/provider/firebase_provider.dart';
import 'package:bmi_calculator/widgets/custom_textfield.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _signUpFromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signUpFromKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 15),
          child:
              Consumer<FirebaseProvider>(builder: (context, fireProv, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_signUpFromKey.currentState!.validate()) {
                          fireProv
                              .signUpWithFirebase(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            print('*********singup valure ********');
                            print(value);
                            if (value) {
                              BotToast.showText(text: 'Signup successfully');
                            }
                          });
                        }
                      },
                      child: const Text('Signup')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'Already have an account  ',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    WidgetSpan(
                        child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ))
                  ])),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

