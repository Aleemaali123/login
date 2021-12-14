
import 'package:flutter/material.dart';
import 'package:login_demo/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final _Formkey = GlobalKey<FormState>();
  // final _shared= SharedPreferences()
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Center(
            child: Form(
              key: _Formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'username'),
                      validator: (value) {
                        if (value == "aleema") {
                          return null;
                        } else {
                          return "invalid";
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'password'),
                      validator: (value) {
                        if (value == "123456") {
                          return null;
                        } else {
                          return "invalid";
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () async {
                      if (_Formkey.currentState!.validate()) {
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.setString("name", _usernameController.text).then((value) => Navigator.pushAndRemoveUntil(
                           context, MaterialPageRoute(
                           builder: (context)=>HomePage()),
                               (route) => false));
                       }
                    },
                    // icon: const Icon(Icons.check),
                    // label: const Text('Login Page'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username pass match');
      //GoTo Home

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    } else {}
  }
}

class ScreenHome {}
