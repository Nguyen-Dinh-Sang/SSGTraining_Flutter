import 'dart:developer';

abstract class UserEvent {}

class LoginEvent extends UserEvent {
  final String userName;
  final String password;

  LoginEvent(this.userName, this.password) {
    log('user: ' + userName);
    log('pass: ' + password);
  }
}

class SignUpEvent extends UserEvent {
  final String userName;
  final String password;
  final int otpPass;

  SignUpEvent(this.userName, this.password, this.otpPass);
}