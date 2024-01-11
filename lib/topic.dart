import 'package:flutter/material.dart';

class Topic{
  String name;
  String image;
  String paragraph;

  Topic(this.name, this.image, this.paragraph);

  @override
  String toString() {
    // TODO: implement toString
    return paragraph;
  }
}

List<Topic> topics = [
  Topic('Positive Thinking','images/topic/t1.png',
      'Cultivating a positive mindset and embracing optimism can have profound effects on mental health. Positive thinking can help individuals navigate challenges with resilience, reduce stress levels, and foster a more optimistic outlook on life. By focusing on the positive aspects of situations and adopting a growth mindset, individuals can build a foundation for increased motivation, creativity, and overall well-being.'),
  Topic('Regular Exercise','images/topic/t2.png',
      'Regular exercise offers a myriad of benefits for both physical and mental health. Engaging in consistent physical activity helps improve cardiovascular health, maintain a healthy weight, and boost overall energy levels. Moreover, exercise stimulates the release of endorphins, the body\'s natural mood enhancers, leading to reduced stress and anxiety. Incorporating exercise into one\'s routine not only promotes physical well-being but also contributes to a positive and resilient mindset.'),
  Topic('Healthy Eating Habits','images/topic/t3.png',
      'Adopting healthy eating habits is fundamental to maintaining overall well-being. A balanced diet provides essential nutrients that support bodily functions, enhance energy levels, and contribute to long-term health. By making mindful food choices and paying attention to portion sizes, individuals can not only manage their weight but also reduce the risk of various health conditions. Cultivating healthy eating habits is a key component of a holistic approach to self-care.'),
  Topic('Stress Management','images/topic/t4.png',
      'Stress is a natural part of life, but effective stress management techniques can mitigate its negative impact. Practices such as mindfulness, deep breathing, and time management empower individuals to cope with stressors more effectively. By incorporating these techniques into their daily lives, individuals can reduce feelings of overwhelm, enhance focus, and cultivate a more balanced and positive mental state.'),
  Topic('Prioritizing Mental Health','images/topic/t5.png',
      'Prioritizing mental health through self-care activities is essential for overall well-being. Taking time for self-care, whether through relaxation, hobbies, or social connections, allows individuals to recharge mentally and emotionally. By establishing healthy boundaries and incorporating self-care into their routine, individuals can better manage stress, prevent burnout, and maintain a positive and resilient mindset.'),

];