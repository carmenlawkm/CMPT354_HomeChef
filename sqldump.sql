-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2021 at 06:50 AM
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
  `UserID` int(11) NOT NULL,
  `OverallCustomerRating` int(11) DEFAULT NULL,
  `numberOfRatings` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`UserID`, `OverallCustomerRating`, `numberOfRatings`) VALUES
(1, 10, 1),
(2, 5, 5),
(3, 5, 10),
(6, 5, 1),
(7, 5, 5),
(14, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
CREATE TABLE IF NOT EXISTS `follows` (
  `FollowerID` int(10) NOT NULL,
  `FolloweeID` int(10) NOT NULL,
  PRIMARY KEY (`FollowerID`,`FolloweeID`) USING BTREE,
  KEY `FolloweeID` (`FolloweeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`FollowerID`, `FolloweeID`) VALUES
(1, 2),
(3, 2),
(15, 2),
(6, 14),
(6, 15);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `FoodID` int(11) NOT NULL AUTO_INCREMENT,
  `PUserID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `pricePerUnit` int(11) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Description` text,
  `Instructions` text,
  PRIMARY KEY (`FoodID`) USING BTREE,
  KEY `PUserID` (`PUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `PUserID`, `Name`, `pricePerUnit`, `Availability`, `Description`, `Instructions`) VALUES
(10000, 1, 'caramel cake', NULL, 1, 'caramel cake very good yes', 'eat it'),
(10001, 1, 'pork floss rice', NULL, 1, 'rice with pork floss', 'eat'),
(10002, 2, 'pork chops', NULL, 1, 'oopooo', 'yhyhry'),
(10003, 5, 'Pizza', 7, 1, 'italian pizza', 'eat'),
(10004, 5, 'chocolate', 12, 1, 'tasty', 'eat it');

-- --------------------------------------------------------

--
-- Table structure for table `foodingredients`
--

DROP TABLE IF EXISTS `foodingredients`;
CREATE TABLE IF NOT EXISTS `foodingredients` (
  `FoodID` int(11) NOT NULL,
  `Ingredients` text NOT NULL,
  PRIMARY KEY (`FoodID`,`Ingredients`(50)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodingredients`
--

INSERT INTO `foodingredients` (`FoodID`, `Ingredients`) VALUES
(10000, 'caramel'),
(10000, 'flour'),
(10002, 'Garlic'),
(10002, 'Ginger'),
(10002, 'Onions'),
(10002, 'Pork');

-- --------------------------------------------------------

--
-- Table structure for table `orderfoods`
--

DROP TABLE IF EXISTS `orderfoods`;
CREATE TABLE IF NOT EXISTS `orderfoods` (
  `OrderID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`FoodID`,`OrderID`) USING BTREE,
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderfoods`
--

INSERT INTO `orderfoods` (`OrderID`, `FoodID`, `quantity`) VALUES
(100001, 10000, 2),
(100001, 10001, 1),
(100002, 10002, 1),
(100004, 10002, 2),
(100003, 10004, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE IF NOT EXISTS `orderinfo` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `totalPrice` float NOT NULL,
  `paymentMethod` text NOT NULL,
  `pickUpTime` datetime NOT NULL,
  `contactInfo` text NOT NULL,
  `pickUpAddress` text NOT NULL,
  `orderTime` datetime NOT NULL,
  `customerID` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE,
  KEY `customerID` (`customerID`),
  KEY `sellerID` (`sellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`OrderID`, `totalPrice`, `paymentMethod`, `pickUpTime`, `contactInfo`, `pickUpAddress`, `orderTime`, `customerID`, `sellerID`) VALUES
(100001, 29.99, 'Credit card', '2021-03-15 21:59:54', 'email or phone', '170 street abc', '2021-03-14 21:59:54', 1, 2),
(100002, 89.78, 'mastercard', '2021-03-17 22:13:25', 'phone email', 'abc streed 12345', '2021-03-16 22:13:25', 1, 2),
(100003, 56, 'Debit Card', '2021-03-15 21:59:54', '6049002189\r\n', '9090 spruce avenue', '2021-03-14 19:08:14', 14, 5),
(100004, 15, 'debit', '2021-03-19 19:11:06', '7789283746', '6001 cornwall street', '2021-03-18 19:11:06', 3, 5),
(100005, 18, 'debit', '2021-03-20 19:12:08', '60492847328', '7878 wood street', '2021-03-19 19:12:08', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderplacement`
--

DROP TABLE IF EXISTS `orderplacement`;
CREATE TABLE IF NOT EXISTS `orderplacement` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`CustomerID`,`SellerID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SellerID` (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderplacement`
--

INSERT INTO `orderplacement` (`OrderID`, `CustomerID`, `SellerID`) VALUES
(100001, 1, 2),
(100002, 1, 2),
(100004, 3, 5),
(100005, 7, 8),
(100003, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Location` varchar(200) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`UserID`, `email`, `Password`, `UserName`, `Phone`, `Location`, `FirstName`, `LastName`) VALUES
(1, 'mikerr@gmail.com', 'platinumstar', 'mikey123', '778908273', '515 W Hastings', 'Mike', 'Hawk'),
(2, 'joek@gmail.com', 'ligma789', 'joemama', '6045869382', '13450 103 Ave', 'Joseph', 'Mama'),
(3, 'user1@gmail.com', 'password123', 'misteruser1', '6041231234', '8888 University Drive', 'User', 'Test'),
(4, 'krug@gmail.com', 'bohemianrhapsody', 'krug56', '6048273492', '8888 University Drive', 'paul', 'krug'),
(5, 'carmenl@gmail.com', 'caramelc', 'lcarmen', '7781824827', '9008 spruce ave', 'Carmen', 'Law'),
(6, 'alit@gmail.com', 'sugondese', 'tali', '7782947263', '167 maple drive', 'Ali', 'Tohidi'),
(7, 'seant@gmail.com', 'joemama123', 'tsean', '9385719832873', '898 blue mountain', 'Sean', 'Tam'),
(8, 'jessical@gmail.com', 'qwertyuiop', 'ljessica', '6083827482', '13450 103 Ave', 'Jessica', 'Li'),
(13, 'jsmith123@gmail.com', '1234567890', 'jjs897', '6047578394', '1234 chernobog street', 'John', 'Smith'),
(14, 'talligator@sfu.ca', 'alligatorsarecool', 'ali1998', '7783652735', '8997 papaya avenue', 'Alligator', 'T'),
(15, 'crocodileTohidi10@gmail.com', 'alilovesalligator', 'crocodileTohidi10', '7786394826', '98 green dolphin street', 'Crocodile', 'Tohidi');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `ReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerUserID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` text,
  PRIMARY KEY (`ReviewID`) USING BTREE,
  KEY `FoodID` (`FoodID`),
  KEY `CustomerUserID` (`CustomerUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=20006 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerUserID`, `FoodID`, `Rating`, `Comment`) VALUES
(20001, 1, 10000, 10, 'it was very good'),
(20002, 14, 10003, 8, 'pretty decent'),
(20003, 3, 10004, 10, 'yum!'),
(20004, 7, 10001, 7, 'nice'),
(20005, 6, 10002, 8, 'pretty good');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
CREATE TABLE IF NOT EXISTS `seller` (
  `UserID` int(10) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`UserID`) VALUES
(1),
(2),
(5),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `userallergies`
--

DROP TABLE IF EXISTS `userallergies`;
CREATE TABLE IF NOT EXISTS `userallergies` (
  `UserID` int(10) NOT NULL,
  `Allergies` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`,`Allergies`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userallergies`
--

INSERT INTO `userallergies` (`UserID`, `Allergies`) VALUES
(1, 'Crayfish'),
(1, 'Peanuts'),
(2, 'Milk'),
(2, 'Pineapple'),
(14, 'Mangos');

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
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`FollowerID`) REFERENCES `profile` (`UserID`),
  ADD CONSTRAINT `follows_ibfk_3` FOREIGN KEY (`FolloweeID`) REFERENCES `profile` (`UserID`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`PUserID`) REFERENCES `profile` (`UserID`);

--
-- Constraints for table `foodingredients`
--
ALTER TABLE `foodingredients`
  ADD CONSTRAINT `foodingredients_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`);

--
-- Constraints for table `orderfoods`
--
ALTER TABLE `orderfoods`
  ADD CONSTRAINT `orderfoods_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderinfo` (`OrderID`),
  ADD CONSTRAINT `orderfoods_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`);

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`UserID`),
  ADD CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`UserID`);

--
-- Constraints for table `orderplacement`
--
ALTER TABLE `orderplacement`
  ADD CONSTRAINT `orderplacement_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderinfo` (`OrderID`),
  ADD CONSTRAINT `orderplacement_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`UserID`),
  ADD CONSTRAINT `orderplacement_ibfk_3` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`UserID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`CustomerUserID`) REFERENCES `customer` (`UserID`);

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
