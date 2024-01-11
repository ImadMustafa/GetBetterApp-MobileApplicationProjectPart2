import 'package:flutter/material.dart';
import 'test.dart';
import 'user.dart';
import 'userinfo.dart';
import 'articles.dart';
import 'sports.dart';
import 'signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  final String name;
  const Home(this.name);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String openingResult = 'Uknown';
  Color openingColor = Colors.white;
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

  @override
  Widget build(BuildContext context) {

    String username = widget.name;
    User? userx = ModalRoute.of(context)?.settings.arguments as User?;

    for (int index = 0; index < list.length; index++) {
      if (username == list[index]['username']) {
        openingResult = list[index]['result'];

        break;
      }
    }

      if (openingResult == "Too Bad") {
        openingColor = Color(0xFF440D0D);
      }
      if (openingResult == "Bad") {
        openingColor = Color(0xFFC52323);
      }
      if (openingResult == "Ok") {
        openingColor = Color(0xFFEFCB84);
      }
      if (openingResult == "Good") {
        openingColor = Color(0xFF97EC49);
      }
      if (openingResult == "Amazing") {
        openingColor = Color(0xFF94CCF3);
      }


    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Signin(),
              )
          );
        }, icon: const Icon(Icons.logout)),
      ],title: Center(child: Text("Better Me", style: TextStyle(color: Color(0xFFE18C8C), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)), backgroundColor: Colors.white, automaticallyImplyLeading: false,),
      backgroundColor: Color(0xFFE89191),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: 600,
                child: Column(children: [
                  SizedBox(height: 40,),
                  Text("Press here for health test", style: TextStyle(color: Color(
                      0xFFF1B2B2), fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE18C8C),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Test(username),
                            )
                        );
                      },
                      child: Icon(Icons.fingerprint, size: 140,color: Colors.white,)),
                  SizedBox(height: 30,),
                ],),
              ),
              Container(color: Color(0xEAFFFFFF),height: 15,width: 600,),
              Container(color: Color(0xD8FFFFFF),height: 15,width: 600,),
              Container(color: Color(0xBEFFFFFF),height: 20,width: 600,),
              Container(color: Color(0x93FFFFFF),height: 20,width: 600,),
              Container(color: Color(0x3CFFFFFF),height: 30,width: 600,),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You are: ", style: TextStyle(fontSize: 25),),
                        Text(userx?.result() ?? openingResult, style: TextStyle(fontSize: 50, color: userx?.resultColor() ?? openingColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserInfo(username),
                            settings: RouteSettings(arguments: userx),
                          )
                      );
                    },child: Text("More Information", style: TextStyle(fontSize: 20,color: Color(0xFFE18C8C), fontWeight: FontWeight.bold)),),
                    SizedBox(height: 35,),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Page(pageLink: Sports(), imagepath: "images/sports.png",),
                  SizedBox(width: 30,),
                  Page(pageLink: Articles(), imagepath: "images/articles.png",),
                ],
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),


    );
  }
}

class Page extends StatelessWidget {

  final Widget pageLink;
  final String imagepath;

  const Page({
    required this.pageLink,
    required this.imagepath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => pageLink,
          )
      );
    },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Image.asset(imagepath, width: 170,));
  }
}

