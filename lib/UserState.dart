import 'dart:developer';

class UserState {
  final bool userNameInvalid;
  final bool passwordInvalid;

  UserState(this.userNameInvalid, this.passwordInvalid) {
    log('user invalid: ' + userNameInvalid.toString());
    log('pass invalid: ' + passwordInvalid.toString());
  }
}