-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 06:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universityy`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_code` varchar(5) NOT NULL,
  `Course_name` varchar(50) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Offering_dept` varchar(3) DEFAULT NULL,
  `Offering_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_code`, `Course_name`, `Credits`, `Offering_dept`, `Offering_year`) VALUES
('AI', 'Artificial Intelligence', 4, 'CSE', 2023),
('BD', 'Big Data', 4, 'CSE', 2023),
('CA', 'Computer Architecture', 2, 'ECE', 2023),
('CHEM', 'Chemistry', 4, 'ME', 2023),
('EH', 'Ethical Hacking', 4, 'CSE', 2023),
('IT', 'Information Technology', 2, 'ECE', 2023),
('MS', 'Material Science', 4, 'ME', 2023),
('NN', 'Neural Network', 4, 'CSE', 2023),
('TH', 'Thermodynamics', 4, 'ME', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `Dept_code` varchar(3) NOT NULL,
  `Dept_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Dept_code`, `Dept_name`) VALUES
('CSE', 'Computer Science and Engineering'),
('ECE', 'Electronics and Communication Engineering'),
('ME', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `RN` varchar(5) NOT NULL,
  `Course_code` varchar(5) NOT NULL,
  `Grade` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`RN`, `Course_code`, `Grade`) VALUES
('CS01', 'AI', 'B'),
('CS01', 'BD', 'B'),
('CS01', 'IT', 'C'),
('CS05', 'AI', 'B'),
('CS05', 'EH', 'B'),
('CS05', 'NN', 'A'),
('EC03', 'CA', 'B'),
('EC03', 'IT', 'A'),
('EC03', 'NN', 'A'),
('ME01', 'MS', 'D'),
('ME01', 'NN', 'A'),
('ME01', 'TH', 'B'),
('ME02', 'CHEM', 'A'),
('ME02', 'MS', 'B'),
('ME02', 'TH', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `RN` varchar(5) NOT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Dept_code` varchar(3) DEFAULT NULL,
  `Program` varchar(10) NOT NULL,
  `Joining_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`RN`, `Student_name`, `Dept_code`, `Program`, `Joining_year`) VALUES
('CS01', 'Shivani', 'CSE', 'BTech', 2023),
('CS05', 'Utkarsh', 'CSE', 'MTech', 2023),
('EC03', 'Janvi', 'ECE', 'BTech', 2023),
('ME01', 'Gayatri', 'ME', 'BTech', 2023),
('ME02', 'Chetan', 'ME', 'BTech', 2023);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_code`),
  ADD KEY `Offering_dept` (`Offering_dept`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Dept_code`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`RN`,`Course_code`),
  ADD KEY `Course_code` (`Course_code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`RN`),
  ADD KEY `Dept_code` (`Dept_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Offering_dept`) REFERENCES `departments` (`Dept_code`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`RN`) REFERENCES `students` (`RN`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Course_code`) REFERENCES `courses` (`Course_code`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`Dept_code`) REFERENCES `departments` (`Dept_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
