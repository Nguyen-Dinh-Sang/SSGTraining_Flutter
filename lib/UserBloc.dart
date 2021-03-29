import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exercise/UserEvent.dart';
import 'package:flutter_exercise/UserState.dart';

class UserBloc {
  // mặc địch ban đầu chưa nhập gì nên không hợp lệ.
  UserState state = UserState(false, false);

  // nhận dữ liệu từ UI
  final eventController = StreamController<UserEvent>();

  // trả dữ liệu cho UI
  final stateController = StreamController<UserState>();

  final transformer = StreamTransformer<String, String>.fromHandlers(handleData: (String data, sink) {
    data += '-data-plus';
    sink.add(data);
  });

  UserBloc() {
    eventController.stream.listen((UserEvent event) {
      log('bloc listen');
      if (event is LoginEvent) {
        log('bloc login event');
        //đăng nhập
        String userName = event.userName;
        String password = event.password;
        bool userNameInvalid = false;
        bool passwordInvalid = false;

        if (userName.length < 6) {
          userNameInvalid = false;
        } else {
          userNameInvalid = true;
        }

        if (password.length < 6) {
          passwordInvalid = false;
        } else {
          passwordInvalid = true;
        }

        state = UserState(userNameInvalid, passwordInvalid);

        // gửi UI kết quả
        stateController.sink.add(state);
      }

      if (event is SignUpEvent) {
        // đăng kí
      }
    });
  }

// khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
