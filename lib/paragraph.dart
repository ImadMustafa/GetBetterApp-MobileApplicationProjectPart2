import 'package:flutter/material.dart';
import 'topic.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({super.key});

  @override
  Widget build(BuildContext context) {

    Topic topicx = ModalRoute.of(context)!.settings.arguments as Topic;

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(topicx.name, style: TextStyle(color: Color(0xFFE89191), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)),backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
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
              SizedBox(width: 340,
              child: Text(topicx.paragraph, style: TextStyle(color: Color(
                  0xFF9A4E4E), fontSize: 19,),),),
              SizedBox(height: 50,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE18C8C),
                  ),
                  onPressed: (){Navigator.of(context).pop();},
                  child: Icon(Icons.arrow_left, size: 50, color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
