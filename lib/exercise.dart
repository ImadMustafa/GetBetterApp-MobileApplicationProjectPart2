import 'package:flutter/material.dart';

class Exercise{
  String name;
  String instruction;
  String image;
  String imageex;

  Exercise(this.name, this.instruction, this.image, this.imageex);

  @override
  String toString() {
    // TODO: implement toString
    return """
    $name Exercise
    
    Instructions:
    $instruction
    """;
  }
}

List<Exercise> nogym = [
  Exercise('Walking/Jogging','A simple yet effective cardio exercise. Lift your knees higher for a more intense workout.','images/nogym/ng1.jpg', 'images/nogym/ngex1.jpg'),
  Exercise('Push-Ups','Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body by bending your elbows until your chest nearly touches the ground. Push back up to the starting position.','images/nogym/ng2.jpg', 'images/nogym/ngex2.jpg'),
  Exercise('Squats', 'Stand with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back. Keep your back straight, chest up, and lower down as far as you can. Push through your heels to return to the starting position.', 'images/nogym/ng3.jpg', 'images/nogym/ngex3.jpg'),
  Exercise('Plank','Start in a forearm plank position with your body in a straight line from head to heels. Hold the position, engaging your core and keeping your back straight. Aim to hold for at least 30 seconds to a minute.','images/nogym/ng4.jpg', 'images/nogym/ngex4.jpg'),
  Exercise('Lunges','Stand with your feet together. Take a step forward with one foot and lower your body until both knees are bent at a 90-degree angle. Push off the front foot to return to the starting position. Repeat on the other leg.','images/nogym/ng5.jpg', 'images/nogym/ngex5.jpg'),
  Exercise('Jumping Jacks:','Stand with your feet together and arms at your sides. Jump while spreading your legs and raising your arms overhead. Jump back to the starting position and repeat.','images/nogym/ng6.jpg', 'images/nogym/ngex6.jpg'),
  Exercise('Burpees','Start in a standing position. Drop into a squat position and place your hands on the ground. Jump your feet back into a plank position. Perform a push-up, then jump your feet back to the squat position. Explosively jump up from the squat position.','images/nogym/ng7.jpg', 'images/nogym/ngex7.jpg'),
  Exercise('Mountain Climbers','Start in a plank position. Bring one knee toward your chest and then switch legs quickly, as if you\'re "climbing."','images/nogym/ng8.jpg', 'images/nogym/ngex8.jpg'),
  Exercise('Bicycle Crunches','Lie on your back with your hands behind your head. Lift your legs off the ground and bring your knees toward your chest. Rotate your torso and bring your right elbow toward your left knee while straightening the right leg. Repeat on the other side.','images/nogym/ng10.jpg', 'images/nogym/ngex10.jpg'),
];

List<Exercise> gym = [
  Exercise('Barbell Squats', 'Place a barbell on your upper back and shoulders. Stand with feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back. Return to the starting position.', 'images/gym/g1.jpg', 'images/gym/gex1.jpg'),
  Exercise('Bench Press', 'Lie on a flat bench with a barbell above your chest. Lower the barbell to your chest and then press it back up to the starting position.', 'images/gym/g2.jpg', 'images/gym/gex2.jpg'),
  Exercise('Deadlifts', 'Stand in front of a loaded barbell. Bend at your hips and knees, keeping your back straight, to grip the bar. Lift the bar by straightening your hips and knees. Lower it back to the ground with control.', 'images/gym/g3.jpg', 'images/gym/gex3.jpg'),
  Exercise('Lat Pulldowns', 'Sit at a lat pulldown machine. Grip the bar with hands wider than shoulder-width. Pull the bar down to your chest, squeezing your shoulder blades together. Return to the starting position.', 'images/gym/g4.jpg', 'images/gym/gex4.jpg'),
  Exercise('Leg Press', 'Sit in a leg press machine with your back against the pad. Push the platform away by extending your hips and knees. Lower it back down with control.', 'images/gym/g5.jpg', 'images/gym/gex5.jpg'),
  Exercise('Dumbbell Rows', 'Hold a dumbbell in each hand. Bend at your hips and knees, keeping your back straight. Pull the dumbbells to your hips, squeezing your shoulder blades together. Lower them back down.', 'images/gym/g6.jpg', 'images/gym/gex6.jpg'),
  Exercise('Chest Flyes', 'Lie on a flat bench with a dumbbell in each hand. Extend your arms above your chest, palms facing each other. Lower the dumbbells out to the sides, then bring them back to the starting position.', 'images/gym/g7.jpg', 'images/gym/gex7.jpg'),
  Exercise('Leg Curls', 'Lie face down on a leg curl machine. Curl your legs up towards your buttocks by bending at the knee. Lower your legs back down with control.', 'images/gym/g8.jpg', 'images/gym/gex8.jpg'),
  Exercise('Shoulder Press', 'Sit or stand with a dumbbell in each hand. Lift the dumbbells from shoulder height to overhead. Lower them back to shoulder height with control.', 'images/gym/g9.jpg', 'images/gym/gex9.jpg'),
  Exercise('Cable Crossover', 'Stand between two cable machines. Grab a handle in each hand and pull your arms together in front of you, crossing over at chest height. Return to the starting position.', 'images/gym/g10.jpg', 'images/gym/gex10.jpg'),
];