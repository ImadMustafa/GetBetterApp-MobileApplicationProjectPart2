import 'dart:convert';

import 'package:flutter/material.dart';
import 'topic.dart';
import 'paragraph.dart';
import 'package:http/http.dart' as http;

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {

  List list = [];

  // Future ReadData()async{
  //   var url = "http://192.168.1.67/mobileproject/topic.php";
  //   var res = await http.get(Uri.parse(url));
  //
  //   if(res.statusCode == 200){
  //     var red = jsonDecode(res.body);
  //
  //     setState(() {
  //       list.addAll(red);
  //     });
  //
  //     print(list);
  //   } else {
  //     print('Failed to load data. Status code: ${res.statusCode}');
  //   }
  //
  // }
  Future<void> ReadData() async {
    var url = "http://192.168.1.67/mobileproject/topic.php";
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
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Articles", style: TextStyle(color: Color(0xFFE89191), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index){
          return Column(
            children: [
              SizedBox(height: 10,),
            Container(
            color: Color(0xFFFAE2E2),
            width: 500,
            child: Column(
              children: [
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  //Topic topicx = topics[index];
                  Topic topicx = new Topic(list[index]['name'], list[index]['image'], list[index]['paragraph']);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Paragraph(),
                        settings: RouteSettings(arguments: topicx),
                    ),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Image.asset(list[index]['image'],width: 320),
                  //child: Image.asset(topics[index].image,width: 320),
                ),
                SizedBox(height: 10,),
                //Text(topics[index].name, style: TextStyle(color: Color(0xFFA65757), fontSize: 20, fontWeight: FontWeight.bold),),
                Text(list[index]['name'], style: TextStyle(color: Color(0xFFA65757), fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
              ],
            ),
          ),
              SizedBox(height: 10,),
            ],
          );
          }
      ),
    );
  }
}
