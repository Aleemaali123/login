import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[700],
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 22,
          ),
        ),
      ),
      drawer: Drawer(
        child: SizedBox(
          height: 10,
          width: 10,
          child: Center(
            child: ElevatedButton(
                child: const Text("Logout"),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("name").then((value) =>
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenLogin()),
                          (route) => false));
                }),
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(35, 15, 50, 0),
          child: Text(
            "KASARAGOD",
            style: TextStyle(
              color: Colors.blueAccent[100],
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            "Kasaragod is one of the 14 districts in the southern Indian state of Kerala. Its northern border Thalappady is located just 10 km south to Ullal, which is the southernmost portion of the major port city Mangalore, on the southwestern Malabar coast of India.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.lightBlue[50],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset('assets/kasargod_image.jpg'),
        Text(
          "There are as many as seven languages used actively by a considerable number of people in Kasaragod. Though the administrative language is Malayalam, Tulu, Beary bashe, Kannada, Marathi and Konkani are also spoken.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.lightBlue[50],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
