-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2021 at 09:01 PM
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
  `Name` varchar(50) NOT NULL,
  `pricePerUnit` int DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Description` text,
  `Instructions` text,
  `Img_url` text NOT NULL,
  PRIMARY KEY (`FoodID`) USING BTREE,
  KEY `PUserID` (`PUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `PUserID`, `Name`, `pricePerUnit`, `Availability`, `Description`, `Instructions`, `Img_url`) VALUES
(10000, 1, 'Fluffy Caramel Pancake', 10, 1, 'Try out this simple yet delicious pancake recipe! It\'s quick and perfect for a breakfast.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10001, 1, 'Homemade Pumpkin Soup', NULL, 0, 'Creamy and hearty homemade pumpkin soup that brings back all the good memories. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10002, 2, 'Roasted Garlic Porkchop', NULL, 0, 'Garlic and porkchop is the combination that many people overlook. It\'s so addicting that I can guarantee you will make this at least once a week!', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/361184/asparagus-steak-veal-steak-veal-361184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10003, 5, 'Simple Pizza', 7, 1, 'Who doesn\'t crave for pizzas on a Friday movie night? If you want a cheap and simple pizza recipe, this is the one.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4193872/pexels-photo-4193872.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10004, 5, 'Chocolate Mousse Cake', 12, 1, 'This sweet, melts in your mouth chocolate mousse cake recipe is not only easy to make, but it also looks and tastes great. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/960540/pexels-photo-960540.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
(10005, 28, 'Homemade Pretzels', 5, 1, 'Homemade, baked, soft pretzels perfect for a snack.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4050068/pexels-photo-4050068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
(10006, 13, 'Pork Dumplings', 1, 1, 'Pork dumplings from your local Chinese family. Sells per dumpling. ', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/4084935/pexels-photo-4084935.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
(10007, 4, 'Spaghetti in Meat Sauce', 13, 1, 'Easy to make spaghetti sauce.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/128408/pexels-photo-128408.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
(10008, 14, 'Banana Bread', NULL, 0, 'With only 3 ripe bananas, you too can bake this amazing banana bread.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');

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
(10004, 'Whipped Cream');

-- --------------------------------------------------------

--
-- Stand-in structure for view `foodreviewaverage`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `foodreviewaverage`;
CREATE TABLE IF NOT EXISTS `foodreviewaverage` (
`avergeReview` decimal(12,1)
,`foodID` int
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
(100001, 10001, 1),
(100002, 10002, 1),
(100004, 10002, 2),
(100008, 10003, 5),
(100003, 10004, 8),
(100010, 10004, 1),
(100007, 10005, 2),
(100011, 10006, 20),
(100013, 10006, 40);

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
  `pickUpAddress` text NOT NULL,
  `Region` varchar(25) NOT NULL,
  `orderTime` datetime NOT NULL,
  `customerID` int NOT NULL,
  `sellerID` int NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE,
  KEY `customerID` (`customerID`),
  KEY `sellerID` (`sellerID`),
  KEY `Region` (`Region`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`OrderID`, `totalPrice`, `paymentMethod`, `pickUpTime`, `contactInfo`, `pickUpAddress`, `Region`, `orderTime`, `customerID`, `sellerID`) VALUES
(100001, 29.99, 'Credit card', '2021-03-15 21:59:54', 'email or phone', '170 street abc', 'Vancouver', '2021-03-14 21:59:54', 1, 2),
(100002, 89.78, 'mastercard', '2021-03-17 22:13:25', 'phone email', 'abc streed 12345', 'Tri-city', '2021-03-16 22:13:25', 1, 2),
(100003, 56, 'Debit Card', '2021-03-15 21:59:54', '6049002189\r\n', '9090 spruce avenue', 'Richmond', '2021-03-14 19:08:14', 14, 5),
(100004, 15, 'debit', '2021-03-19 19:11:06', '7789283746', '6001 cornwall street', 'Surrey', '2021-03-18 19:11:06', 3, 5),
(100005, 18, 'debit', '2021-03-20 19:12:08', '60492847328', '7878 wood street', 'Burnaby', '2021-03-19 19:12:08', 7, 8),
(100007, 11.5, 'Cash', '2021-04-24 19:19:45', '7787787788', '2323 Como Lake Ave', 'Tri-city', '2021-04-10 19:19:45', 3, 28),
(100008, 37, 'Credit Card', '2021-04-23 20:13:49', '7789283746', 'King George Station', 'Surrey', '2021-04-10 20:13:49', 3, 5),
(100009, 12, 'Cash', '2021-04-21 20:19:49', '7789283746', 'King George Station', 'Surrey', '2021-04-10 20:19:49', 3, 1),
(100010, 14, 'Cash', '2021-04-28 20:26:20', '7789283746', 'King George Station', 'Surrey', '2021-04-10 20:26:20', 3, 5),
(100011, 22, 'Credit Card', '2021-04-18 20:39:45', '7789283746', '6001 cornwall street', 'Surrey', '2021-04-10 20:40:23', 3, 13),
(100012, 22, 'Cash', '2021-04-22 20:56:27', '7789283746', 'King George Station', 'Surrey', '2021-04-10 20:56:27', 3, 1),
(100013, 43, 'Credit Card', '2021-04-19 21:00:23', '6042599873', '2-4621 Alder Drive', 'Richmond', '2021-04-10 21:00:24', 6, 13);

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
(100004, 3, 5),
(100007, 3, 28),
(100008, 3, 5),
(100009, 3, 1),
(100010, 3, 5),
(100011, 3, 13),
(100012, 3, 1),
(100013, 3, 13),
(100005, 7, 8),
(100003, 14, 5);

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
  `Img_url` varchar(1000) NOT NULL DEFAULT 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`UserID`, `email`, `Password`, `UserName`, `Phone`, `Location`, `Region`, `FirstName`, `LastName`, `Img_url`) VALUES
(1, 'mikerr@gmail.com', 'platinumstar', 'mikey123', '778908273', '515 W Hastings', 'Vancouver', 'Mike', 'Hawk', 'http://www.kevmill.com/wp-content/uploads/2019/09/cropped-Kevin-profile-pic-2019-square-small-300x300.jpg'),
(2, 'jacSmith20@gmail.com', '94ijdna9', 'jacquieSmith20', '6045869382', '13450 103 Ave', 'Richmond', 'Jacqueline', 'Smith', 'https://www.stepstherapy.com.au/wp-content/uploads/2018/10/Yazmin-profile-picture-square.jpg'),
(3, 'user1@gmail.com', 'password123', 'misteruser1', '6041231234', '8888 University Drive', 'Burnaby', 'User', 'Test', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(4, 'krug@gmail.com', 'bohemianrhapsody', 'krug56', '6048273492', '8888 University Drive', 'Burnaby', 'Paul', 'Krug', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(5, 'carmenl@gmail.com', 'caramelc', 'lcarmen', '7781824827', '9008 Spruce Ave', 'Tri-city', 'Carmen', 'Law', 'https://i.imgur.com/AWKHeRe.jpg'),
(6, 'alit@gmail.com', 'sugondese', 'tali', '7782947263', '167 Maple Dr', 'Surrey', 'Ali', 'Tohidi', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(7, 'seant@gmail.com', 'joemama123', 'tsean', '9385719832873', '898 Blue mountain', 'Tri-city', 'Sean', 'Tam', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(8, 'jessical@gmail.com', 'qwertyuiop', 'ljessica', '6083827482', '13450 103 Ave', 'Richmond', 'Jessica', 'Li', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(13, 'jsmith123@gmail.com', '1234567890', 'jjs897', '6047578394', '1234 Chernobog St', 'North/ west Vancouver', 'John', 'Smith', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(14, 'talligator@sfu.ca', 'alligatorsarecool', 'ali1998', '7783652735', '8997 Papaya Ave', 'Tri-city', 'Alligator', 'T', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(15, 'crocodileTohidi10@gmail.com', 'alilovesalligator', 'crocodileTohidi10', '7786394826', '98 GreenDolphin St', 'Surrey', 'Crocodile', 'Tohidi', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(18, 'alaw0306@gmail.com', '3385729836', 'alaw0306', '6048376652', '2847 Diamond Ave', 'Tri-city', 'Ashley', 'Law', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(27, 'ericaluo09@gmail.com', '7yuhhdjshdbb', 'erical0913', '7789993856', '8876 Eagle Str', 'North/west vancouver', 'Erica', 'Luo', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(28, 'alicecyq@gmail.com', '8djjHHHagsd', 'aliceCh0107', '6048837269', '7620 Cotton St', 'Burnaby', 'Alice', 'Chen', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(29, 'chrissyj10@outlook.com', '87HKsldW', 'chrissyJepsen10', '6048773008', '2099 Fox Dr', 'Richmond', 'Christine', 'Jepsen', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD'),
(30, 'brandonf28@yahoo.com', 'ilovepizza102', 'brandonF_28', '7780092736', '283 Lavender Ave', 'Burnaby', 'Brandon', 'Falcon', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstartupheretoronto.com%2Fpartners%2Fextreme-venture-partners%2Fthinkdata-partners-with-the-vector-institute-to-provide-ai-research-platform%2Fattachment%2Fdefault-user-image-png-5%2F&psig=AOvVaw0yxYHyUQFtpq5vfgvw5eBa&ust=1618002227702000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjboJTG7-8CFQAAAAAdAAAAABAD');

-- --------------------------------------------------------

--
-- Stand-in structure for view `publicprofileinfo`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `publicprofileinfo`;
CREATE TABLE IF NOT EXISTS `publicprofileinfo` (
`FirstName` varchar(20)
,`Img_url` varchar(1000)
,`LastName` varchar(20)
,`Region` varchar(30)
,`UserID` int
,`UserName` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `regionfee`
--

DROP TABLE IF EXISTS `regionfee`;
CREATE TABLE IF NOT EXISTS `regionfee` (
  `Region` varchar(25) NOT NULL,
  `ServiceFee` float NOT NULL,
  UNIQUE KEY `Region` (`Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `regionfee`
--

INSERT INTO `regionfee` (`Region`, `ServiceFee`) VALUES
('Burnaby', 1),
('North/ west Vancouver', 3),
('Richmond', 3),
('Surrey', 2),
('Tri-city', 1.5),
('Vancouver', 2.5);

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
) ENGINE=InnoDB AUTO_INCREMENT=20007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `UserID` int NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`UserID`) VALUES
(1),
(2),
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
-- Structure for view `foodreviewaverage`
--
DROP TABLE IF EXISTS `foodreviewaverage`;

DROP VIEW IF EXISTS `foodreviewaverage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foodreviewaverage`  AS  select `review`.`FoodID` AS `foodID`,round(avg(`review`.`Rating`),1) AS `avergeReview` from `review` group by `review`.`FoodID` ;

-- --------------------------------------------------------

--
-- Structure for view `publicprofileinfo`
--
DROP TABLE IF EXISTS `publicprofileinfo`;

DROP VIEW IF EXISTS `publicprofileinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `publicprofileinfo`  AS  select `profile`.`UserID` AS `UserID`,`profile`.`UserName` AS `UserName`,`profile`.`Region` AS `Region`,`profile`.`FirstName` AS `FirstName`,`profile`.`LastName` AS `LastName`,`profile`.`Img_url` AS `Img_url` from `profile` ;

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
  ADD CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`UserID`),
  ADD CONSTRAINT `orderinfo_ibfk_3` FOREIGN KEY (`Region`) REFERENCES `regionfee` (`Region`);

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
