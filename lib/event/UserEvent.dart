import 'dart:developer';
import 'package:flutter_provider/Base/BaseEvent.dart';

class LoginEvent extends BaseEvent {
  final String userName;
  final String password;

  LoginEvent(this.userName, this.password) {
    log('user: ' + userName);
    log('pass: ' + password);
  }
}

class SignUpEvent extends BaseEvent {
  final String userName;
  final String password;
  final int otpPass;

  SignUpEvent(this.userName, this.password, this.otpPass);
}