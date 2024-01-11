-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2024 at 07:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betterme`
--

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `name` varchar(100) NOT NULL,
  `instruction` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `imageex` varchar(100) NOT NULL,
  `gym` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`name`, `instruction`, `image`, `imageex`, `gym`) VALUES
('Walking/Jogging', 'A simple yet effective cardio exercise. Lift your knees higher for a more intense workout.', 'images/nogym/ng1.jpg', 'images/nogym/ngex1.jpg', 0),
('Push-Ups', 'Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body by bending your elbows until your chest nearly touches the ground. Push back up to the starting position.', 'images/nogym/ng2.jpg', 'images/nogym/ngex2.jpg', 0),
('Squats', 'Stand with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back. Keep your back straight, chest up, and lower down as far as you can. Push through your heels to return to the starting position.', 'images/nogym/ng3.jpg', 'images/nogym/ngex3.jpg', 0),
('Plank', 'Start in a forearm plank position with your body in a straight line from head to heels. Hold the position, engaging your core and keeping your back straight. Aim to hold for at least 30 seconds to a minute.', 'images/nogym/ng4.jpg', 'images/nogym/ngex4.jpg', 0),
('Lunges', 'Stand with your feet together. Take a step forward with one foot and lower your body until both knees are bent at a 90-degree angle. Push off the front foot to return to the starting position. Repeat on the other leg.', 'images/nogym/ng5.jpg', 'images/nogym/ngex5.jpg', 0),
('Jumping Jacks', 'Stand with your feet together and arms at your sides. Jump while spreading your legs and raising your arms overhead. Jump back to the starting position and repeat.', 'images/nogym/ng6.jpg', 'images/nogym/ngex6.jpg', 0),
('Burpees', 'Start in a standing position. Drop into a squat position and place your hands on the ground. Jump your feet back into a plank position. Perform a push-up, then jump your feet back to the squat position. Explosively jump up from the squat position.', 'images/nogym/ng7.jpg', 'images/nogym/ngex7.jpg', 0),
('Mountain Climbers', 'Start in a plank position. Bring one knee toward your chest and then switch legs quickly, as if you\\\'re \"climbing.', 'images/nogym/ng8.jpg', 'images/nogym/ngex8.jpg', 0),
('Bicycle Crunches', 'Lie on your back with your hands behind your head. Lift your legs off the ground and bring your knees toward your chest. Rotate your torso and bring your right elbow toward your left knee while straightening the right leg. Repeat on the other side.', 'images/nogym/ng10.jpg', 'images/nogym/ngex10.jpg', 0),
('Barbell Squats', 'Place a barbell on your upper back and shoulders. Stand with feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back. Return to the starting position.', 'images/gym/g1.jpg', 'images/gym/gex1.jpg', 1),
('Bench Press', 'Lie on a flat bench with a barbell above your chest. Lower the barbell to your chest and then press it back up to the starting position.', 'images/gym/g2.jpg', 'images/gym/gex2.jpg', 1),
('Deadlifts', 'Stand in front of a loaded barbell. Bend at your hips and knees, keeping your back straight, to grip the bar. Lift the bar by straightening your hips and knees. Lower it back to the ground with control.', 'images/gym/g3.jpg', 'images/gym/gex3.jpg', 1),
('Lat Pulldowns', 'Sit at a lat pulldown machine. Grip the bar with hands wider than shoulder-width. Pull the bar down to your chest, squeezing your shoulder blades together. Return to the starting position.', 'images/gym/g4.jpg', 'images/gym/gex4.jpg', 1),
('Leg Press', 'Sit in a leg press machine with your back against the pad. Push the platform away by extending your hips and knees. Lower it back down with control.', 'images/gym/g5.jpg', 'images/gym/gex5.jpg', 1),
('Dumbbell Rows', 'Hold a dumbbell in each hand. Bend at your hips and knees, keeping your back straight. Pull the dumbbells to your hips, squeezing your shoulder blades together. Lower them back down.', 'images/gym/g6.jpg', 'images/gym/gex6.jpg', 1),
('Chest Flyes', 'Lie on a flat bench with a dumbbell in each hand. Extend your arms above your chest, palms facing each other. Lower the dumbbells out to the sides, then bring them back to the starting position.', 'images/gym/g7.jpg', 'images/gym/gex7.jpg', 1),
('Leg Curls', 'Lie face down on a leg curl machine. Curl your legs up towards your buttocks by bending at the knee. Lower your legs back down with control.', 'images/gym/g8.jpg', 'images/gym/gex8.jpg', 1),
('Shoulder Press', 'Sit or stand with a dumbbell in each hand. Lift the dumbbells from shoulder height to overhead. Lower them back to shoulder height with control.', 'images/gym/g9.jpg', 'images/gym/gex9.jpg', 1),
('Cable Crossover', 'Stand between two cable machines. Grab a handle in each hand and pull your arms together in front of you, crossing over at chest height. Return to the starting position.', 'images/gym/g10.jpg', 'images/gym/gex10.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `paragraph` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`name`, `image`, `paragraph`) VALUES
('Positive Thinking', 'images/topic/t1.png', 'Cultivating a positive mindset and embracing optimism can have profound effects on mental health. Positive thinking can help individuals navigate challenges with resilience, reduce stress levels, and foster a more optimistic outlook on life. By focusing on the positive aspects of situations and adopting a growth mindset, individuals can build a foundation for increased motivation, creativity, and overall well-being.'),
('Regular Exercise', 'images/topic/t2.png', 'Regular exercise offers a myriad of benefits for both physical and mental health. Engaging in consistent physical activity helps improve cardiovascular health, maintain a healthy weight, and boost overall energy levels. Moreover, exercise stimulates the release of endorphins, the body\\\'s natural mood enhancers, leading to reduced stress and anxiety. Incorporating exercise into one\\\'s routine not only promotes physical well-being but also contributes to a positive and resilient mindset.'),
('Healthy Eating Habits', 'images/topic/t3.png', 'Adopting healthy eating habits is fundamental to maintaining overall well-being. A balanced diet provides essential nutrients that support bodily functions, enhance energy levels, and contribute to long-term health. By making mindful food choices and paying attention to portion sizes, individuals can not only manage their weight but also reduce the risk of various health conditions. Cultivating healthy eating habits is a key component of a holistic approach to self-care.'),
('Stress Management', 'images/topic/t4.png', 'Stress is a natural part of life, but effective stress management techniques can mitigate its negative impact. Practices such as mindfulness, deep breathing, and time management empower individuals to cope with stressors more effectively. By incorporating these techniques into their daily lives, individuals can reduce feelings of overwhelm, enhance focus, and cultivate a more balanced and positive mental state.'),
('Prioritizing Mental Health', 'images/topic/t5.png', 'Prioritizing mental health through self-care activities is essential for overall well-being. Taking time for self-care, whether through relaxation, hobbies, or social connections, allows individuals to recharge mentally and emotionally. By establishing healthy boundaries and incorporating self-care into their routine, individuals can better manage stress, prevent burnout, and maintain a positive and resilient mindset.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `result` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
