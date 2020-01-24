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
-- Table structure for table `Airplanes`
--

DROP TABLE IF EXISTS `Airplanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airplanes` (
  `AirplaneId` int(11) NOT NULL,
  `AirplaneManufacturerId` int(11) NOT NULL,
  `AirplaneModelId` int(11) NOT NULL,
  `AirplaneAirlinerId` int(11) NOT NULL,
  PRIMARY KEY (`AirplaneId`),
  KEY `ManufacturerId_idx` (`AirplaneManufacturerId`),
  KEY `ModelId_idx` (`AirplaneModelId`),
  KEY `AirlinerId_idx` (`AirplaneAirlinerId`),
  CONSTRAINT `AirplaneAirlinerId` FOREIGN KEY (`AirplaneAirlinerId`) REFERENCES `Airliner` (`AirlinerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `AirplaneManufacturerId` FOREIGN KEY (`AirplaneManufacturerId`) REFERENCES `Manufacturer` (`ManufacturerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `AirplaneModelId` FOREIGN KEY (`AirplaneModelId`) REFERENCES `Model` (`ModelId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airplanes`
--

LOCK TABLES `Airplanes` WRITE;
/*!40000 ALTER TABLE `Airplanes` DISABLE KEYS */;
INSERT INTO `Airplanes` VALUES (1,1,1,1),(2,2,3,4),(3,1,2,2),(4,4,5,4),(5,2,3,1),(6,2,3,2),(7,5,6,3),(8,4,5,4),(9,1,2,4),(10,3,4,5),(11,2,3,3);
/*!40000 ALTER TABLE `Airplanes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 21:01:21
