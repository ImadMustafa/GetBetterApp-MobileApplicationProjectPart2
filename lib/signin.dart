import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  String username = '';
  List list = [];

  Future<void> ReadData() async {
    var url = "http://192.168.1.67/mobileproject/user.php";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      // Check for the "connected" prefix and remove it
      var rawData = res.body;
      if (rawData.startsWith('connected')) {
        rawData = rawData.substring('connected'.length);
      }

      try {
        // Parse the corrected JSON data
        var red = jsonDecode(rawData);

        setState(() {
          list.addAll(red);
        });

        print(list);
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('Failed to load data. Status code: ${res.statusCode}');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
  getData()async{
    await ReadData();
  }

  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  String wrong = "";
  bool enter = false;

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
            Text("Better Me", style: TextStyle(fontSize: 50 ,color: Color(0xFFE18C8C), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            Text("The app that cares for you!", style: TextStyle(fontSize: 20 ,color: Color(0xFFE18C8C), fontStyle: FontStyle.italic),),
            SizedBox(height: 70,),
            TextField(
                    controller: controllerusername,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
            SizedBox(height: 15,),

                  TextField(
                    obscureText: true,
                    controller: controllerpassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
            Text(wrong , style: TextStyle(color: Colors.red),),
            SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE18C8C),
              ),
              onPressed: () async {
                await ReadData(); // Fetch the latest user data before checking credentials
                bool enter = false;
                username = controllerusername.text;
                for (int index = 0; index < list.length; index++) {
                  if (controllerusername.text == list[index]['username'] &&
                      controllerpassword.text == list[index]['password']) {
                    enter = true;
                    break;
                  }
                }
                if (enter) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(username),
                    ),
                  );
                } else {
                  setState(() {
                    wrong = "Wrong username or password!";
                  });
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),


            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      )
                  );


              },
              child: Text("no Account? Sign up here", style: TextStyle(fontSize: 20,color: Color(0xFFE18C8C), fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
      )
    );
  }
}

