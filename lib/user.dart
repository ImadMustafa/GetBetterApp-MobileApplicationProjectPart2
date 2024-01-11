import 'package:flutter/material.dart';

class User{
  String age = '17 or Below';
  double weight = 0;
  double height = 0;
  int diet = 0;
  int days = 0;
  int minutes = 0;
  bool ocd = false;
  bool adhd = false;
  bool overthinking = false;
  bool positivity = true;

  User(String age,double weight, double height, int diet, int days, int minutes, bool ocd, bool adhd, bool overthinking, bool positivity){
    if(weight < 0 || height < 0) {
      throw Exception('negative values are not allowed!');
    }
    this.age= age;
    this.weight = weight;
    this.height = height;
    this.diet = diet;
    this.days = days;
    this.minutes = minutes;
    this.ocd = ocd;
    this.adhd = adhd;
    this.overthinking = overthinking;
    this.positivity = positivity;
  }

  double getBmi(){
    double heightm = height * 0.01;
    double bmi = weight / (heightm * heightm);
    return double.parse(bmi.toStringAsFixed(2));
  }

  int sportMeter(){
    if(days == 0 || days == 1){
      if(minutes == 0 ) {
        return 3;
      }
    }
    else if(days == 2 || days == 3){
      if(minutes == 0 || minutes < 10) {
        return 3;
      }else if(minutes == 10 || minutes < 30){
        return 2;
      }else {
        return 1;
      }
    }
    else{
      if(minutes == 0 || minutes < 5) {
        return 3;
      }
      else if(minutes == 5 || minutes < 10){
        return 2;
      }else {
        return 1;
      }
    }
    return 0;
  }

  int getMental(){
    int x = 0;
    if(positivity == false){
      x += 2;
    }
    if(ocd){
      x += 2;
    }
    if(adhd){
      x += 3;
    }
    if (overthinking){
     x += 1;
    }
    return x;
    }

  String result(){
    if(getBmi() <= 18.4){
      if(getMental() == 0){
        return "Bad";
      }else {
        return "Too Bad";
      }
    }

    else if(getBmi() >= 30){
      if(getMental() == 0){
        return "Bad";
      }else {
        return "Too Bad";
      }
    }

    else if(getBmi() >= 25 && getBmi() < 30) {
      if (getMental() >= 0 && getMental() <= 2) {
        if (sportMeter() == 1 || sportMeter() == 2) {
          return "Ok";
        } else {
          return "Bad";
        }
      }
      else if (getMental() > 0 && getMental() <= 4) {
        if (sportMeter() == 1 || sportMeter() == 2) {
          return "bad";
        } else {
          return "Too Bad";
        }
      }
    }

    else{
      if(getMental() >= 0 && getMental() <= 2 ){

        if(sportMeter() == 1 || sportMeter() == 2){
          if(diet == 1 || diet == 2){
          return "Amazing";
        }else{
          return "Good";
        }
        }else{
          if(diet == 1 || diet == 2){
            return "Good";
          }else{
            return "Ok";
          }
        }

      }else if(getMental() >= 3 && getMental() <= 5){
        if(sportMeter() == 1 || sportMeter() == 2){
          if(diet == 1 || diet == 2){
            return "Good";
          }else{
            return "Ok";
          }
        }else{
          if(diet == 1 || diet == 2){
            return "Ok";
          }else{
            return "Bad";
          }
        }
      }else{
        if(sportMeter() == 1 || sportMeter() == 2){
          if(diet == 1 || diet == 2){
            return "Ok";
          }else{
            return "Bad";
          }
        }else{
          if(diet == 1 || diet == 2){
            return "Bad";
          }else{
            return "Too Bad";
          }
        }
      }
    }
    return "Unknown";
  }
  String tip(){
    if(result() == "Amazing"){
      return "You're doing an awesome job!";
    }else
    if(result() == "Good"){
      return "Nice work!";
    }else
    if(result() == "Ok"){
      return "Your results are not too bad, but make sure to take care of yourself more.\n\nMake sure to see the \"Sports\" and \"Articles\" pages ";
    }else
    if(result() == "Bad"){
      return "You need to change your lifestyle. Try to improve your mental and physical states and contact someone you trust or a professional to help you if needed.\n\nMake sure to see the \"Sports\" and \"Articles\" pages";
    }else{
      return "You need urgent help! Your health is in danger!\n\nGet Help from a professional as soon as you can and make sure to commit to a better routine and diet.";
    }
  }

  Color resultColor(){
    if(result() == "Too Bad"){
      return Color(0xFF440D0D);
    }
    if(result() == "Bad"){
      return Color(0xFFC52323);
    }
    if(result() == "Ok"){
      return Color(0xFFEFCB84);
    }
    if(result() == "Good"){
      return Color(0xFF97EC49);
    }
    if(result() == "Amazing"){
      return Color(0xFF94CCF3);
    }

    return Colors.white;
  }

  String bmiMeter(){
    if(getBmi() <= 18.4){
      return "Too Bad";
    }else
    if(getBmi() >= 30){
      return "Too Bad";
    }else
    if(getBmi() >= 25 && getBmi() < 30){
      return "Bad";
    }else{
      return "Good";
    }
  }

  String mentalCondition(){
    String mental = "Uknown";
    if(getMental() == 0)
      mental = "Good";
    if(getMental() == 1 || getMental() == 2 || getMental() == 3)
      mental = "Ok";
    if(getMental() == 4 || getMental() == 5 || getMental() == 6)
      mental = "Bad";
    if(getMental() == 7 || getMental() == 8)
      mental = "Too Bad";
    return mental;
  }

  String sportCondition(){
    String sport = "Uknown";
    if(sportMeter() == 1)
      sport = "Good";
    if(sportMeter() == 2)
      sport = "Ok";
    if(sportMeter() == 3)
      sport = "Bad";
    return sport;
  }

  String dietCondition(){
    String eat = "Unknown";
    if(diet == 1 || diet == 2)
      eat = "Good";
    if(diet == 3)
      eat = "Ok";
    if(diet == 4)
      eat = "Bad";
    return eat;
  }
  String announce(){
    return "You are: ";
  }

  @override
  String toString() {
    // TODO: implement toString
    return """
    Age: $age
    BMI: ${getBmi()} (${bmiMeter()})
    Diet: ${dietCondition()}
    Sports: ${sportCondition()}
    Mentality: ${mentalCondition()}
    """;
  }
}