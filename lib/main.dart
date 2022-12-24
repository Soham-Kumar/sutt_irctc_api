import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.tealAccent, //<-- SEE HERE
      ),
      home: AuthService().handleAuthState(),
    );
  }
}