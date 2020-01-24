CREATE DATABASE  IF NOT EXISTS `testproject` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `testproject`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: testproject
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seat` (
  `SeatId` int(11) NOT NULL,
  `SeatFlightId` int(11) NOT NULL,
  `Availability` char(1) NOT NULL,
  `ClassId` int(11) NOT NULL,
  PRIMARY KEY (`SeatId`),
  KEY `SeatFlightId_idx` (`SeatFlightId`),
  KEY `SeatClassId_idx` (`ClassId`),
  CONSTRAINT `ClassId` FOREIGN KEY (`ClassId`) REFERENCES `SeatClass` (`SeatClassId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SeatFlightId` FOREIGN KEY (`SeatFlightId`) REFERENCES `Flight` (`FlightId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES (1,1,'Y',1),(2,1,'Y',1),(3,1,'Y',2),(5,1,'Y',1),(6,1,'Y',2),(7,1,'Y',1),(8,1,'y',2),(9,1,'Y',1),(10,1,'Y',2),(11,1,'Y',1),(12,1,'Y',1),(13,2,'Y',1),(14,2,'Y',1),(15,2,'Y',2),(16,2,'Y',1),(17,2,'Y',1),(18,2,'Y',1),(19,2,'Y',2),(20,2,'Y',1),(21,2,'Y',2),(22,2,'Y',1),(23,2,'Y',1);
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 21:01:22
