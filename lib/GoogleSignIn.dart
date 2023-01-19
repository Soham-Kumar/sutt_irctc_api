import 'package:flutter/material.dart';
import 'auth_service.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  googleLogin() async {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign in with Google',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 1.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 5.00,
          backgroundColor: Colors.greenAccent[400],
        ), //AppBar
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 270.0, 8.0, 10.0),
              child: MaterialButton(
                padding: const EdgeInsets.all(12),
                color: Colors.greenAccent[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
                child: const Text(
                    'Google Sign in',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),


            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: MaterialButton(
            //     padding: const EdgeInsets.all(12),
            //     color: Colors.greenAccent[400],
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            //     child: const Text(
            //       'Log Out',
            //       style: TextStyle(color: Colors.black, fontSize: 18),
            //     ),
            //     onPressed: () {
            //       AuthService().signOut();
            //     },
            //   ),
            // ),


            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: MaterialButton(
            //     padding: const EdgeInsets.all(12),
            //     color: Colors.greenAccent[400],
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            //     child: const Text(
            //       'Sign In With Phone Number',
            //       style: TextStyle(color: Colors.black, fontSize: 18),
            //     ),
            //     onPressed: () {
            //       AuthService().signInWithPhone();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}