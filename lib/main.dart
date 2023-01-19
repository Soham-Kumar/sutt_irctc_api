import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'auth_service.dart';
import 'otp.dart';
import 'phone.dart';
import 'station_input.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(home: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, //<-- SEE HERE
      ),
      initialRoute: 'phone',
      routes: {'phone' : (context) => const MyPhone(),
        'otp' : (context) => const MyOtp(),
      'station_input':(context) => MainScreen()},
    );
  }
}
