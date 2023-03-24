import 'package:bmi_calculator/auth/login_screen.dart';
import 'package:bmi_calculator/initialscreen/splash_screen.dart';
import 'package:bmi_calculator/provider/firebase_provider.dart';
import 'package:bmi_calculator/provider/localdb_provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider()),
        ChangeNotifierProvider(create: (_) => LocalDbProvider()..initIsar()),
      ],
      child: MaterialApp(
        title: 'Flutter Intro',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: SplashScreen(),
        // home: LoginScreen(),
        // home: MyHomePage(),
      ),
    );
  }
}
