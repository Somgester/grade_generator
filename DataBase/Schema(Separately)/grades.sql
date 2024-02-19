-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 06:12 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`RN`,`Course_code`),
  ADD KEY `Course_code` (`Course_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`RN`) REFERENCES `students` (`RN`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Course_code`) REFERENCES `courses` (`Course_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
