-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 18, 2021 at 08:06 AM
-- Server version: 8.0.23
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
  `UserID` int NOT NULL,
  `OverallCustomerRating` int DEFAULT NULL,
  `numberOfRatings` int DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`UserID`, `OverallCustomerRating`, `numberOfRatings`) VALUES
(1, 10, 2),
(2, 5, 5),
(3, 5, 10),
(4, 0, 0),
(6, 5, 1),
(7, 5, 5),
(14, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
CREATE TABLE IF NOT EXISTS `follows` (
  `FollowerID` int NOT NULL,
  `FolloweeID` int NOT NULL,
  PRIMARY KEY (`FollowerID`,`FolloweeID`) USING BTREE,
  KEY `FolloweeID` (`FolloweeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `FoodID` int NOT NULL AUTO_INCREMENT,
  `PUserID` int NOT NULL,
  `FoodName` varchar(50) NOT NULL,
  `pricePerUnit` int DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Description` text,
  `Instructions` text,
  `Img_url` text NOT NULL,
  PRIMARY KEY (`FoodID`) USING BTREE,
  KEY `PUserID` (`PUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `PUserID`, `FoodName`, `pricePerUnit`, `Availability`, `Description`, `Instructions`, `Img_url`) VALUES
(10000, 1, 'Fluffy Caramel Pancake', 10, 1, 'Try out this simple yet delicious pancake recipe! It\'s quick and perfect for a breakfast.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10001, 1, 'Homemade Pumpkin Soup', NULL, 0, 'Creamy and hearty homemade pumpkin soup that brings back all the good memories. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10002, 2, 'Roasted Garlic Porkchop', NULL, 0, 'Garlic and porkchop is the combination that many people overlook. It\'s so addicting that I can guarantee you will make this at least once a week!', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/361184/asparagus-steak-veal-steak-veal-361184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10003, 5, 'Simple Pizza', 7, 1, 'Who doesn\'t crave for pizzas on a Friday movie night? If you want a cheap and simple pizza recipe, this is the one.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4193872/pexels-photo-4193872.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10004, 5, 'Chocolate Mousse Cake', 12, 1, 'This sweet, melts in your mouth chocolate mousse cake recipe is not only easy to make, but it also looks and tastes great. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/960540/pexels-photo-960540.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10005, 28, 'Homemade Pretzels', 5, 1, 'Homemade, baked, soft pretzels perfect for a snack.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4050068/pexels-photo-4050068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
(10006, 13, 'Pork Dumplings', 1, 1, 'Pork dumplings from your local Chinese family. Sells per dumpling. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4084935/pexels-photo-4084935.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
(10007, 4, 'Spaghetti in Meat Sauce', 13, 1, 'Easy to make spaghetti sauce.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/128408/pexels-photo-128408.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
(10008, 14, 'Banana Bread', NULL, 0, 'With only 3 ripe bananas, you too can bake this amazing banana bread.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
(10009, 4, 'Chocolate Digestives', 1, 1, 'Digestives dipped in smooth milk chocolate', 'Eat it directly or have it with some tea or coffee', 'https://images.pexels.com/photos/1009841/pexels-photo-1009841.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');

-- --------------------------------------------------------

--
-- Stand-in structure for view `foodandrating`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `foodandrating`;
CREATE TABLE IF NOT EXISTS `foodandrating` (
`FoodID` int
,`PUserID` int
,`FoodName` varchar(50)
,`pricePerUnit` int
,`Availability` tinyint(1)
,`Description` text
,`Instructions` text
,`Img_url` text
,`RfoodID` int
,`avergeReview` decimal(12,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `foodingredients`
--

DROP TABLE IF EXISTS `foodingredients`;
CREATE TABLE IF NOT EXISTS `foodingredients` (
  `FoodID` int NOT NULL,
  `Ingredients` text NOT NULL,
  PRIMARY KEY (`FoodID`,`Ingredients`(50)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foodingredients`
--

INSERT INTO `foodingredients` (`FoodID`, `Ingredients`) VALUES
(10000, 'Baking power'),
(10000, 'Blueberry'),
(10000, 'Caramel'),
(10000, 'Flour'),
(10000, 'Milk'),
(10000, 'Strawberry'),
(10001, 'Black Pepper'),
(10001, 'Coconut Milk'),
(10001, 'Garlic'),
(10001, 'Nutmeg'),
(10001, 'Onion'),
(10001, 'Pumpkin'),
(10001, 'Salt'),
(10001, 'Vegetable Broth'),
(10002, 'Butter'),
(10002, 'Garlic'),
(10002, 'Ginger'),
(10002, 'Onions'),
(10002, 'Pork'),
(10002, 'Salt'),
(10002, 'Thyme'),
(10003, 'Baby Arugula'),
(10003, 'Bread flour'),
(10003, 'Mozzarella Cheese'),
(10003, 'Mushroom'),
(10003, 'Olive Oil'),
(10003, 'Pepperoni '),
(10003, 'Salt'),
(10003, 'Sugar'),
(10003, 'Tomato'),
(10003, 'Tomato Sauce'),
(10003, 'Yeast'),
(10004, 'Chocolate'),
(10004, 'Gelatin'),
(10004, 'Sugar'),
(10004, 'Whipped Cream'),
(10009, 'Chocolate'),
(10009, 'Digestive biscuits');

-- --------------------------------------------------------

--
-- Stand-in structure for view `foodreviewaverage`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `foodreviewaverage`;
CREATE TABLE IF NOT EXISTS `foodreviewaverage` (
`RfoodID` int
,`avergeReview` decimal(12,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `foodtags`
--

DROP TABLE IF EXISTS `foodtags`;
CREATE TABLE IF NOT EXISTS `foodtags` (
  `FoodID` int NOT NULL,
  `Tags` varchar(20) NOT NULL,
  PRIMARY KEY (`FoodID`,`Tags`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foodtags`
--

INSERT INTO `foodtags` (`FoodID`, `Tags`) VALUES
(10004, 'Vegetarian'),
(10008, 'Vegetarian'),
(10009, 'Vegetarian');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fullorderinfoforseller`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `fullorderinfoforseller`;
CREATE TABLE IF NOT EXISTS `fullorderinfoforseller` (
`OrderID` int
,`totalPrice` float
,`paymentMethod` text
,`pickUpTime` datetime
,`contactInfo` text
,`Region` varchar(25)
,`orderTime` datetime
,`customerID` int
,`sellerID` int
,`Processed` tinyint(1)
,`FoodID` int
,`quantity` int
,`FoodName` varchar(50)
,`FirstName` varchar(20)
,`LastName` varchar(20)
,`PickupAddress` varchar(500)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `history`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
`UserID` int
,`OrderID` int
,`UserName` varchar(50)
,`totalPrice` float
,`orderTime` datetime
,`pickUpTime` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `orderfoods`
--

DROP TABLE IF EXISTS `orderfoods`;
CREATE TABLE IF NOT EXISTS `orderfoods` (
  `OrderID` int NOT NULL,
  `FoodID` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`FoodID`,`OrderID`) USING BTREE,
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderfoods`
--

INSERT INTO `orderfoods` (`OrderID`, `FoodID`, `quantity`) VALUES
(100001, 10000, 2),
(100009, 10000, 1),
(100012, 10000, 2),
(100021, 10000, 2),
(100022, 10000, 3),
(100001, 10001, 1),
(100002, 10002, 1),
(100004, 10002, 2),
(100008, 10003, 5),
(100014, 10003, 2),
(100010, 10004, 1),
(100015, 10004, 5),
(100007, 10005, 2),
(100011, 10006, 20),
(100013, 10006, 40),
(100020, 10009, 42);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE IF NOT EXISTS `orderinfo` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `totalPrice` float NOT NULL,
  `paymentMethod` text NOT NULL,
  `pickUpTime` datetime NOT NULL,
  `contactInfo` text NOT NULL,
  `Region` varchar(25) NOT NULL,
  `orderTime` datetime NOT NULL,
  `customerID` int NOT NULL,
  `sellerID` int NOT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderID`) USING BTREE,
  KEY `customerID` (`customerID`),
  KEY `sellerID` (`sellerID`),
  KEY `Region` (`Region`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`OrderID`, `totalPrice`, `paymentMethod`, `pickUpTime`, `contactInfo`, `Region`, `orderTime`, `customerID`, `sellerID`, `Processed`) VALUES
(100001, 29.99, 'Credit card', '2021-03-15 21:59:54', 'email or phone', 'Vancouver', '2021-03-14 21:59:54', 1, 2, 0),
(100002, 89.78, 'mastercard', '2021-03-17 22:13:25', 'phone email', 'Tri-city', '2021-03-16 22:13:25', 1, 2, 0),
(100003, 56, 'Debit Card', '2021-03-15 21:59:54', '6049002189\r\n', 'Richmond', '2021-03-14 19:08:14', 14, 5, 0),
(100004, 15, 'debit', '2021-03-19 19:11:06', '7789283746', 'Surrey', '2021-03-18 19:11:06', 3, 5, 0),
(100005, 18, 'debit', '2021-03-20 19:12:08', '60492847328', 'Burnaby', '2021-03-19 19:12:08', 7, 8, 0),
(100007, 11.5, 'Cash', '2021-04-24 19:19:45', '7787787788', 'Tri-city', '2021-04-10 19:19:45', 3, 28, 0),
(100008, 37, 'Credit Card', '2021-04-23 20:13:49', '7789283746', 'Surrey', '2021-04-10 20:13:49', 3, 5, 0),
(100009, 12, 'Cash', '2021-04-21 20:19:49', '7789283746', 'Surrey', '2021-04-10 20:19:49', 3, 1, 1),
(100010, 14, 'Cash', '2021-04-28 20:26:20', '7789283746', 'Surrey', '2021-04-10 20:26:20', 3, 5, 0),
(100011, 22, 'Credit Card', '2021-04-18 20:39:45', '7789283746', 'Surrey', '2021-04-10 20:40:23', 3, 13, 0),
(100012, 22, 'Cash', '2021-04-22 20:56:27', '7789283746', 'Surrey', '2021-04-10 20:56:27', 3, 1, 0),
(100013, 43, 'Credit Card', '2021-04-19 21:00:23', '6042599873', 'Richmond', '2021-04-10 21:00:24', 6, 13, 0),
(100014, 14, 'Credit card', '2021-04-24 10:00:00', '7787463302', 'Burnaby', '2021-04-17 21:03:02', 1, 5, 0),
(100015, 60, 'Credit card', '2021-04-22 10:00:00', '7787463302', 'Burnaby', '2021-04-17 21:05:14', 1, 5, 0),
(100020, 42, 'Credit card', '2021-04-17 23:00:00', '123456789', 'Burnaby', '2021-04-17 23:00:53', 1, 4, 0),
(100021, 20, 'Credit card', '2021-04-16 23:19:00', '23', 'Burnaby', '2021-04-17 23:19:50', 4, 1, 0),
(100022, 30, 'Credit card', '2021-04-20 00:50:00', '6041231233', 'Burnaby', '2021-04-18 00:50:31', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderplacement`
--

DROP TABLE IF EXISTS `orderplacement`;
CREATE TABLE IF NOT EXISTS `orderplacement` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `SellerID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`CustomerID`,`SellerID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SellerID` (`SellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderplacement`
--

INSERT INTO `orderplacement` (`OrderID`, `CustomerID`, `SellerID`) VALUES
(100001, 1, 2),
(100002, 1, 2),
(100014, 1, 5),
(100015, 1, 5),
(100020, 1, 4),
(100004, 3, 5),
(100007, 3, 28),
(100008, 3, 5),
(100009, 3, 1),
(100010, 3, 5),
(100011, 3, 13),
(100012, 3, 1),
(100013, 3, 13),
(100022, 3, 1),
(100021, 4, 1),
(100005, 7, 8),
(100003, 14, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `phistory`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `phistory`;
CREATE TABLE IF NOT EXISTS `phistory` (
`UserID` int
,`SellerID` int
,`OrderID` int
,`UserName` varchar(50)
,`totalPrice` float
,`orderTime` datetime
,`pickUpTime` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Location` varchar(200) NOT NULL,
  `Region` varchar(30) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Img_url` varchar(1000) NOT NULL DEFAULT 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`UserID`, `email`, `Password`, `UserName`, `Phone`, `Location`, `Region`, `FirstName`, `LastName`, `Img_url`) VALUES
(1, 'mikerr@gmail.com', 'platinumstar', 'mikey123', '778908273', '515 W Hastings', 'Vancouver', 'Mike', 'Hawk', 'http://www.kevmill.com/wp-content/uploads/2019/09/cropped-Kevin-profile-pic-2019-square-small-300x300.jpg'),
(2, 'jacSmith20@gmail.com', '94ijdna9', 'jacquieSmith20', '6045869382', '13450 103 Ave', 'Richmond', 'Jacqueline', 'Smith', 'https://www.stepstherapy.com.au/wp-content/uploads/2018/10/Yazmin-profile-picture-square.jpg'),
(3, 'user1@gmail.com', 'password123', 'misteruser1', '6041231234', '8888 University Drive', 'Burnaby', 'User', 'Test', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(4, 'krug@gmail.com', 'bohemianrhapsody', 'krug56', '6048273492', '8888 University Drive', 'Burnaby', 'Paul', 'Krug', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(5, 'carmenl@gmail.com', 'caramelc', 'lcarmen', '7781824827', '9008 Spruce Ave', 'Tri-city', 'Carmen', 'Law', 'https://i.imgur.com/AWKHeRe.jpg'),
(6, 'alit@gmail.com', 'sugondese', 'tali', '7782947263', '167 Maple Dr', 'Surrey', 'Ali', 'Tohidi', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(7, 'seant@gmail.com', 'joemama123', 'tsean', '9385719832873', '898 Blue mountain', 'Tri-city', 'Sean', 'Tam', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(8, 'jessical@gmail.com', 'qwertyuiop', 'ljessica', '6083827482', '13450 103 Ave', 'Richmond', 'Jessica', 'Li', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(13, 'jsmith123@gmail.com', '1234567890', 'jjs897', '6047578394', '1234 Chernobog St', 'North/ west Vancouver', 'John', 'Smith', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(14, 'talligator@sfu.ca', 'alligatorsarecool', 'ali1998', '7783652735', '8997 Papaya Ave', 'Tri-city', 'Alligator', 'T', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(15, 'crocodileTohidi10@gmail.com', 'alilovesalligator', 'crocodileTohidi10', '7786394826', '98 GreenDolphin St', 'Surrey', 'Crocodile', 'Tohidi', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(18, 'alaw0306@gmail.com', '3385729836', 'alaw0306', '6048376652', '2847 Diamond Ave', 'Tri-city', 'Ashley', 'Law', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(27, 'ericaluo09@gmail.com', '7yuhhdjshdbb', 'erical0913', '7789993856', '8876 Eagle Str', 'North/west vancouver', 'Erica', 'Luo', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(28, 'alicecyq@gmail.com', '8djjHHHagsd', 'aliceCh0107', '6048837269', '7620 Cotton St', 'Burnaby', 'Alice', 'Chen', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(29, 'chrissyj10@outlook.com', '87HKsldW', 'chrissyJepsen10', '6048773008', '2099 Fox Dr', 'Richmond', 'Christine', 'Jepsen', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'),
(30, 'brandonf28@yahoo.com', 'ilovepizza102', 'brandonF_28', '7780092736', '283 Lavender Ave', 'Burnaby', 'Brandon', 'Falcon', 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `publicprofileinfo`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `publicprofileinfo`;
CREATE TABLE IF NOT EXISTS `publicprofileinfo` (
`UserID` int
,`UserName` varchar(50)
,`Region` varchar(30)
,`FirstName` varchar(20)
,`LastName` varchar(20)
,`Img_url` varchar(1000)
);

-- --------------------------------------------------------

--
-- Table structure for table `regionpickup`
--

DROP TABLE IF EXISTS `regionpickup`;
CREATE TABLE IF NOT EXISTS `regionpickup` (
  `Region` varchar(25) NOT NULL,
  `PickupAddress` varchar(500) NOT NULL,
  UNIQUE KEY `Region` (`Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `regionpickup`
--

INSERT INTO `regionpickup` (`Region`, `PickupAddress`) VALUES
('Burnaby', 'Metrotown Station'),
('North/ west Vancouver', 'Lonsdale Quay'),
('Richmond', 'Aberdeen Center'),
('Surrey', 'King George Station'),
('Tri-city', 'Coquitlam Centre Station'),
('Vancouver', 'Waterfront Station');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `CustomerUserID` int NOT NULL,
  `FoodID` int NOT NULL,
  `Rating` int NOT NULL,
  `Comment` text,
  PRIMARY KEY (`ReviewID`) USING BTREE,
  KEY `FoodID` (`FoodID`),
  KEY `CustomerUserID` (`CustomerUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=20008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerUserID`, `FoodID`, `Rating`, `Comment`) VALUES
(20001, 1, 10000, 10, 'it was very good'),
(20002, 14, 10003, 8, 'pretty decent'),
(20003, 3, 10004, 10, 'yum!'),
(20004, 7, 10001, 7, 'nice'),
(20005, 6, 10002, 8, 'pretty good'),
(20007, 1, 10004, 10, 'Amazing.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reviewfoods`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reviewfoods`;
CREATE TABLE IF NOT EXISTS `reviewfoods` (
`ReviewID` int
,`CustomerUserID` int
,`FoodID` int
,`Rating` int
,`Comment` text
,`FoodName` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
CREATE TABLE IF NOT EXISTS `seller` (
  `UserID` int NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`UserID`) VALUES
(1),
(2),
(4),
(5),
(7),
(8),
(13),
(28);

-- --------------------------------------------------------

--
-- Table structure for table `userallergies`
--

DROP TABLE IF EXISTS `userallergies`;
CREATE TABLE IF NOT EXISTS `userallergies` (
  `UserID` int NOT NULL,
  `Allergies` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`,`Allergies`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userallergies`
--

INSERT INTO `userallergies` (`UserID`, `Allergies`) VALUES
(1, 'Crayfish'),
(1, 'Peanuts'),
(2, 'Milk'),
(2, 'Pineapple'),
(14, 'Mangos');

-- --------------------------------------------------------

--
-- Structure for view `foodandrating`
--
DROP TABLE IF EXISTS `foodandrating`;

DROP VIEW IF EXISTS `foodandrating`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foodandrating`  AS  select `food`.`FoodID` AS `FoodID`,`food`.`PUserID` AS `PUserID`,`food`.`FoodName` AS `FoodName`,`food`.`pricePerUnit` AS `pricePerUnit`,`food`.`Availability` AS `Availability`,`food`.`Description` AS `Description`,`food`.`Instructions` AS `Instructions`,`food`.`Img_url` AS `Img_url`,`foodreviewaverage`.`RfoodID` AS `RfoodID`,`foodreviewaverage`.`avergeReview` AS `avergeReview` from (`food` left join `foodreviewaverage` on((`foodreviewaverage`.`RfoodID` = `food`.`FoodID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `foodreviewaverage`
--
DROP TABLE IF EXISTS `foodreviewaverage`;

DROP VIEW IF EXISTS `foodreviewaverage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foodreviewaverage`  AS  select `review`.`FoodID` AS `RfoodID`,round(avg(`review`.`Rating`),1) AS `avergeReview` from `review` group by `review`.`FoodID` ;

-- --------------------------------------------------------

--
-- Structure for view `fullorderinfoforseller`
--
DROP TABLE IF EXISTS `fullorderinfoforseller`;

DROP VIEW IF EXISTS `fullorderinfoforseller`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fullorderinfoforseller`  AS  select `orderinfo`.`OrderID` AS `OrderID`,`orderinfo`.`totalPrice` AS `totalPrice`,`orderinfo`.`paymentMethod` AS `paymentMethod`,`orderinfo`.`pickUpTime` AS `pickUpTime`,`orderinfo`.`contactInfo` AS `contactInfo`,`orderinfo`.`Region` AS `Region`,`orderinfo`.`orderTime` AS `orderTime`,`orderinfo`.`customerID` AS `customerID`,`orderinfo`.`sellerID` AS `sellerID`,`orderinfo`.`Processed` AS `Processed`,`orderfoods`.`FoodID` AS `FoodID`,`orderfoods`.`quantity` AS `quantity`,`food`.`FoodName` AS `FoodName`,`publicprofileinfo`.`FirstName` AS `FirstName`,`publicprofileinfo`.`LastName` AS `LastName`,`regionpickup`.`PickupAddress` AS `PickupAddress` from ((((`orderinfo` join `orderfoods` on((`orderinfo`.`OrderID` = `orderfoods`.`OrderID`))) join `food` on((`orderfoods`.`FoodID` = `food`.`FoodID`))) join `publicprofileinfo` on((`orderinfo`.`customerID` = `publicprofileinfo`.`UserID`))) join `regionpickup` on((`orderinfo`.`Region` = `regionpickup`.`Region`))) ;

-- --------------------------------------------------------

--
-- Structure for view `history`
--
DROP TABLE IF EXISTS `history`;

DROP VIEW IF EXISTS `history`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history`  AS  select `c`.`UserID` AS `UserID`,`op`.`OrderID` AS `OrderID`,`s`.`UserName` AS `UserName`,`i`.`totalPrice` AS `totalPrice`,`i`.`orderTime` AS `orderTime`,`i`.`pickUpTime` AS `pickUpTime` from (((`orderplacement` `op` join `profile` `c`) join `profile` `s`) join `orderinfo` `i`) where ((`c`.`UserID` = `op`.`CustomerID`) and (`s`.`UserID` = `op`.`SellerID`) and (`i`.`OrderID` = `op`.`OrderID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `phistory`
--
DROP TABLE IF EXISTS `phistory`;

DROP VIEW IF EXISTS `phistory`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `phistory`  AS  select `c`.`UserID` AS `UserID`,`s`.`UserID` AS `SellerID`,`op`.`OrderID` AS `OrderID`,`s`.`UserName` AS `UserName`,`i`.`totalPrice` AS `totalPrice`,`i`.`orderTime` AS `orderTime`,`i`.`pickUpTime` AS `pickUpTime` from (((`orderplacement` `op` join `profile` `c`) join `profile` `s`) join `orderinfo` `i`) where ((`c`.`UserID` = `op`.`CustomerID`) and (`s`.`UserID` = `op`.`SellerID`) and (`i`.`OrderID` = `op`.`OrderID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `publicprofileinfo`
--
DROP TABLE IF EXISTS `publicprofileinfo`;

DROP VIEW IF EXISTS `publicprofileinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `publicprofileinfo`  AS  select `profile`.`UserID` AS `UserID`,`profile`.`UserName` AS `UserName`,`profile`.`Region` AS `Region`,`profile`.`FirstName` AS `FirstName`,`profile`.`LastName` AS `LastName`,`profile`.`Img_url` AS `Img_url` from `profile` ;

-- --------------------------------------------------------

--
-- Structure for view `reviewfoods`
--
DROP TABLE IF EXISTS `reviewfoods`;

DROP VIEW IF EXISTS `reviewfoods`;
CREATE ALGORITHM=UNDEFINED DEFINER=`pls`@`localhost` SQL SECURITY DEFINER VIEW `reviewfoods`  AS  select `review`.`ReviewID` AS `ReviewID`,`review`.`CustomerUserID` AS `CustomerUserID`,`review`.`FoodID` AS `FoodID`,`review`.`Rating` AS `Rating`,`review`.`Comment` AS `Comment`,`food`.`FoodName` AS `FoodName` from (`review` join `food`) where (`food`.`FoodID` = `review`.`FoodID`) ;

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
  ADD CONSTRAINT `foodingredients_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`) ON DELETE CASCADE;

--
-- Constraints for table `foodtags`
--
ALTER TABLE `foodtags`
  ADD CONSTRAINT `foodtags_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`) ON DELETE CASCADE;

--
-- Constraints for table `orderfoods`
--
ALTER TABLE `orderfoods`
  ADD CONSTRAINT `orderfoods_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderinfo` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderfoods_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`) ON DELETE CASCADE;

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`UserID`),
  ADD CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`UserID`),
  ADD CONSTRAINT `orderinfo_ibfk_3` FOREIGN KEY (`Region`) REFERENCES `regionpickup` (`Region`);

--
-- Constraints for table `orderplacement`
--
ALTER TABLE `orderplacement`
  ADD CONSTRAINT `orderplacement_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderinfo` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderplacement_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderplacement_ibfk_3` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`) ON DELETE CASCADE,
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
