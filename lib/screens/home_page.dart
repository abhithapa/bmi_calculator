import 'package:bmi_calculator/model/localdb_model.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/gender_container_widget.dart';
import 'package:bmi_calculator/widgets/values_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool maleGender = false; // toggle
  // bool femaleGender = false;
  int weightCounter = 20;
  int age = 5;
  double sliderValue = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      bottomNavigationBar: SizedBox(
          height: 65,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                print('*******************');
                print(weightCounter);
                print(sliderValue);

                print((weightCounter / (sliderValue * sliderValue)) * 10000);

                // var model = DbModel(age,0,0,0, weightCounter);


                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              weight: weightCounter,
                              height: sliderValue,
                              age: age,
                              gender: maleGender ? 'Male' : 'Female',
                            )));
              },
              child: Text(
                'Calculate your Bmi'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ))),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          maleGender = !maleGender;
                        });
                        print(maleGender);
                      },
                      child: GenderWidget(
                        icon: Icons.male,
                        gender: 'Male',
                        iconColor:
                            maleGender ? Colors.white : Colors.grey.shade500,
                        textColor:
                            maleGender ? Colors.white : Colors.grey.shade500,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        maleGender = !maleGender;
                      });
                    },
                    child: GenderWidget(
                      icon: Icons.female,
                      gender: 'Female',
                      iconColor:
                          maleGender ? Colors.grey.shade500 : Colors.white,
                      textColor:
                          maleGender ? Colors.grey.shade500 : Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700,
                ),
                child: Column(
                  children: [
                    Text(
                      'Height'.toUpperCase(),
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: sliderValue.toStringAsFixed(0),
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: 'cm',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade300))
                    ])),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoSlider(
                        min: 25,
                        max: 300,
                        value: sliderValue,
                        thumbColor: Colors.pink,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValuesContainer(
                    addFunction: () {
                      setState(() {
                        weightCounter++;
                      });
                    },
                    removeFunction: () {
                      setState(() {
                        weightCounter == 20
                            ? weightCounter == 20
                            : weightCounter--;
                      });
                    },
                    topData: 'Weight',
                    value: weightCounter.toString(),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ValuesContainer(
                    addFunction: () {
                      setState(() {
                        age++;
                      });
                    },
                    removeFunction: () {
                      setState(() {
                        age == 5 ? age == 5 : age--;
                      });
                    },
                    topData: 'Age',
                    value: age.toString(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
