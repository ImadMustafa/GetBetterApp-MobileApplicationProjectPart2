import 'package:flutter/material.dart';
import 'nogym.dart';
import 'gym.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Sports", style: TextStyle(color: Color(0xFFE89191), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => NoGym()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Container(
                color: Color(0xFFE89191),
                child: Column(
                  children: [
                    Image.asset('images/nogym/nogym.jpg', width: 320),
                    SizedBox(height: 5,),
                    Text("CALISTHENICS", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
                    Text("No gym no problem", style: TextStyle(fontSize: 20, color: Colors.white),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Gym()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Container(
                color: Color(0xFFE89191),
                child: Column(
                  children: [
                    Image.asset('images/gym/gym.jpg', width: 320),
                    SizedBox(height: 5,),
                    Text("GYM", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
                    Text("Bodybuilding's best friend", style: TextStyle(fontSize: 20, color: Colors.white),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
