import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/homepage/view/homepage.dart';
import 'package:last_minute/helper/loading.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:last_minute/helper/snackbar.dart';

class LogInController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  final prefs = SPController();
  final auth = FirebaseAuth.instance;

  //Otp Screen
  final _sendOtp = false.obs;
  bool get sendOtp => _sendOtp.value;
  late String _verificationId;
  onSendOtp() async {
    if (mobileNumberController.text.length != 10) {
      snackbar("Please enter a valid mobile number");
      return;
    }
    
    log("Sending Otp to: ${mobileNumberController.text}");
    _sendOtp(true);
    auth.verifyPhoneNumber(
      phoneNumber: "+91${mobileNumberController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        snackbar(e.message.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //Otp value
  final _otp = ''.obs;
  String get otp => _otp.value;
  onChangedOtp(String x) {
    _otp(x);
  }

  onLogin() async {
    LoadingUtils.showLoader();
    log("otp: $otp");
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);
      log("verfication completed");
      
          await auth.signInWithCredential(credential).then((userCredential) {
        var uid = userCredential.user!.uid;
        prefs.setIsLoggedin(true);
        prefs.setUserId(uid);
        LoadingUtils.hideLoader();
        Homepage.launch();
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
      _sendOtp(false);
    }
  }
}
