-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 06:13 PM
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
-- Database: `22bcs027`
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
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Offering_dept`) REFERENCES `departments` (`Dept_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
