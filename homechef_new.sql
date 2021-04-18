-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2021 at 06:38 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

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

CREATE TABLE `customer` (
  `UserID` int(11) NOT NULL,
  `OverallCustomerRating` int(11) DEFAULT NULL,
  `numberOfRatings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `follows` (
  `FollowerID` int(11) NOT NULL,
  `FolloweeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`FollowerID`, `FolloweeID`) VALUES
(1, 2),
(3, 2),
(6, 14),
(6, 15),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FoodID` int(11) NOT NULL,
  `PUserID` int(11) NOT NULL,
  `FoodName` varchar(50) NOT NULL,
  `pricePerUnit` int(11) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Instructions` text DEFAULT NULL,
  `Img_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(10008, 14, 'Banana Bread', NULL, 0, 'With only 3 ripe bananas, you too can bake this amazing banana bread.', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', 'https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');

-- --------------------------------------------------------

--
-- Stand-in structure for view `foodandrating`
-- (See below for the actual view)
--
CREATE TABLE `foodandrating` (
`FoodID` int(11)
,`PUserID` int(11)
,`FoodName` varchar(50)
,`pricePerUnit` int(11)
,`Availability` tinyint(1)
,`Description` text
,`Instructions` text
,`Img_url` text
,`RfoodID` int(11)
,`avergeReview` decimal(12,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `foodingredients`
--

CREATE TABLE `foodingredients` (
  `FoodID` int(11) NOT NULL,
  `Ingredients` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
CREATE TABLE `foodreviewaverage` (
`RfoodID` int(11)
,`avergeReview` decimal(12,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `foodtags`
--

CREATE TABLE `foodtags` (
  `FoodID` int(11) NOT NULL,
  `Tags` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodtags`
--

INSERT INTO `foodtags` (`FoodID`, `Tags`) VALUES
(10008, 'Vegetarian');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fullorderinfoforseller`
-- (See below for the actual view)
--
CREATE TABLE `fullorderinfoforseller` (
`OrderID` int(11)
,`totalPrice` float
,`paymentMethod` text
,`pickUpTime` datetime
,`contactInfo` text
,`Region` varchar(25)
,`orderTime` datetime
,`customerID` int(11)
,`sellerID` int(11)
,`FoodID` int(11)
,`quantity` int(11)
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
CREATE TABLE `history` (
`UserID` int(11)
,`OrderID` int(11)
,`UserName` varchar(50)
,`totalPrice` float
,`orderTime` datetime
,`pickUpTime` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `orderfoods`
--

CREATE TABLE `orderfoods` (
  `OrderID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(100014, 10003, 2),
(100003, 10004, 8),
(100010, 10004, 1),
(100015, 10004, 5),
(100007, 10005, 2),
(100011, 10006, 20),
(100013, 10006, 40);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

CREATE TABLE `orderinfo` (
  `OrderID` int(11) NOT NULL,
  `totalPrice` float NOT NULL,
  `paymentMethod` text NOT NULL,
  `pickUpTime` datetime NOT NULL,
  `contactInfo` text NOT NULL,
  `Region` varchar(25) NOT NULL,
  `orderTime` datetime NOT NULL,
  `customerID` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(100009, 12, 'Cash', '2021-04-21 20:19:49', '7789283746', 'Surrey', '2021-04-10 20:19:49', 3, 1, 0),
(100010, 14, 'Cash', '2021-04-28 20:26:20', '7789283746', 'Surrey', '2021-04-10 20:26:20', 3, 5, 0),
(100011, 22, 'Credit Card', '2021-04-18 20:39:45', '7789283746', 'Surrey', '2021-04-10 20:40:23', 3, 13, 0),
(100012, 22, 'Cash', '2021-04-22 20:56:27', '7789283746', 'Surrey', '2021-04-10 20:56:27', 3, 1, 0),
(100013, 43, 'Credit Card', '2021-04-19 21:00:23', '6042599873', 'Richmond', '2021-04-10 21:00:24', 6, 13, 0),
(100014, 14, 'Credit card', '2021-04-24 10:00:00', '7787463302', 'Burnaby', '2021-04-17 21:03:02', 1, 5, 0),
(100015, 60, 'Credit card', '2021-04-22 10:00:00', '7787463302', 'Burnaby', '2021-04-17 21:05:14', 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderplacement`
--

CREATE TABLE `orderplacement` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderplacement`
--

INSERT INTO `orderplacement` (`OrderID`, `CustomerID`, `SellerID`) VALUES
(100001, 1, 2),
(100002, 1, 2),
(100003, 14, 5),
(100004, 3, 5),
(100005, 7, 8),
(100007, 3, 28),
(100008, 3, 5),
(100009, 3, 1),
(100010, 3, 5),
(100011, 3, 13),
(100012, 3, 1),
(100013, 3, 13),
(100014, 1, 5),
(100015, 1, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `phistory`
-- (See below for the actual view)
--
CREATE TABLE `phistory` (
`UserID` int(11)
,`SellerID` int(11)
,`OrderID` int(11)
,`UserName` varchar(50)
,`totalPrice` float
,`orderTime` datetime
,`pickUpTime` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `UserID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Location` varchar(200) NOT NULL,
  `Region` varchar(30) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Img_url` varchar(1000) NOT NULL DEFAULT 'https://startupheretoronto.com/wp-content/uploads/2018/04/default-user-image-2.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
CREATE TABLE `publicprofileinfo` (
`UserID` int(11)
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

CREATE TABLE `regionpickup` (
  `Region` varchar(25) NOT NULL,
  `PickupAddress` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `CustomerUserID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `seller` (
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `userallergies` (
  `UserID` int(11) NOT NULL,
  `Allergies` varchar(100) NOT NULL
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

-- --------------------------------------------------------

--
-- Structure for view `foodandrating`
--
DROP TABLE IF EXISTS `foodandrating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foodandrating`  AS SELECT `food`.`FoodID` AS `FoodID`, `food`.`PUserID` AS `PUserID`, `food`.`FoodName` AS `FoodName`, `food`.`pricePerUnit` AS `pricePerUnit`, `food`.`Availability` AS `Availability`, `food`.`Description` AS `Description`, `food`.`Instructions` AS `Instructions`, `food`.`Img_url` AS `Img_url`, `foodreviewaverage`.`RfoodID` AS `RfoodID`, `foodreviewaverage`.`avergeReview` AS `avergeReview` FROM (`food` left join `foodreviewaverage` on(`foodreviewaverage`.`RfoodID` = `food`.`FoodID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `foodreviewaverage`
--
DROP TABLE IF EXISTS `foodreviewaverage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foodreviewaverage`  AS SELECT `review`.`FoodID` AS `RfoodID`, round(avg(`review`.`Rating`),1) AS `avergeReview` FROM `review` GROUP BY `review`.`FoodID` ;

-- --------------------------------------------------------

--
-- Structure for view `fullorderinfoforseller`
--
DROP TABLE IF EXISTS `fullorderinfoforseller`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fullorderinfoforseller`  AS SELECT `orderinfo`.`OrderID` AS `OrderID`, `orderinfo`.`totalPrice` AS `totalPrice`, `orderinfo`.`paymentMethod` AS `paymentMethod`, `orderinfo`.`pickUpTime` AS `pickUpTime`, `orderinfo`.`contactInfo` AS `contactInfo`, `orderinfo`.`Region` AS `Region`, `orderinfo`.`orderTime` AS `orderTime`, `orderinfo`.`customerID` AS `customerID`, `orderinfo`.`sellerID` AS `sellerID`, `orderfoods`.`FoodID` AS `FoodID`, `orderfoods`.`quantity` AS `quantity`, `food`.`FoodName` AS `FoodName`, `publicprofileinfo`.`FirstName` AS `FirstName`, `publicprofileinfo`.`LastName` AS `LastName`, `regionpickup`.`PickupAddress` AS `PickupAddress` FROM ((((`orderinfo` join `orderfoods` on(`orderinfo`.`OrderID` = `orderfoods`.`OrderID`)) join `food` on(`orderfoods`.`FoodID` = `food`.`FoodID`)) join `publicprofileinfo` on(`orderinfo`.`customerID` = `publicprofileinfo`.`UserID`)) join `regionpickup` on(`orderinfo`.`Region` = `regionpickup`.`Region`)) ;

-- --------------------------------------------------------

--
-- Structure for view `history`
--
DROP TABLE IF EXISTS `history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history`  AS SELECT `c`.`UserID` AS `UserID`, `op`.`OrderID` AS `OrderID`, `s`.`UserName` AS `UserName`, `i`.`totalPrice` AS `totalPrice`, `i`.`orderTime` AS `orderTime`, `i`.`pickUpTime` AS `pickUpTime` FROM (((`orderplacement` `op` join `profile` `c`) join `profile` `s`) join `orderinfo` `i`) WHERE `c`.`UserID` = `op`.`CustomerID` AND `s`.`UserID` = `op`.`SellerID` AND `i`.`OrderID` = `op`.`OrderID` ;

-- --------------------------------------------------------

--
-- Structure for view `phistory`
--
DROP TABLE IF EXISTS `phistory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `phistory`  AS SELECT `c`.`UserID` AS `UserID`, `s`.`UserID` AS `SellerID`, `op`.`OrderID` AS `OrderID`, `s`.`UserName` AS `UserName`, `i`.`totalPrice` AS `totalPrice`, `i`.`orderTime` AS `orderTime`, `i`.`pickUpTime` AS `pickUpTime` FROM (((`orderplacement` `op` join `profile` `c`) join `profile` `s`) join `orderinfo` `i`) WHERE `c`.`UserID` = `op`.`CustomerID` AND `s`.`UserID` = `op`.`SellerID` AND `i`.`OrderID` = `op`.`OrderID` ;

-- --------------------------------------------------------

--
-- Structure for view `publicprofileinfo`
--
DROP TABLE IF EXISTS `publicprofileinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `publicprofileinfo`  AS SELECT `profile`.`UserID` AS `UserID`, `profile`.`UserName` AS `UserName`, `profile`.`Region` AS `Region`, `profile`.`FirstName` AS `FirstName`, `profile`.`LastName` AS `LastName`, `profile`.`Img_url` AS `Img_url` FROM `profile` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`FollowerID`,`FolloweeID`) USING BTREE,
  ADD KEY `FolloweeID` (`FolloweeID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodID`) USING BTREE,
  ADD KEY `PUserID` (`PUserID`);

--
-- Indexes for table `foodingredients`
--
ALTER TABLE `foodingredients`
  ADD PRIMARY KEY (`FoodID`,`Ingredients`(50)) USING BTREE;

--
-- Indexes for table `foodtags`
--
ALTER TABLE `foodtags`
  ADD PRIMARY KEY (`FoodID`,`Tags`) USING BTREE;

--
-- Indexes for table `orderfoods`
--
ALTER TABLE `orderfoods`
  ADD PRIMARY KEY (`FoodID`,`OrderID`) USING BTREE,
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD PRIMARY KEY (`OrderID`) USING BTREE,
  ADD KEY `customerID` (`customerID`),
  ADD KEY `sellerID` (`sellerID`),
  ADD KEY `Region` (`Region`) USING BTREE;

--
-- Indexes for table `orderplacement`
--
ALTER TABLE `orderplacement`
  ADD PRIMARY KEY (`OrderID`,`CustomerID`,`SellerID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `regionpickup`
--
ALTER TABLE `regionpickup`
  ADD UNIQUE KEY `Region` (`Region`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`) USING BTREE,
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `CustomerUserID` (`CustomerUserID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `userallergies`
--
ALTER TABLE `userallergies`
  ADD PRIMARY KEY (`UserID`,`Allergies`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10009;

--
-- AUTO_INCREMENT for table `orderinfo`
--
ALTER TABLE `orderinfo`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100017;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20007;

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
-- Constraints for table `foodtags`
--
ALTER TABLE `foodtags`
  ADD CONSTRAINT `foodtags_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`);

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
  ADD CONSTRAINT `orderinfo_ibfk_3` FOREIGN KEY (`Region`) REFERENCES `regionpickup` (`Region`);

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
