-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2018 at 02:33 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comsci`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisors`
--

CREATE TABLE `advisors` (
  `id` int(11) NOT NULL COMMENT 'idอาจารย์',
  `name` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'ชื่อ',
  `gender` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'เพศ',
  `age` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'อายุ',
  `wgiht` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'น้ำหนัก',
  `height` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'สูง',
  `majerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `advisors`
--

INSERT INTO `advisors` (`id`, `name`, `gender`, `age`, `wgiht`, `height`, `majerid`) VALUES
(1, 'ปริญญา สอนสำแดง', 'ชาย', '22', '85', '170', 2),
(2, 'นิตยา ปุตโคต', 'หญิง', '21', '90', '165', 1);

-- --------------------------------------------------------

--
-- Table structure for table `majer`
--

CREATE TABLE `majer` (
  `id` int(11) NOT NULL COMMENT 'สาขาวิชา',
  `name` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'ชื่อ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `majer`
--

INSERT INTO `majer` (`id`, `name`) VALUES
(1, 'สถิติ'),
(2, 'คอมซายน์');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL COMMENT 'idนักศึกษา',
  `name` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'ชื่อ',
  `gender` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'เพศ',
  `age` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'อายุ',
  `wgiht` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'น้ำหนัก',
  `height` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'สูง',
  `gpa` varchar(255) COLLATE utf8_thai_520_w2 NOT NULL COMMENT 'เกรด',
  `advisorsid` int(11) NOT NULL,
  `majerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_thai_520_w2;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `gender`, `age`, `wgiht`, `height`, `gpa`, `advisorsid`, `majerid`) VALUES
(1, 'ปริญญา สีชัย', 'ชาย', '18', '45', '170', '4.00', 1, 2),
(2, 'นิตยา สีวิชัย', 'หญิง', '18', '44', '158', '3.50', 2, 1),
(3, 'พนิดา ชัยมงคล', 'หญิง', '22', '33', '135', '2.50', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisors`
--
ALTER TABLE `advisors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `majerid` (`majerid`);

--
-- Indexes for table `majer`
--
ALTER TABLE `majer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advisorsid` (`advisorsid`),
  ADD KEY `majerid` (`majerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advisors`
--
ALTER TABLE `advisors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'idอาจารย์', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `majer`
--
ALTER TABLE `majer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'สาขาวิชา', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'idนักศึกษา', AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisors`
--
ALTER TABLE `advisors`
  ADD CONSTRAINT `advisors_ibfk_1` FOREIGN KEY (`majerid`) REFERENCES `majer` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`advisorsid`) REFERENCES `advisors` (`id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`majerid`) REFERENCES `majer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
