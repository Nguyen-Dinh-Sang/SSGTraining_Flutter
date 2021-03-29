import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_exercise/UserBloc.dart';
import 'package:flutter_exercise/UserEvent.dart';
import 'package:flutter_exercise/UserState.dart';
import 'package:flutter_exercise/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyLogin(),
    );
  }
}

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _showPass = false;
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _userNameError = 'User phải trên 6 kí tự';
  String _passwordError = 'Password phải trên 6 kí tự';
  final bloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Flutter Login'),
      ),

      // dùng streambuilder để lăng nghe.
      body: StreamBuilder<UserState>(
          stream: bloc.stateController.stream,
          initialData: bloc.state,
          builder: (BuildContext context, AsyncSnapshot<UserState> snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(
                      child: FlutterLogo(
                        size: 70.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _userNameController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        errorText: snapshot.data.userNameInvalid == false
                            ? _userNameError
                            : null,
                        labelText: 'User name',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Container(
                          child: TextField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            obscureText: !_showPass,
                            decoration: InputDecoration(
                              errorText: snapshot.data.passwordInvalid == false
                                  ? _passwordError
                                  : null,
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        //nhiều đồ chơi hay
                        GestureDetector(
                          onTap: onShowPass,
                          child: Text(_showPass ? 'hide' : 'show',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        ),
                      ],
                    ),
                  ),
                  //khích thước full.
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: onLoginClicked,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  void onLoginClicked() {
    // if (!_userNameInvalid && !_passwordInvalid) {
    //   // Navigator.push(context, MaterialPageRoute(builder: goToHome));
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    // }

    setState(() {
      bloc.eventController.sink
          .add(LoginEvent(_userNameController.text, _passwordController.text));
      log('click' + _userNameController.text + "-" + _passwordController.text);
    });
  }

  Widget goToHome(BuildContext context) {
    return HomePage();
  }

  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
