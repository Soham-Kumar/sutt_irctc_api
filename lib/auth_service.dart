import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'GoogleSignIn.dart';
import 'station_input.dart';

class AuthService{
  // static var phoneNo;
  // static var OTP;
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const Login();
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signInWithPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNo,
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // Update the UI - wait for the user to enter the SMS code
  //       String smsCode = OTP;
  //
  //       // Create a PhoneAuthCredential with the code
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
  //
  //       // Sign the user in (or link) with the credential
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {}, verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  }, verificationFailed: (FirebaseAuthException error) {  },
  //   );
  // }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}