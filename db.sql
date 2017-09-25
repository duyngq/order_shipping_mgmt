-- MySQL dump 10.13  Distrib 5.5.43, for linux2.6 (x86_64)
--
-- Host: localhost    Database: order_mgmt
-- ------------------------------------------------------
-- Server version	5.5.43-enterprise-commercial-advanced

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(16) CHARACTER SET latin1 NOT NULL,
  `comment` varchar(255) CHARACTER SET latin1 NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comments_orderId` (`order_id`),
  CONSTRAINT `FK_comments_custId` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (53,'05/03/2017 16:53','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Order date</strong> changed from <strong>21/03/2017</strong> to <strong>05/03/2017</strong>.. </em><em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Product description 2</stron',41,'admin'),(54,'05/03/2017 16:53','Test',41,'admin'),(55,'05/03/2017 16:56','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Code</strong> changed from <strong>3d</strong> to <strong>3a</strong>.. </em>',41,'admin'),(61,'09/03/2017 13:00','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Total</strong> changed from <strong>0</strong> to <strong>166</strong>.. </em><em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Order details:</strong> changed to <strong>p_desc',46,'admin'),(63,'09/03/2017 16:04','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Order details:</strong> changed to <strong>p_desc=\'Aqweqweqweqweqweqwe qwe qwe qwe qwe\',weight=1, price_weight=2, unit=3, price_unit=4</strong>.. </em><em><span style=\'color:#FF0000\'>*System ',46,'admin'),(64,'12/04/2017 12:59','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Total</strong> changed from <strong>166</strong> to <strong>264.0000</strong>.. </em><em><span style=\'color:#FF0000\'>*System comment:</span> <strong>Order details:</strong> changed to <strong',46,'admin'),(65,'19/05/2017 13:36','<em><span style=\'color:#FF0000\'>*System comment:</span> <strong>File name</strong> changed from <strong>There was an error uploading your files</strong> to <strong>18552758_1356396237741868_324262625_o.jpg</strong>.. </em><em><span style=\'color:#FF0000\'>*',47,'khoa');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `p_desc` text COLLATE utf8_bin NOT NULL,
  `weight` double NOT NULL,
  `price_weight` double NOT NULL,
  `unit` int(11) NOT NULL,
  `price_unit` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FK_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (3,42,'',2,0,0,0),(6,46,'Aqweqweqweqweqweqwe qwe qwe qwe qwe',1,2,3,4),(7,46,'B',1,2,3,4),(8,46,'C',1,2,3,4),(9,46,'D',1,2,3,4),(10,46,'E',1,2,3,4),(11,46,'F',1,2,3,4),(12,46,'G',1,2,3,4),(13,46,'H',1,2,3,4),(14,46,'I',1,2,3,4),(15,46,'J',50,2,3,4),(16,46,'K',1,2,3,4),(17,47,'A',1,2,3,4),(18,47,'C',5,6,8,9),(19,47,'',0,0,0,0),(20,47,'',0,0,0,0),(21,47,'',0,0,0,0),(22,47,'',0,0,0,0),(23,47,'',0,0,0,0),(24,47,'',0,0,0,0),(25,47,'',0,0,0,0),(26,47,'',0,0,0,0),(27,47,'',0,0,0,0),(28,48,'A',1,2,3,4),(29,48,'C',2,4,5,6),(30,48,'',0,0,0,0),(31,48,'',0,0,0,0),(32,48,'',0,0,0,0),(33,48,'',0,0,0,0),(34,48,'',0,0,0,0),(35,48,'',0,0,0,0),(36,48,'',0,0,0,0),(37,48,'',0,0,0,0),(38,48,'',0,0,0,0);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_cust_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `desc_0` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight` double NOT NULL,
  `price_per_weight` double NOT NULL,
  `weight` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `recv_cust_id` int(10) unsigned NOT NULL,
  `desc_1` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight_1` double NOT NULL,
  `price_per_weight_1` double NOT NULL,
  `desc_2` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight_2` double NOT NULL,
  `price_per_weight_2` double NOT NULL,
  `desc_3` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight_3` double NOT NULL,
  `price_per_weight_3` double NOT NULL,
  `desc_4` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight_4` double NOT NULL,
  `price_per_weight_4` double NOT NULL,
  `desc_5` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `total_weight_5` double NOT NULL,
  `price_per_weight_5` double NOT NULL,
  `code` varchar(5) NOT NULL,
  `fee` double NOT NULL,
  `product_desc` longtext NOT NULL,
  `additional_fee` longtext NOT NULL,
  `new_type` tinyint(1) NOT NULL,
  `file_name` mediumtext,
  PRIMARY KEY (`id`),
  KEY `FK_orders_userId` (`user_id`),
  KEY `FK_orders_custid` (`send_cust_id`),
  KEY `recv_cust_id` (`recv_cust_id`),
  CONSTRAINT `FK_cust` FOREIGN KEY (`send_cust_id`) REFERENCES `sendcustomers` (`id`),
  CONSTRAINT `FK_customers_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_recvCust` FOREIGN KEY (`recv_cust_id`) REFERENCES `recvcustomers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (41,7,1,0,'2017-03-05','A',1,2,NULL,30,10,'B',2,3,'C',2,3,'',0,0,'',0,0,'',0,0,'3a',16,'sadasd\r\nsad sa\r\nDuy','',0,NULL),(42,7,1,0,'2017-03-05','A',1,7,NULL,8,10,'',0,0,'',0,0,'',0,0,'',0,0,'',0,0,'1a',1,'Hansha aha s sua\r\n','',0,NULL),(46,7,1,0,'2017-03-07','',0,0,NULL,264,10,'',0,0,'',0,0,'',0,0,'',0,0,'',0,0,'3b',12,'1\r\n2\r\n3\r\n4\r\n56\r\n7\r\n\r\n89\r\n87\r\n5\r\n3\r\n453\r\n21','',1,NULL),(47,7,5,0,'2017-05-19','',0,0,6,120,10,'',0,0,'',0,0,'',0,0,'',0,0,'',0,0,'5c',4,'tdr','',1,'18552758_1356396237741868_324262625_o.jpg'),(48,7,1,0,'2017-05-19','',0,0,3,53,10,'',0,0,'',0,0,'',0,0,'',0,0,'',0,0,'5c',1,'ewr','',1,'MsXQ==/18552758_1356396237741868_324262625_o.jpg,1cP/18552758_1356396237741868_324262625_o.jpg,1oK/18552758_1356396237741868_324262625_o.jpg,h1Q/18552758_1356396237741868_324262625_o.jpg');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recvcustomers`
--

DROP TABLE IF EXISTS `recvcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recvcustomers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recvcustomers`
--

LOCK TABLES `recvcustomers` WRITE;
/*!40000 ALTER TABLE `recvcustomers` DISABLE KEYS */;
INSERT INTO `recvcustomers` VALUES (10,'ThuyNguyenThi','097969149922','Bui Dinh Tuy');
/*!40000 ALTER TABLE `recvcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','the highest privilege'),(2,'user','just able to see the data');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendcustomers`
--

DROP TABLE IF EXISTS `sendcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendcustomers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendcustomers`
--

LOCK TABLES `sendcustomers` WRITE;
/*!40000 ALTER TABLE `sendcustomers` DISABLE KEYS */;
INSERT INTO `sendcustomers` VALUES (7,'DuyNguyenQuoc','098962175612','Bui Dinh Tuy');
/*!40000 ALTER TABLE `sendcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `FK_userroles_userId` (`user_id`),
  KEY `FK_userroles_roleId` (`role_id`),
  CONSTRAINT `FK_userroles_roleId` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_userroles_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (1,1,1);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  `date_last_entered` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$NzEJDTu0tYZnawVFqGvPv.nd.7k2w2b5AS3OPS/GSDh1I.ZgECF4W',1,'01/09/2017 01:39'),(5,'khoa','$2y$10$xaxBADES/DDDFk2xIv86BuQuAveQUyOB7dm4tJjje5IJq2zZkecC2',1,'19/05/2017 13:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 13:33:31
