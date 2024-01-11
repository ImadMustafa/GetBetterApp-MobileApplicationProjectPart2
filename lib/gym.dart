import 'package:flutter/material.dart';
import 'exercise.dart';
import 'instruction.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Gym extends StatefulWidget {
  const Gym({super.key});

  @override
  State<Gym> createState() => _GymState();
}

class _GymState extends State<Gym> {

  List list = [];

  Future<void> ReadData() async {
    var url = "http://10.0.2.2/mobileproject/gym.php";
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
      appBar: AppBar(title: Center(child: Text("Gym", style: TextStyle(color: Color(0xFFE89191), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),backgroundColor: Colors.white,),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            return Column(
              children: [
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){

                  //Exercise gymx = gym[index];
                  Exercise gymx = new Exercise(list[index]['name'], list[index]['instruction'], list[index]['image'], list[index]['imageex']);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Instruction(),
                      settings: RouteSettings(arguments: gymx),
                    ),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Container(
                    color: Color(0xFFFAE2E2),
                    width: 500,
                    child: Row(
                      children: [
                        SizedBox(height: 10,),
                        //Image.asset(gym[index].image,width: 180,),
                        Image.asset(list[index]['image'],width: 180,),
                        SizedBox(width: 20,),
                        //Text(gym[index].name, style: TextStyle(color: Color(0xFFA65757), fontSize: 17, fontWeight: FontWeight.bold),),
                        Text(list[index]['name'], style: TextStyle(color: Color(0xFFA65757), fontSize: 17, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),),
                SizedBox(height: 10,),
              ],
            );
          }),
    );
  }
}
