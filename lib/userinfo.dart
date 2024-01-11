import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;



import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

bool intToBool(int value) {
  return value == 1 ? true : false;
}

class UserInfo extends StatefulWidget {
  final String name;
  const UserInfo(this.name);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String check = '';
  User openingUser = User('', 0, 0, 0, 0, 0, false, false, false, false);
  String openingResult = 'Unknown';
  Color openingColor = Colors.black;
  List list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> ReadData() async {
    var url = "http://192.168.1.67/mobileproject/user.php";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var rawData = res.body;
      if (rawData.startsWith('connected')) {
        rawData = rawData.substring('connected'.length);
      }

      try {
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

  getData() async {
    await ReadData();
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.name;

    for (int index = 0; index < list.length; index++) {
      if (username == list[index]['username']) {
        openingResult = list[index]['result'];
        openingUser = User(
          list[index]['age'],
          double.parse(list[index]['weight']),
          double.parse(list[index]['height']),
          int.parse(list[index]['diet']),
          int.parse(list[index]['days']),
          int.parse(list[index]['minutes']),
          intToBool(int.parse(list[index]['ocd'])),
          intToBool(int.parse(list[index]['adhd'])),
          intToBool(int.parse(list[index]['overthinking'])),
          intToBool(int.parse(list[index]['positivity'])),
        );
        check = list[index]['age'];

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

    dynamic InfoToString(){
      if (check == ''){
        return 'Take the test from\nprevious page first!';
      }else{
        return openingUser.toString();
      }
    }
    dynamic InfoAnnounce(){
      if (check == ''){
        return 'No result';
      }else{
        return openingUser.announce();
      }
    }
    dynamic InfoResult(){
      if (check == ''){
        return '';
      }else{
        return openingUser.result();
      }
    }
    dynamic InfoTip(){
      if (check == ''){
        return '';
      }else{
        return openingUser.tip();
      }
    }

    User? userx = ModalRoute.of(context)?.settings.arguments as User?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Test's Details"),
      ),
      body: Center(
        child: Container(
          width: 380,
          height: 750,
          decoration: BoxDecoration(
            color: Color(0xFFFAE2E2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userx?.toString() ?? InfoToString(), style: TextStyle(fontSize: 22)),
              SizedBox(height: 10),
              Container(
                width: 355,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Text(userx?.announce() ?? InfoAnnounce(), style: TextStyle(fontSize: 20)),
                    Text(
                      userx?.result() ?? InfoResult(),
                      style: TextStyle(fontSize: 30, color: userx?.resultColor() ?? openingColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 340,
                      child: Text(userx?.tip() ?? InfoTip(), style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFE18C8C),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_left, size: 50, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









// class UserInfo extends StatelessWidget {
//   final String name;
//   const UserInfo(this.name);
//
//
//   User openingUser = User('',0,0,0,0,0,false,false,false,false);
//   String openingResult = 'Uknown';
//   //Color openingColor = Colors.white;
//   List list = [];
//
//   Future<void> ReadData() async {
//     var url = "http://192.168.1.67/mobileproject/user.php";
//     var res = await http.get(Uri.parse(url));
//
//     if (res.statusCode == 200) {
//       // Check for the "connected" prefix and remove it
//       var rawData = res.body;
//       if (rawData.startsWith('connected')) {
//         rawData = rawData.substring('connected'.length);
//       }
//
//       try {
//         // Parse the corrected JSON data
//         var red = jsonDecode(rawData);
//
//         setState(() {
//           list.addAll(red);
//         });
//
//         print(list);
//       } catch (e) {
//         print('Error decoding JSON: $e');
//       }
//     } else {
//       print('Failed to load data. Status code: ${res.statusCode}');
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     getData();
//   }
//   getData()async{
//     await ReadData();
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     String username = widget.name;
//     // User? userx = ModalRoute.of(context)?.settings.arguments as User?;
//
//     for (int index = 0; index < list.length; index++) {
//       if (username == list[index]['username']) {
//         openingResult = list[index]['result'];
//         openingUser = User(list[index]['age'], list[index]['weight'], list[index]['height'],list[index]['diet'], list[index]['days'], list[index]['minutes'], intToBool(list[index]['ocd']), intToBool(list[index]['adhd']), intToBool(list[index]['overthinking']), intToBool(list[index]['positivity']));
//
//         break;
//       }
//     }
//
//     User? userx = ModalRoute.of(context)?.settings.arguments as User?;
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Test's Details"),),
//       body: Center(
//         child: Container(
//           width: 380,
//           height: 750,
//           decoration: BoxDecoration(
//             color: Color(0xFFFAE2E2),
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(userx?.toString() ?? 'Take the health test first!', style: TextStyle(fontSize: 22),),
//               SizedBox(height: 10,),
//               Container(
//                 width: 355,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Column(children: [
//                 Text( userx?.announce() ?? '', style: TextStyle(fontSize: 20,)),
//               Text( userx?.result() ?? '', style: TextStyle(fontSize: 30, color: userx?.resultColor(), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
//               SizedBox(height: 20,),
//               Container(
//                 width: 340,
//                 child: Text(userx?.tip() ?? '', style: TextStyle(fontSize: 20),),
//               ),
//               ],),),
//
//               SizedBox(height: 30,),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFE18C8C),
//                   ),
//                   onPressed: (){Navigator.of(context).pop();},
//                   child: Icon(Icons.arrow_left, size: 50, color: Colors.white,))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
