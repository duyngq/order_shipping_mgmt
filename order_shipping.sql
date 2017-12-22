-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2017 at 08:46 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `id4078479_order_shipping`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(16) CHARACTER SET latin1 NOT NULL,
  `comment` varchar(255) CHARACTER SET latin1 NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comments_orderId` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `date`, `comment`, `order_id`, `user_name`) VALUES
(53, '05/03/2017 16:53', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>Order date</strong> changed from <strong>21/03/2017</strong> to <strong>05/03/2017</strong>.. </em><em><span style=''color:#FF0000''>*System comment:</span> <strong>Product description 2</stron', 41, 'admin'),
(54, '05/03/2017 16:53', 'Test', 41, 'admin'),
(55, '05/03/2017 16:56', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>Code</strong> changed from <strong>3d</strong> to <strong>3a</strong>.. </em>', 41, 'admin'),
(61, '09/03/2017 13:00', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>Total</strong> changed from <strong>0</strong> to <strong>166</strong>.. </em><em><span style=''color:#FF0000''>*System comment:</span> <strong>Order details:</strong> changed to <strong>p_desc', 46, 'admin'),
(63, '09/03/2017 16:04', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>Order details:</strong> changed to <strong>p_desc=''Aqweqweqweqweqweqwe qwe qwe qwe qwe'',weight=1, price_weight=2, unit=3, price_unit=4</strong>.. </em><em><span style=''color:#FF0000''>*System ', 46, 'admin'),
(64, '12/04/2017 12:59', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>Total</strong> changed from <strong>166</strong> to <strong>264.0000</strong>.. </em><em><span style=''color:#FF0000''>*System comment:</span> <strong>Order details:</strong> changed to <strong', 46, 'admin'),
(65, '19/05/2017 13:36', '<em><span style=''color:#FF0000''>*System comment:</span> <strong>File name</strong> changed from <strong>There was an error uploading your files</strong> to <strong>18552758_1356396237741868_324262625_o.jpg</strong>.. </em><em><span style=''color:#FF0000''>*', 47, 'khoa');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `p_desc` text COLLATE utf8_bin NOT NULL,
  `weight` double NOT NULL,
  `unit` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=56 ;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `p_desc`, `weight`, `unit`, `price`, `total`) VALUES
(3, 42, '', 2, 0, 0, 0),
(6, 46, 'Aqweqweqweqweqweqwe qwe qwe qwe qwe', 1, 3, 2, 4),
(7, 46, 'B', 1, 3, 2, 4),
(8, 46, 'C', 1, 3, 2, 4),
(9, 46, 'D', 1, 3, 2, 4),
(10, 46, 'E', 1, 3, 2, 4),
(11, 46, 'F', 1, 3, 2, 4),
(12, 46, 'G', 1, 3, 2, 4),
(13, 46, 'H', 1, 3, 2, 4),
(14, 46, 'I', 1, 3, 2, 4),
(15, 46, 'J', 50, 3, 2, 4),
(16, 46, 'K', 1, 3, 2, 4),
(17, 47, 'A', 1, 3, 2, 4),
(18, 47, 'C', 5, 8, 6, 9),
(19, 47, '', 0, 0, 0, 0),
(20, 47, '', 0, 0, 0, 0),
(21, 47, '', 0, 0, 0, 0),
(22, 47, '', 0, 0, 0, 0),
(23, 47, '', 0, 0, 0, 0),
(24, 47, '', 0, 0, 0, 0),
(25, 47, '', 0, 0, 0, 0),
(26, 47, '', 0, 0, 0, 0),
(27, 47, '', 0, 0, 0, 0),
(28, 48, 'A', 1, 3, 2, 4),
(29, 48, 'C', 2, 5, 4, 6),
(30, 48, '', 0, 0, 0, 0),
(31, 48, '', 0, 0, 0, 0),
(32, 48, '', 0, 0, 0, 0),
(33, 48, '', 0, 0, 0, 0),
(34, 48, '', 0, 0, 0, 0),
(35, 48, '', 0, 0, 0, 0),
(36, 48, '', 0, 0, 0, 0),
(37, 48, '', 0, 0, 0, 0),
(38, 48, '', 0, 0, 0, 0),
(39, 68, '1', 2, 3, 0, 6),
(40, 68, '4', 0, 6, 5, 30),
(41, 69, '1', 2, 3, 0, 6),
(42, 69, '4', 0, 6, 5, 30),
(51, 73, '5', 2, 3, 0, 6),
(52, 73, '2', 3, 0, 5, 15),
(55, 70, '5', 5, 0, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `send_cust_id` int(10) unsigned NOT NULL,
  `recv_cust_id` int(10) unsigned NOT NULL,
  `code` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `weight` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fee` double NOT NULL,
  `product_desc` longtext NOT NULL,
  `additional_fee` longtext NOT NULL,
  `file_name` mediumtext,
  PRIMARY KEY (`id`),
  KEY `FK_orders_userId` (`user_id`),
  KEY `FK_orders_custid` (`send_cust_id`),
  KEY `recv_cust_id` (`recv_cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `send_cust_id`, `recv_cust_id`, `code`, `status`, `date`, `weight`, `total`, `fee`, `product_desc`, `additional_fee`, `file_name`) VALUES
(41, 1, 7, 10, '3a', 0, '2017-03-05', NULL, 30, 16, 'sadasd\r\nsad sa\r\nDuy', '', NULL),
(42, 1, 7, 10, '1a', 0, '2017-03-05', NULL, 8, 1, 'Hansha aha s sua\r\n', '', NULL),
(46, 1, 7, 10, '3b', 0, '2017-03-07', NULL, 264, 12, '1\r\n2\r\n3\r\n4\r\n56\r\n7\r\n\r\n89\r\n87\r\n5\r\n3\r\n453\r\n21', '', NULL),
(47, 5, 7, 10, '5c', 0, '2017-05-19', 6, 120, 4, 'tdr', '', '18552758_1356396237741868_324262625_o.jpg'),
(48, 1, 7, 10, '5c', 0, '2017-05-19', 3, 53, 1, 'ewr', '', 'MsXQ==/18552758_1356396237741868_324262625_o.jpg,1cP/18552758_1356396237741868_324262625_o.jpg,1oK/18552758_1356396237741868_324262625_o.jpg,h1Q/18552758_1356396237741868_324262625_o.jpg'),
(68, 1, 7, 10, 'test', 0, '2017-10-27', 2, 36, 0, 'teswtset', '', ''),
(69, 1, 7, 10, 'test', 0, '2017-10-27', 2, 36, 0, 'rtewtew', '', ''),
(70, 1, 7, 10, '', 0, '2017-11-26', 5, 5, 0, 'test', '', ''),
(73, 1, 7, 10, '', 1, '2017-11-27', 5, 21, 0, 'teest', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `recvcustomers`
--

CREATE TABLE IF NOT EXISTS `recvcustomers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Dumping data for table `recvcustomers`
--

INSERT INTO `recvcustomers` (`id`, `cust_name`, `phone`, `address`) VALUES
(10, 'ThuyNguyenThi', '097969149922', 'Bui Dinh Tuy'),
(13, '1', '2', '3'),
(15, '234', '234234', '23423423'),
(16, '23', '45', '345345');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `description`) VALUES
(1, 'admin', 'the highest privilege'),
(2, 'user', 'just able to see the data');

-- --------------------------------------------------------

--
-- Table structure for table `sendcustomers`
--

CREATE TABLE IF NOT EXISTS `sendcustomers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sendcustomers`
--

INSERT INTO `sendcustomers` (`id`, `cust_name`, `phone`, `address`) VALUES
(7, 'DuyNguyenQuoc', '098962175612', 'Bui Dinh Tuy123');

-- --------------------------------------------------------

--
-- Table structure for table `shippingdetails`
--

CREATE TABLE IF NOT EXISTS `shippingdetails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `shipping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipping_idx` (`shipping_id`),
  KEY `fk_order_idx` (`order_id`),
  KEY `fk_order_shipping_idx` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `shippingdetails`
--

INSERT INTO `shippingdetails` (`id`, `order_id`, `shipping_id`) VALUES
(7, 46, 4),
(8, 47, 4),
(9, 69, 5),
(10, 68, 5),
(63, 48, 3),
(64, 46, 3),
(65, 69, 3),
(66, 47, 3),
(67, 41, 3),
(68, 41, 6),
(69, 47, 6),
(70, 48, 6),
(71, 68, 6),
(72, 69, 6),
(73, 41, 7),
(74, 46, 7),
(75, 47, 7),
(76, 47, 8),
(77, 48, 8),
(80, 69, 9),
(81, 68, 9),
(82, 48, 9),
(83, 47, 9),
(84, 46, 9),
(85, 42, 9),
(86, 41, 9);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE IF NOT EXISTS `shippings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(16) DEFAULT NULL,
  `mawb` varchar(50) DEFAULT NULL,
  `hawb` varchar(50) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `date`, `mawb`, `hawb`, `pieces`, `weight`, `amount`) VALUES
(3, '23/11/2017', '568', '5', 50, 150, 547),
(4, '23/11/2017', '12', '32', 54, 65, 0),
(5, '23/11/2017', '12', '32', 54, 65, 0),
(6, '23/11/2017', '213', '45', 245, 13, NULL),
(7, '23/11/2017', '213', '45', 245, 6, 414),
(8, '23/11/2017', '0.', '354', 213, 9, 173),
(9, '23/11/2017', '568', '5', 50, 13, 44);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE IF NOT EXISTS `userroles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `FK_userroles_userId` (`user_id`),
  KEY `FK_userroles_roleId` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  `date_last_entered` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `enabled`, `date_last_entered`) VALUES
(1, 'admin', '$2y$10$NzEJDTu0tYZnawVFqGvPv.nd.7k2w2b5AS3OPS/GSDh1I.ZgECF4W', 1, '25/09/2017 18:13'),
(5, 'khoa', '$2y$10$xaxBADES/DDDFk2xIv86BuQuAveQUyOB7dm4tJjje5IJq2zZkecC2', 1, '19/05/2017 13:49');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_comments_custId` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_cust` FOREIGN KEY (`send_cust_id`) REFERENCES `sendcustomers` (`id`),
  ADD CONSTRAINT `FK_customers_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_recvCust` FOREIGN KEY (`recv_cust_id`) REFERENCES `recvcustomers` (`id`);

--
-- Constraints for table `shippingdetails`
--
ALTER TABLE `shippingdetails`
  ADD CONSTRAINT `fk_order_shipping` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_shipping` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `FK_userroles_roleId` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FK_userroles_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
