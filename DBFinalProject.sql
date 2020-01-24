-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
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
-- Table structure for table `Airliner`
--

DROP TABLE IF EXISTS `Airliner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airliner` (
  `AirlinerId` int(11) NOT NULL,
  `AirlinerName` varchar(45) NOT NULL,
  PRIMARY KEY (`AirlinerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airliner`
--

LOCK TABLES `Airliner` WRITE;
/*!40000 ALTER TABLE `Airliner` DISABLE KEYS */;
INSERT INTO `Airliner` VALUES (1,'Air India'),(2,'Emirates'),(3,'Lufthansa'),(4,'Qatar'),(5,'Etihad');
/*!40000 ALTER TABLE `Airliner` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport` (
  `AirportId` int(11) NOT NULL,
  `AirportName` varchar(45) NOT NULL,
  `CityId` int(11) NOT NULL,
  PRIMARY KEY (`AirportId`),
  UNIQUE KEY `CityId_UNIQUE` (`CityId`),
  KEY `CityId_idx` (`CityId`),
  CONSTRAINT `CityId` FOREIGN KEY (`CityId`) REFERENCES `City` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES (1,'Boston Logan',1),(2,'CSI',2),(3,'JFK',3),(5,'PNQ',5),(6,'Chicago O hare',6),(7,'SA',7),(8,'DIA',8),(9,'WDCA',9),(10,'HHA',10),(11,'TIA',11),(12,'AGIA',12),(13,'RDIA',13),(14,'TIA',14),(15,'DPIA',15),(16,'DTW',16),(17,'TA',17),(18,'KGIA',18);
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `CityId` int(11) NOT NULL,
  `CityName` varchar(45) NOT NULL,
  PRIMARY KEY (`CityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Boston'),(2,'Mumbai'),(3,'New york'),(5,'Pune'),(6,'Chicago'),(7,'Seattle'),(8,'Delhi'),(9,'Washington'),(10,'Houston'),(11,'Tulsa'),(12,'Austin'),(13,'Charlotte'),(14,'Tucson'),(15,'Denver'),(16,'Detroit'),(17,'Tampa'),(18,'Knoxville');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` int(11) NOT NULL,
  `RewardPoints` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Suresh','Kumar',22,'200'),(2,'John','Mathew',27,'150'),(3,'Ram','Sharma',34,'100'),(4,'Mihir','Patil',25,'200'),(5,'Rahul','Chandra',26,'100'),(6,'Pratik','Patre',26,'100'),(7,'j','k',70,'99');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Destination` (
  `DestinationId` int(11) NOT NULL,
  `DestinationName` varchar(45) NOT NULL,
  `DestinationAirportId` int(11) NOT NULL,
  PRIMARY KEY (`DestinationId`,`DestinationAirportId`),
  KEY `DestinationAirportId_idx` (`DestinationAirportId`),
  CONSTRAINT `DestinationAirportId` FOREIGN KEY (`DestinationAirportId`) REFERENCES `Airport` (`AirportId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
INSERT INTO `Destination` VALUES (1,'Boston',1),(2,'Mumbai',2),(3,'New York',3),(5,'Pune',5),(6,'Chicago',6),(7,'Seattle',7),(8,'Delhi',8),(9,'Washington',9),(10,'Houston',10),(11,'Tulsa',11),(12,'Austin',12),(13,'Charlotte',13),(14,'Tucson',14),(15,'Denver',15),(16,'Detroit',16),(17,'Tampa',17),(18,'Knoxville',18);
/*!40000 ALTER TABLE `Destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight` (
  `FlightId` int(11) NOT NULL,
  `FlightAirplaneId` int(11) NOT NULL,
  `FlightAirlinerId` int(11) NOT NULL,
  `FlightSourceId` int(11) NOT NULL,
  `FlightDestinationId` int(11) NOT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `DateAndTime` datetime DEFAULT NULL,
  `FlightDuration` int(11) DEFAULT NULL,
  PRIMARY KEY (`FlightId`),
  KEY `FlightAirlinerId_idx` (`FlightAirlinerId`),
  KEY `FlightAirplaneId_idx` (`FlightAirplaneId`),
  KEY `FlightSourceId_idx` (`FlightSourceId`),
  KEY `FlightDestinationId_idx` (`FlightDestinationId`),
  CONSTRAINT `FlightAirlinerId` FOREIGN KEY (`FlightAirlinerId`) REFERENCES `Airliner` (`AirlinerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FlightAirplaneId` FOREIGN KEY (`FlightAirplaneId`) REFERENCES `Airplanes` (`AirplaneId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FlightDestinationId` FOREIGN KEY (`FlightDestinationId`) REFERENCES `Destination` (`DestinationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FlightSourceId` FOREIGN KEY (`FlightSourceId`) REFERENCES `Source` (`SourceId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES (1,1,1,1,2,'scheduled','2017-12-20 20:00:00',10),(2,2,4,14,7,'scheduled','2017-12-18 19:00:00',2),(3,9,4,2,3,'scheduled','2017-12-29 12:00:00',4),(4,7,3,5,6,'scheduled','2017-12-18 19:00:00',6),(5,11,3,9,10,'scheduled','2017-12-15 05:00:00',15),(6,5,1,3,6,'scheduled','2017-12-26 03:30:00',3),(7,4,4,1,10,'scheduled','2017-12-15 05:00:00',6),(8,8,4,6,8,'scheduled','2017-12-18 19:00:00',9),(9,9,4,11,3,'scheduled','2017-12-15 05:00:00',12);
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger GiveRewardPoints
after 
update on
flight
for each row
begin
if new.status = 'landed'
then

update customer set rewardpoints = rewardpoints+100 where customerid in(select t.ticketCustomerId from seat s inner join ticket t on s.seatid = t.ticketSeatId where s.seatflightid=new.flightid);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `FlightStaff`
--

DROP TABLE IF EXISTS `FlightStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightStaff` (
  `StaffId` int(11) NOT NULL,
  `StaffName` varchar(45) NOT NULL,
  `StaffFlightId` int(11) NOT NULL,
  PRIMARY KEY (`StaffId`),
  KEY `StaffFlightId_idx` (`StaffFlightId`),
  CONSTRAINT `StaffFlightId` FOREIGN KEY (`StaffFlightId`) REFERENCES `Flight` (`FlightId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightStaff`
--

LOCK TABLES `FlightStaff` WRITE;
/*!40000 ALTER TABLE `FlightStaff` DISABLE KEYS */;
INSERT INTO `FlightStaff` VALUES (2,'George',1),(3,'James',1),(4,'Ram',2),(5,'Jayram',3),(6,'Rob',3),(7,'Sam',4),(8,'Jayden',1),(9,'Pooja',1);
/*!40000 ALTER TABLE `FlightStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manufacturer` (
  `ManufacturerId` int(11) NOT NULL,
  `ManufacturerName` varchar(45) NOT NULL,
  PRIMARY KEY (`ManufacturerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
INSERT INTO `Manufacturer` VALUES (1,'Boeing'),(2,'Airbus'),(3,'Bombardier'),(4,'Embraer'),(5,'Tupolev');
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Model` (
  `ModelId` int(11) NOT NULL,
  `ModelName` varchar(45) NOT NULL,
  `ManufacturerId` int(11) NOT NULL,
  PRIMARY KEY (`ModelId`),
  KEY `ManufacturerId_idx` (`ManufacturerId`),
  CONSTRAINT `ManufacturerId` FOREIGN KEY (`ManufacturerId`) REFERENCES `Manufacturer` (`ManufacturerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Model`
--

LOCK TABLES `Model` WRITE;
/*!40000 ALTER TABLE `Model` DISABLE KEYS */;
INSERT INTO `Model` VALUES (1,'747',1),(2,'737',1),(3,'A380',2),(4,'415MP',3),(5,'EMB120',4),(6,'Tu2',5);
/*!40000 ALTER TABLE `Model` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `SeatClass`
--

DROP TABLE IF EXISTS `SeatClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeatClass` (
  `SeatClassId` int(11) NOT NULL,
  `SeatClassType` varchar(45) NOT NULL,
  `SeatClassPrice` int(11) NOT NULL,
  PRIMARY KEY (`SeatClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeatClass`
--

LOCK TABLES `SeatClass` WRITE;
/*!40000 ALTER TABLE `SeatClass` DISABLE KEYS */;
INSERT INTO `SeatClass` VALUES (1,'Economic',800),(2,'Business',1000);
/*!40000 ALTER TABLE `SeatClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Source`
--

DROP TABLE IF EXISTS `Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Source` (
  `SourceId` int(11) NOT NULL,
  `SourceName` varchar(45) NOT NULL,
  `SourceAirportId` int(11) NOT NULL,
  PRIMARY KEY (`SourceId`,`SourceAirportId`),
  KEY `AirportId_idx` (`SourceAirportId`),
  CONSTRAINT `SourceAirportId` FOREIGN KEY (`SourceAirportId`) REFERENCES `Airport` (`AirportId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Source`
--

LOCK TABLES `Source` WRITE;
/*!40000 ALTER TABLE `Source` DISABLE KEYS */;
INSERT INTO `Source` VALUES (1,'Boston',1),(2,'Mumbai',2),(3,'New York',3),(5,'Pune',5),(6,'Chicago',6),(7,'Seattle',7),(8,'Delhi',8),(9,'Washington',9),(10,'Houston',10),(11,'Tulsa',11),(12,'Austin',12),(13,'Charlotte',13),(14,'Tucson',14),(15,'Denver',15),(16,'Detroit',16),(17,'Tampa',17),(18,'Knoxville',18);
/*!40000 ALTER TABLE `Source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `TicketId` int(11) NOT NULL AUTO_INCREMENT,
  `TicketCustomerId` int(11) NOT NULL,
  `TicketSeatId` int(11) NOT NULL,
  `CustomerName` varchar(30) DEFAULT NULL,
  `PricePaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `TicketCustomerId_idx` (`TicketCustomerId`),
  KEY `TicketSeatId_idx` (`TicketSeatId`),
  CONSTRAINT `TicketCustomerId` FOREIGN KEY (`TicketCustomerId`) REFERENCES `Customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TicketSeatId` FOREIGN KEY (`TicketSeatId`) REFERENCES `Seat` (`SeatId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger DeleteBookedSeats
after insert 
on Ticket
for each row
begin
update seat 
set availability = 'N'
where seatId = new.ticketSeatId;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `displayscheduledata`
--

DROP TABLE IF EXISTS `displayscheduledata`;
/*!50001 DROP VIEW IF EXISTS `displayscheduledata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `displayscheduledata` AS SELECT 
 1 AS `flightId`,
 1 AS `AirlinerName`,
 1 AS `SourceName`,
 1 AS `DestinationName`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'testproject'
--
/*!50003 DROP FUNCTION IF EXISTS `getTraffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTraffic`(s varchar(20)) RETURNS int(11)
    DETERMINISTIC
begin
declare value int;
set value = (select count(*) from flight where FlightSourceId = (Select SourceId from Source where SourceName = s) || FlightDestinationId = (Select DestinationId from Destination where DestinationName = s));
return value;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookTicket`(IN bookingSeatId int, IN passengerId int)
begin 
start transaction;
set transaction isolation level serializable;
insert into ticket(TicketCustomerId ,TicketSeatId) values (passengerId, BookingSeatId);



update ticket
set CustomerName = (Select concat(FirstName,' ' ,LastName) as Name from Customer where customerId = passengerId)
where TicketSeatId = bookingSeatId;

update ticket 
set pricePaid = (select seatclassPrice from seatclass where SeatClassId = (Select classId from seat where seatId = bookingSeatId)) - ( select rewardpoints from customer where customerId = passengerId)
where ticketSeatId = bookingSeatid;

update customer
set rewardpoints = 0
where customerId = passengerId;

commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkAvailableSeats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkAvailableSeats`(IN BookingFlightId int)
begin
select seatId,seatFlightId, Availability, SeatClassType,SeatClassPrice from seat inner join seatclass on seat.classId = seatclass.seatClassId where seatflightId = (select flightid from flight where flightId = BookingFlightId) order by seatId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getItinerary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getItinerary`(IN CustomerNo int)
begin
select f.flightId, ticketId,s.seatId, CustomerName ,  SourceName, DestinationName,PricePaid, f.status, f.DateAndTime,f.flightduration,a.airlinerName
from 
ticket t inner join seat s on t.ticketSeatId = s.SeatId 
inner join flight f on s.seatFlightId = f.flightId
inner join Airliner a on f.FlightAirlinerId = a.AirlinerId
inner join Source sou on f.FlightSourceId = sou.SourceId 
inner join Destination d on f.flightDestinationId = d.DestinationId 
inner join customer c on t.TicketCustomerId = c.CustomerId 
where c.customerId = customerNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateAirliners` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateAirliners`()
Begin
insert into Airliner values(1,'Air India');
insert into Airliner values(2,'Emirates');
insert into Airliner values(3,'Lufthansa');
insert into Airliner values(4,'Qatar');
insert into Airliner values(5,'Etihad');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateAirplanes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateAirplanes`()
Begin
insert into Airplanes values(1,1,1,1);
insert into Airplanes values(2,2,3,4);
insert into Airplanes values(3,1,2,2);
insert into Airplanes values(4,4,5,4);
insert into Airplanes values(5,2,3,1);
insert into Airplanes values(6,2,3,2);
insert into Airplanes values(7,5,6,3);
insert into Airplanes values(8,4,5,4);
insert into Airplanes values(9,1,2,4);
insert into Airplanes values(10,3,4,5);
insert into Airplanes values(11,2,3,3);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateAirport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateAirport`()
Begin
insert into Airport values(1,'Boston Logan',1);
insert into Airport values(2,'CSI', 2);
insert into Airport values(3,'JFK', 3);
insert into Airport values(5,'PNQ',5);
insert into Airport values(6,'Chicago O hare', 6);
insert into Airport values(7,'SA',7);
insert into Airport values(8,'DIA',8);
insert into Airport values(9,'WDCA',9);
insert into Airport values(10,'HHA',10);
insert into Airport values(11,'TIA',11);
insert into Airport values(12,'AGIA',12);
insert into Airport values(13,'RDIA',13);
insert into Airport values(14,'TIA',14);
insert into Airport values(15,'DPIA',15);
insert into Airport values(16,'DTW',16);
insert into Airport values(17,'TA',17);
insert into Airport values(18,'KGIA',18);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateCities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateCities`()
Begin
insert into City values(1,'Boston');
insert into City values(2,'Mumbai');
insert into City values(3,'New york');
insert into City values(5,'Pune');
insert into City values(6,'Chicago');
insert into City values(7,'Seattle');
insert into City values(8,'Delhi');
insert into City values(9,'Washington');
insert into City values(10,'Houston');
insert into City values(11,'Texas');
insert into City values(12,'Austin');
insert into City values(13,'Charlotte');
insert into City values(14,'Tucson');
insert into City values(15,'Denver');
insert into City values(16,'Detroit');
insert into City values(17,'Tampa');
insert into City values(18,'Knoxville');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateCustomer`()
BEGIN
insert into customer values (1,'Suresh', 'Kumar', 22,100);
insert into customer values (2,'John', 'Mathew', 27,190);
insert into customer values (3,'Ram', 'Sharma', 34,300);
insert into customer values (4,'Mihir', 'Patil', 25,200);
insert into customer values (5,'Rahul', 'Chandra', 26,150);
insert into customer values (6,'Pratik', 'Patre', 26,100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateDestination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateDestination`()
Begin
insert into Destination values(1,'Boston',1);
insert into Destination values(2,'Mumbai', 2);
insert into Destination values(3,'New York',3);
insert into Destination values(5,'Pune',5);
insert into Destination values(6,'Chicago', 6);
insert into Destination values(7,'Seattle',7);
insert into Destination values(8,'Delhi',8);
insert into Destination values(9,'Washington',9);
insert into Destination values(10,'Houston',10);
insert into Destination values(11,'Tulsa',11);
insert into Destination values(12,'Austin',12);
insert into Destination values(13,'Charlotte',13);
insert into Destination values(14,'Tucson',14);
insert into Destination values(15,'Denver',15);
insert into Destination values(16,'Detroit',16);
insert into Destination values(17,'Tampa',17);
insert into Destination values(18,'Knoxville',18);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateFlights`()
insert into flight values(1,1,1,1,2) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateFlightStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateFlightStaff`()
insert into flightstaff values(1,'Jessica',1) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateManufacturers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateManufacturers`()
Begin
insert into Manufacturer values(1,'Boeing');
insert into Manufacturer values(2,'Airbus');
insert into Manufacturer values(3,'Bombardier');
insert into Manufacturer values(5,'Embraer');
insert into Manufacturer values(6,'Tupolev');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateModels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateModels`()
Begin
insert into Model values(1,'747',1);
insert into Model values(2,'737',1);
insert into Model values(3,'A380',2);
insert into Model values(4,'415MP',3);
insert into Model values(5,'EMB120',4);
insert into Model values(6,'Tu2',5);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateSeats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateSeats`()
insert into seat values(1,1) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `populateSource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populateSource`()
Begin
insert into Source values(1,'Boston',1);
insert into Source values(2,'Mumbai', 2);
insert into Source values(3,'New York',3);
insert into Source values(5,'Pune',5);
insert into Source values(6,'Chicago', 6);
insert into Source values(7,'Seattle',7);
insert into Source values(8,'Delhi',8);
insert into Source values(9,'Washington',9);
insert into Source values(10,'Houston',10);
insert into Source values(11,'Tulsa',11);
insert into Source values(12,'Austin',12);
insert into Source values(13,'Charlotte',13);
insert into Source values(14,'Tucson',14);
insert into Source values(15,'Denver',15);
insert into Source values(16,'Detroit',16);
insert into Source values(17,'Tampa',17);
insert into Source values(18,'Knoxville',18);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchFlights`(IN CustomerSource varchar(20), IN Customerdestination varchar(20))
begin
select f.flightId, a.AirlinerName, f.status, f.DateAndTime, S.SourceName, d.DestinationName, f.flightDuration from flight f inner join Source s on f.FlightSourceId = s.SourceId inner join Destination d on f.FlightDestinationId= d.DestinationId inner join Airliner a on a.AirlinerId = f. flightAirlinerId where s.SourceName = CustomerSource && d.DestinationName = CustomerDestination;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `timelapse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `timelapse`(IN flightNo int, IN hour int)
begin
declare var datetime;
declare var1 datetime;
declare var3 int;
declare var4 datetime;
declare var5 datetime;
set var5= (select dateAndtime from flight where flightId = flightNo);
set var3 = (select flightDuration from flight where flightId = flightNo);
set var4 = (select addtime(@var5, concat(var3, ':00:00')));
set var1 =( select addtime(@var5, concat(hour,':00:00')));
select var5, var4, var3, var1;
update flight 
set status = 'landed'
where var4- var1 = 0 && flightId = flightNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `displayscheduledata`
--

/*!50001 DROP VIEW IF EXISTS `displayscheduledata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `displayscheduledata` AS select `f`.`FlightId` AS `flightId`,`a`.`AirlinerName` AS `AirlinerName`,`s`.`SourceName` AS `SourceName`,`d`.`DestinationName` AS `DestinationName`,`f`.`Status` AS `status` from (((`flight` `f` join `airliner` `a` on((`f`.`FlightAirlinerId` = `a`.`AirlinerId`))) join `source` `s` on((`f`.`FlightSourceId` = `s`.`SourceId`))) join `destination` `d` on((`f`.`FlightDestinationId` = `d`.`DestinationId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 21:40:42
