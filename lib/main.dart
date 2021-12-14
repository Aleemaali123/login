import 'package:flutter/material.dart';
import 'package:login_demo/login.dart';
import 'package:login_demo/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var name = prefs.getString("name");
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: name == null ? ScreenLogin() : HomePage(),));
}
