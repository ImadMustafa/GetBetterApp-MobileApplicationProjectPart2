import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'signin.dart';


EncryptedSharedPreferences _encryptedData = EncryptedSharedPreferences();

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool _loading = false;

  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 90,),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 50,
                color: Color(0xFFE18C8C),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "Enter the required information",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFE18C8C),
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 70),
            TextField(
              controller: controllerUsername,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE18C8C),
              ),
              onPressed: () {
                setState(() {
                  _loading = true;
                });
                signUp(
                  update,
                  controllerUsername.text.toString(),
                  controllerPassword.text.toString()
                );

                Future.delayed(Duration(seconds: 5), () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Signin(),
                    ),
                  );
                });
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back to the previous screen
              },
              child: Text(
                "Back to Sign In",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFE18C8C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Visibility(visible: _loading, child: const CircularProgressIndicator()),
          ],
        ),
      ),
      )
    );
  }
}
void signUp(Function(String text) update, String username, String password) async {
  try {
    final response = await http.post(Uri.parse('http://10.0.2.2/mobileproject/adduser.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(
            <String, String>{'id': '', 'username': username, 'password': password, 'key': "private_key"}))
        .timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {

      update(response.body);
    }
  } catch (e) {
    update("connection error");
  }
}
