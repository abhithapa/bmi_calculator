import 'package:bmi_calculator/auth/login_screen.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI Calculator',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Know If Your Health Is In Best Condition',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'The best application to find out your health status.',
                style: TextStyle(fontSize: 10, color: Colors.white60),
              ),
              Image.asset(
                'assets/images/bmi2.png',
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rowIcons(),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 41, 243, 48),
                      ),
                      width: 150,
                      height: 40,
                      // color: Colors.green,
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Already have an account, ',
                      style: TextStyle(color: Colors.grey)),
                  WidgetSpan(
                      child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget rowIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconContainer(
        icon: Icons.g_mobiledata,
        // onTap: () {},
      ),
      SizedBox(
        width: 20,
      ),
      iconContainer(
        icon: Icons.apple_rounded,
        // onTap: () {},
      )
    ],
  );
}

Widget iconContainer({
  required IconData icon,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          // color: Colors.grey.withOpacity(0.5),
          color: Colors.grey,
          spreadRadius: 5,
          // blurRadius: 5,
          // offset: Offset(0, 3),
        ),
      ],
      color: Colors.grey,
    ),
    child: Icon(icon, size: 32.0, color: Colors.black),
  );
}
