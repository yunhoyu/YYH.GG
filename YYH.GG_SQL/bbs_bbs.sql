-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bbs` (
  `bbsID` int NOT NULL,
  `bbsTitle` varchar(50) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(2048) DEFAULT NULL,
  `bbsAvailable` int DEFAULT NULL,
  `user_nick` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` VALUES (1,'1','dbdbsgh','2022-11-09 11:36:33','1',1,'1'),(2,'이걸로 일단은 버텨 ','dbdbsgh','2022-11-09 11:36:43','후..\r\n',1,'후..\r\n'),(3,'???','dbdbsgh','2022-11-09 11:37:17','???',1,'???'),(4,'자 어떰','dbdbsgh','2022-11-09 11:40:27','되나?',1,'2022-11-09 11:40:27'),(5,'1','dbdbsgh','2022-11-09 11:41:21','1',1,'2022-11-09 11:41:21'),(6,'시험2','dbdbsgh','2022-11-16 06:03:06','2\r\n',1,'2022-11-16 06:03:06'),(7,'dlfjs rmf','dbdbsgh','2022-11-16 07:04:48','asds',1,'2022-11-16 07:04:48'),(8,'테스트 12','dbdbsgh','2022-11-16 12:29:15','12',1,'2022-11-16 12:29:15'),(9,'222','dbdbsgh','2022-11-16 14:21:06','223\r\n',0,'2022-11-16 14:21:06'),(10,'123','dbdbsgh','2022-11-16 14:21:34','123123',1,'2022-11-16 14:21:34'),(11,'12341234','dbdbsgh','2022-11-16 14:24:07','123123',1,'2022-11-16 14:24:07'),(12,'111','dbdbsgh','2022-11-23 12:18:55','222',0,'2022-11-23 12:18:55'),(13,'11','dbdbsgh','2022-11-23 13:23:29','wdwd',0,'2022-11-23 13:23:29');
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28  6:54:34
