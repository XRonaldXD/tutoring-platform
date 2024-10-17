-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2024 年 10 月 16 日 04:02
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `fyp4`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Course`
--

CREATE TABLE `Course` (
  `CourseID` int(11) NOT NULL,
  `TeacherID` int(11) DEFAULT NULL,
  `Subject` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Duration` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Course`
--

INSERT INTO `Course` (`CourseID`, `TeacherID`, `Subject`, `Description`, `Date`, `Time`, `Duration`, `Price`) VALUES
(1, 1, 'Algebra 101', 'Introductory course on Algebra.', '2024-10-20', '10:00:00', 90, 50.00),
(2, 2, 'Physics Fundamentals', 'Basic concepts in Physics.', '2024-10-21', '14:00:00', 120, 60.00);

-- --------------------------------------------------------

--
-- 資料表結構 `Locations`
--

CREATE TABLE `Locations` (
  `LocationsID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Locations`
--

INSERT INTO `Locations` (`LocationsID`, `UserID`, `Address`) VALUES
(1, 1, '123 Maple St, Springfield, IL'),
(2, 2, '456 Oak St, Springfield, IL'),
(3, 3, '789 Pine St, Springfield, IL');

-- --------------------------------------------------------

--
-- 資料表結構 `Matches`
--

CREATE TABLE `Matches` (
  `MatchesID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `MatchesDateTime` datetime DEFAULT current_timestamp(),
  `Status` enum('Active','Completed','Dropped') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Matches`
--

INSERT INTO `Matches` (`MatchesID`, `CourseID`, `MatchesDateTime`, `Status`) VALUES
(1, 1, '2024-10-15 12:00:00', 'Active'),
(2, 2, '2024-10-16 13:00:00', 'Completed');

-- --------------------------------------------------------

--
-- 資料表結構 `MatchingCriteria`
--

CREATE TABLE `MatchingCriteria` (
  `CriteriaID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `MatchingCriteria`
--

INSERT INTO `MatchingCriteria` (`CriteriaID`, `UserID`, `Subject`, `Price`, `Date`, `Time`) VALUES
(1, 1, 'Algebra', 45.00, '2024-10-20', '10:00:00'),
(2, 2, 'Physics', 55.00, '2024-10-21', '14:00:00'),
(3, 3, 'Science', 50.00, '2024-10-22', '16:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `Record`
--

CREATE TABLE `Record` (
  `RecordID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `RecordDateTime` datetime DEFAULT current_timestamp(),
  `Status` enum('Active','Completed','Dropped') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Record`
--

INSERT INTO `Record` (`RecordID`, `UserID`, `CourseID`, `RecordDateTime`, `Status`) VALUES
(1, 1, 1, '2024-10-15 12:00:00', 'Active'),
(2, 2, 2, '2024-10-16 13:00:00', 'Completed');

-- --------------------------------------------------------

--
-- 資料表結構 `Review`
--

CREATE TABLE `Review` (
  `ReviewID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL CHECK (`Rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Review`
--

INSERT INTO `Review` (`ReviewID`, `UserID`, `CourseID`, `Comment`, `Rating`) VALUES
(1, 1, 1, 'Great course! Very helpful.', 5),
(2, 2, 2, 'The teacher was knowledgeable.', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `Teachers`
--

CREATE TABLE `Teachers` (
  `TeacherID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Expertise` varchar(100) NOT NULL,
  `Rate` decimal(5,2) NOT NULL,
  `ReviewID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Teachers`
--

INSERT INTO `Teachers` (`TeacherID`, `UserID`, `Expertise`, `Rate`, `ReviewID`) VALUES
(1, 1, 'Mathematics', 30.00, NULL),
(2, 2, 'Physics', 40.00, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `UserPreferences`
--

CREATE TABLE `UserPreferences` (
  `UserPreferenceID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PreferenceKey` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `UserPreferences`
--

INSERT INTO `UserPreferences` (`UserPreferenceID`, `UserID`, `PreferenceKey`) VALUES
(1, 1, 'Notification: Email'),
(2, 1, 'Preferred Subject: Math'),
(3, 2, 'Notification: SMS'),
(4, 3, 'Preferred Subject: Science');

-- --------------------------------------------------------

--
-- 資料表結構 `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `BirthOfDate` date NOT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `Biography` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `Users`
--

INSERT INTO `Users` (`UserID`, `Name`, `Email`, `Password`, `Gender`, `BirthOfDate`, `ProfilePicture`, `Biography`) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'password123', 'Female', '1995-06-15', 'alice.jpg', 'Passionate tutor with 5 years of experience.'),
(2, 'Bob Smith', 'bob@example.com', 'password456', 'Male', '1988-03-22', 'bob.jpg', 'Expert in Mathematics and Physics.'),
(3, 'Charlie Brown', 'charlie@example.com', 'password789', 'Other', '1990-12-01', 'charlie.jpg', 'Lifelong learner and educator.');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- 資料表索引 `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`LocationsID`),
  ADD KEY `UserID` (`UserID`);

--
-- 資料表索引 `Matches`
--
ALTER TABLE `Matches`
  ADD PRIMARY KEY (`MatchesID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- 資料表索引 `MatchingCriteria`
--
ALTER TABLE `MatchingCriteria`
  ADD PRIMARY KEY (`CriteriaID`),
  ADD KEY `UserID` (`UserID`);

--
-- 資料表索引 `Record`
--
ALTER TABLE `Record`
  ADD PRIMARY KEY (`RecordID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- 資料表索引 `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- 資料表索引 `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`TeacherID`),
  ADD KEY `UserID` (`UserID`);

--
-- 資料表索引 `UserPreferences`
--
ALTER TABLE `UserPreferences`
  ADD PRIMARY KEY (`UserPreferenceID`),
  ADD KEY `UserID` (`UserID`);

--
-- 資料表索引 `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Course`
--
ALTER TABLE `Course`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Locations`
--
ALTER TABLE `Locations`
  MODIFY `LocationsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Matches`
--
ALTER TABLE `Matches`
  MODIFY `MatchesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `MatchingCriteria`
--
ALTER TABLE `MatchingCriteria`
  MODIFY `CriteriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Record`
--
ALTER TABLE `Record`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Review`
--
ALTER TABLE `Review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `UserPreferences`
--
ALTER TABLE `UserPreferences`
  MODIFY `UserPreferenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `Locations`
--
ALTER TABLE `Locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `Matches`
--
ALTER TABLE `Matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `MatchingCriteria`
--
ALTER TABLE `MatchingCriteria`
  ADD CONSTRAINT `matchingcriteria_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `Record`
--
ALTER TABLE `Record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `Teachers`
--
ALTER TABLE `Teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;

--
-- 資料表的限制式 `UserPreferences`
--
ALTER TABLE `UserPreferences`
  ADD CONSTRAINT `userpreferences_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
