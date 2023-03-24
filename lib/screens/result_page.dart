import 'package:bmi_calculator/model/localdb_model.dart';
import 'package:bmi_calculator/provider/localdb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_appbar.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {super.key,
      required this.weight,
      required this.height,
      required this.age,
      required this.gender});

  final int weight;
  final double height;
  final int age;
  final String gender;

  double totalBmi = 0;

  double computeBmi(int weight, double height) {
    totalBmi = (weight / (height * height) * 10000);

    return totalBmi;
  }

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
                Navigator.pop(context);
              },
              child: Text(
                'Re-calculate your Bmi'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ))),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey.shade700),
                child: Column(
                  children: [
                    Text(
                      'Normal'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      computeBmi(weight, height).toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 54.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: totalBmi < 18.5
                              ? 'Under weight : \n'
                              : totalBmi > 18.5 && totalBmi < 24.5
                                  ? 'Normal BMI Range : \n'
                                  : 'Higher body weight \n',
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                      TextSpan(
                          text: totalBmi < 18.5
                              ? '0- 18.5 kg/m2'
                              : totalBmi > 18.5 && totalBmi < 24.5
                                  ? '18.5 - 24.5 kg/m2'
                                  : '24.5+ kg/m2 ',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ])),
                    const SizedBox(height: 15, width: 0),
                    Text(
                      totalBmi < 18.5
                          ? 'You have underweight. Please increse your body weight'
                          : totalBmi > 18.5 && totalBmi < 24.5
                              ? 'You have normal body weight. Good Job'
                              : 'You have higher body weight. Go on a diet ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15, width: 0),
                    Text(
                      'Age : $age',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 15, width: 0),
                    Text(
                      'Gender : $gender',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 15, width: 0),
                    Consumer<LocalDbProvider>(builder: (context, dbpro, child) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black38),
                          onPressed: () {
                            var model = DbModel(age, 0, 0, weight, 0);
                            dbpro.writeToDb(model).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen()));
                            });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ResultScreen()));
                          },
                          child: const Text(
                            'Save Result',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ));
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocalDbProvider>(context, listen: false).readFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocalDbProvider>(builder: (context, dbpro, child) {
        return Column(
          children: [
            ListView.builder(
                itemBuilder: (context, index) {
                  var allDatas = dbpro.dbList[index];
                  return Column(
                    children: [Text(allDatas.age.toString())],
                  );
                },
                itemCount: dbpro.dbList.length)
          ],
        );
      }),
    );
  }
}
