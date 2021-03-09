-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 09, 2021 at 03:12 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homechef`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `UserID` int(10) NOT NULL,
  `OverallCustomerRating` int(5) NOT NULL,
  `CustomerRating` int(5) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
CREATE TABLE IF NOT EXISTS `follows` (
  `FollowerID` int(10) NOT NULL,
  `FolloweeID` int(10) NOT NULL,
  PRIMARY KEY (`FollowerID`),
  KEY `FolloweeID` (`FolloweeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `UserID` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Phone#` varchar(15) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`UserID`, `email`, `UserName`, `Phone#`, `Location`, `FirstName`, `LastName`) VALUES
(98765, 'user1@gmail.com', 'misteruser1', '6041231234', '8888 University Drive', 'User', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
CREATE TABLE IF NOT EXISTS `seller` (
  `UserID` int(10) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userallergies`
--

DROP TABLE IF EXISTS `userallergies`;
CREATE TABLE IF NOT EXISTS `userallergies` (
  `UserID` int(10) NOT NULL,
  `Allergies` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `profile` (`UserID`);

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`FollowerID`) REFERENCES `profile` (`UserID`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`FolloweeID`) REFERENCES `profile` (`UserID`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `profile` (`UserID`);

--
-- Constraints for table `userallergies`
--
ALTER TABLE `userallergies`
  ADD CONSTRAINT `userallergies_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `profile` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
