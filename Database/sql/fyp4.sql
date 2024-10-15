-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 15, 2024 at 07:58 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp4`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `TeacherID` int DEFAULT NULL,
  `Subject` varchar(100) NOT NULL,
  `Description` text,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Duration` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `TeacherID` (`TeacherID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `TeacherID`, `Subject`, `Description`, `Date`, `Time`, `Duration`, `Price`) VALUES
(1, 1, 'Algebra 101', 'Introductory course on Algebra.', '2024-10-20', '10:00:00', 90, 50.00),
(2, 2, 'Physics Fundamentals', 'Basic concepts in Physics.', '2024-10-21', '14:00:00', 120, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `LocationsID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Address` text,
  PRIMARY KEY (`LocationsID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`LocationsID`, `UserID`, `Address`) VALUES
(1, 1, '123 Maple St, Springfield, IL'),
(2, 2, '456 Oak St, Springfield, IL'),
(3, 3, '789 Pine St, Springfield, IL');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `MatchesID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int DEFAULT NULL,
  `MatchesDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Active','Completed','Dropped') DEFAULT NULL,
  PRIMARY KEY (`MatchesID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`MatchesID`, `CourseID`, `MatchesDateTime`, `Status`) VALUES
(1, 1, '2024-10-15 12:00:00', 'Active'),
(2, 2, '2024-10-16 13:00:00', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `matchingcriteria`
--

DROP TABLE IF EXISTS `matchingcriteria`;
CREATE TABLE IF NOT EXISTS `matchingcriteria` (
  `CriteriaID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  PRIMARY KEY (`CriteriaID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matchingcriteria`
--

INSERT INTO `matchingcriteria` (`CriteriaID`, `UserID`, `Subject`, `Price`, `Date`, `Time`) VALUES
(1, 1, 'Algebra', 45.00, '2024-10-20', '10:00:00'),
(2, 2, 'Physics', 55.00, '2024-10-21', '14:00:00'),
(3, 3, 'Science', 50.00, '2024-10-22', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
CREATE TABLE IF NOT EXISTS `record` (
  `RecordID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `RecordDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Active','Completed','Dropped') DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `UserID` (`UserID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`RecordID`, `UserID`, `CourseID`, `RecordDateTime`, `Status`) VALUES
(1, 1, 1, '2024-10-15 12:00:00', 'Active'),
(2, 2, 2, '2024-10-16 13:00:00', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `Comment` text,
  `Rating` int DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `CourseID` (`CourseID`)
) ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `UserID`, `CourseID`, `Comment`, `Rating`) VALUES
(1, 1, 1, 'Great course! Very helpful.', 5),
(2, 2, 2, 'The teacher was knowledgeable.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Expertise` varchar(100) NOT NULL,
  `Rate` decimal(5,2) NOT NULL,
  `ReviewID` int DEFAULT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `UserID`, `Expertise`, `Rate`, `ReviewID`) VALUES
(1, 1, 'Mathematics', 30.00, NULL),
(2, 2, 'Physics', 40.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE IF NOT EXISTS `userpreferences` (
  `UserPreferenceID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `PreferenceKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserPreferenceID`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`UserPreferenceID`, `UserID`, `PreferenceKey`) VALUES
(1, 1, 'Notification: Email'),
(2, 1, 'Preferred Subject: Math'),
(3, 2, 'Notification: SMS'),
(4, 3, 'Preferred Subject: Science');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `BirthOfDate` date NOT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `Biography` text,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `Email`, `Password`, `Gender`, `BirthOfDate`, `ProfilePicture`, `Biography`) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'password123', 'Female', '1995-06-15', 'alice.jpg', 'Passionate tutor with 5 years of experience.'),
(2, 'Bob Smith', 'bob@example.com', 'password456', 'Male', '1988-03-22', 'bob.jpg', 'Expert in Mathematics and Physics.'),
(3, 'Charlie Brown', 'charlie@example.com', 'password789', 'Other', '1990-12-01', 'charlie.jpg', 'Lifelong learner and educator.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
