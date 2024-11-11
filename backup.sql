-- MySQL dump 10.13 Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost Database: mydb
-- ------------------------------------------------------
-- Server version8.3.0
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO'
*/;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Table structure for table `Crime`
--
DROP TABLE IF EXISTS `Crime`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Crime` (
`CRNumber` int NOT NULL,
`Crime_name_1` varchar(255) DEFAULT NULL,
`Crime_name_2` varchar(255) DEFAULT NULL,
`NIBRS_Code` int DEFAULT NULL,
`Victim_Count` int DEFAULT NULL,
PRIMARY KEY (`CRNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Crime`
--
LOCK TABLES `Crime` WRITE;
/*!40000 ALTER TABLE `Crime` DISABLE KEYS */;
INSERT INTO `Crime` VALUES
(1,'Theft','Larceny',23,1),(2,'Assault','Battery',13,1),(3,'Robbery','Arme
d Robbery',31,1),(4,'Burglary','Residential
Burglary',22,1),(5,'Homicide','Murder',11,1),(6,'Fraud','Identity
Theft',26,1),(7,'Drug
Offense','Possession',35,1),(8,'Vandalism','Graffiti',14,1),(9,'Arson','Pr
operty Damage',21,1),(10,'Kidnapping','Abduction',12,1),(11,'Weapon
Violation','Illegal Possession',15,1),(12,'Disorderly Conduct','Public
Disturbance',16,1),(13,'Prostitution','Solicitation',17,1),(14,'DUI','Driv
ing Under Influence',18,1),(15,'Cybercrime','Hacking',19,1);
/*!40000 ALTER TABLE `Crime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Date`
--
DROP TABLE IF EXISTS `Date`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Date` (
`DateID` int NOT NULL,
`Date` date DEFAULT NULL,
`Time` datetime DEFAULT NULL,
PRIMARY KEY (`DateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Date`
--
LOCK TABLES `Date` WRITE;
/*!40000 ALTER TABLE `Date` DISABLE KEYS */;
INSERT INTO `Date` VALUES (1,'2016-01-01','2016-01-01 00:00:00'),(2,'2017-
01-01','2017-01-01 00:00:00'),(3,'2018-01-01','2018-01-01
00:00:00'),(4,'2019-01-01','2019-01-01 00:00:00'),(5,'2020-01-01','2020-
01-01 00:00:00'),(6,'2021-01-01','2021-01-01 00:00:00'),(7,'2022-01-
01','2022-01-01 00:00:00'),(8,'2016-06-15','2016-06-15
12:00:00'),(9,'2017-06-15','2017-06-15 12:00:00'),(10,'2018-06-15','2018-
06-15 12:00:00'),(11,'2019-06-15','2019-06-15 12:00:00'),(12,'2020-06-
15','2020-06-15 12:00:00'),(13,'2021-06-15','2021-06-15
12:00:00'),(14,'2022-06-15','2022-06-15 12:00:00'),(15,'2022-12-31','2022-
12-31 23:59:59');
/*!40000 ALTER TABLE `Date` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Incident`
--
DROP TABLE IF EXISTS `Incident`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incident` (
`IncidentID` int NOT NULL,
`Offense_Code` int DEFAULT NULL,
`Start_Date_Time` datetime DEFAULT NULL,
`End_Date_Time` datetime DEFAULT NULL,
`Crime_CRNumber` int NOT NULL,
`Police_District_District_number` int NOT NULL,
`Date_DateID` int NOT NULL,
PRIMARY KEY (`IncidentID`,`Crime_CRNumber`),
KEY `fk_Incident_Crime_idx` (`Crime_CRNumber`),
KEY `fk_Incident_Police_District1_idx`
(`Police_District_District_number`),
KEY `fk_Incident_Date1_idx` (`Date_DateID`),
CONSTRAINT `fk_Incident_Crime` FOREIGN KEY (`Crime_CRNumber`) REFERENCES
`Crime` (`CRNumber`),
CONSTRAINT `fk_Incident_Date1` FOREIGN KEY (`Date_DateID`) REFERENCES
`Date` (`DateID`),
CONSTRAINT `fk_Incident_Police_District1` FOREIGN KEY
(`Police_District_District_number`) REFERENCES `Police_District`
(`District_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Incident`
--
LOCK TABLES `Incident` WRITE;
/*!40000 ALTER TABLE `Incident` DISABLE KEYS */;
INSERT INTO `Incident` VALUES (1,23,'2016-01-01 00:00:00','2016-01-01
01:00:00',1,1,1),(2,13,'2017-01-01 00:00:00','2017-01-01
01:00:00',2,2,2),(3,31,'2018-01-01 00:00:00','2018-01-01
01:00:00',3,3,3),(4,22,'2019-01-01 00:00:00','2019-01-01
01:00:00',4,4,4),(5,11,'2020-01-01 00:00:00','2020-01-01
01:00:00',5,5,5),(6,26,'2021-01-01 00:00:00','2021-01-01
01:00:00',6,1,6),(7,35,'2022-01-01 00:00:00','2022-01-01
01:00:00',7,2,7),(8,14,'2016-06-15 12:00:00','2016-06-15
13:00:00',8,3,8),(9,21,'2017-06-15 12:00:00','2017-06-15
13:00:00',9,4,9),(10,12,'2018-06-15 12:00:00','2018-06-15
13:00:00',10,5,10),(11,15,'2019-06-15 12:00:00','2019-06-15
13:00:00',11,1,11),(12,16,'2020-06-15 12:00:00','2020-06-15
13:00:00',12,2,12),(13,17,'2021-06-15 12:00:00','2021-06-15
13:00:00',13,3,13),(14,18,'2022-06-15 12:00:00','2022-06-15
13:00:00',14,4,14),(15,19,'2022-12-31 23:59:59','2023-01-01
00:59:59',15,5,15),(16,23,'2016-02-01 00:00:00','2016-02-01
01:00:00',1,1,1),(17,13,'2017-02-01 00:00:00','2017-02-01
01:00:00',2,2,2),(18,31,'2018-02-01 00:00:00','2018-02-01
01:00:00',3,3,3),(19,22,'2019-02-01 00:00:00','2019-02-01
01:00:00',4,4,4),(20,11,'2020-02-01 00:00:00','2020-02-01
01:00:00',5,5,5),(21,26,'2021-02-01 00:00:00','2021-02-01
01:00:00',6,1,6),(22,35,'2022-02-01 00:00:00','2022-02-01
01:00:00',7,2,7),(23,14,'2016-07-15 12:00:00','2016-07-15
13:00:00',8,3,8),(24,21,'2017-07-15 12:00:00','2017-07-15
13:00:00',9,4,9),(25,12,'2018-07-15 12:00:00','2018-07-15
13:00:00',10,5,10),(26,15,'2019-07-15 12:00:00','2019-07-15
13:00:00',11,1,11),(27,16,'2020-07-15 12:00:00','2020-07-15
13:00:00',12,2,12),(28,17,'2021-07-15 12:00:00','2021-07-15
13:00:00',13,3,13),(29,18,'2022-07-15 12:00:00','2022-07-15
13:00:00',14,4,14),(30,19,'2023-01-01 01:59:59','2023-01-01
02:59:59',15,5,15);
/*!40000 ALTER TABLE `Incident` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Incident_has_Offense`
--
DROP TABLE IF EXISTS `Incident_has_Offense`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incident_has_Offense` (
`Incident_IncidentID` int NOT NULL,
`Incident_Crime_CRNumber` int NOT NULL,
`Offense_Offense_code` int NOT NULL,
PRIMARY KEY
(`Incident_IncidentID`,`Incident_Crime_CRNumber`,`Offense_Offense_code`),
KEY `fk_Incident_has_Offense_Offense1_idx` (`Offense_Offense_code`),
KEY `fk_Incident_has_Offense_Incident1_idx`
(`Incident_IncidentID`,`Incident_Crime_CRNumber`),
CONSTRAINT `fk_Incident_has_Offense_Incident1` FOREIGN KEY
(`Incident_IncidentID`, `Incident_Crime_CRNumber`) REFERENCES `Incident`
(`IncidentID`, `Crime_CRNumber`),
CONSTRAINT `fk_Incident_has_Offense_Offense1` FOREIGN KEY
(`Offense_Offense_code`) REFERENCES `Offense` (`Offense_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Incident_has_Offense`
--
LOCK TABLES `Incident_has_Offense` WRITE;
/*!40000 ALTER TABLE `Incident_has_Offense` DISABLE KEYS */;
INSERT INTO `Incident_has_Offense` VALUES
(5,5,11),(13,13,11),(3,3,12),(10,10,12),(2,2,13),(10,10,13),(1,1,14),(8,8,
14),(4,4,15),(11,11,15),(5,5,16),(12,12,16),(6,6,17),(13,13,17),(7,7,18),(
14,14,18),(8,8,19),(15,15,19),(2,2,21),(9,9,21),(4,4,22),(12,12,22),(1,1,2
3),(9,9,23),(6,6,26),(14,14,26),(3,3,31),(11,11,31),(7,7,35),(15,15,35);
/*!40000 ALTER TABLE `Incident_has_Offense` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Location`
--
DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
`Latitude` double DEFAULT NULL,
`Longitude` double DEFAULT NULL,
`Street_Address` varchar(255) DEFAULT NULL,
`Zipcode` int DEFAULT NULL,
`Location_type` varchar(255) DEFAULT NULL,
`Sector` varchar(255) DEFAULT NULL,
`Beat` int DEFAULT NULL,
`PRA` varchar(255) DEFAULT NULL,
`Incident_IncidentID` int NOT NULL,
`Incident_Crime_CRNumber` int NOT NULL,
KEY `fk_Location_Incident1_idx`
(`Incident_IncidentID`,`Incident_Crime_CRNumber`),
CONSTRAINT `fk_Location_Incident1` FOREIGN KEY (`Incident_IncidentID`,
`Incident_Crime_CRNumber`) REFERENCES `Incident` (`IncidentID`,
`Crime_CRNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Location`
--
LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (39.123,-77.123,'123 Main
St',20850,'Residential','A',1,'PRA1',1,1),(39.124,-77.124,'124 Main
St',20851,'Commercial','B',2,'PRA2',2,2),(39.125,-77.125,'125 Main
St',20852,'Public','C',3,'PRA3',3,3),(39.126,-77.126,'126 Main
St',20853,'Residential','D',4,'PRA4',4,4),(39.127,-77.127,'127 Main
St',20854,'Commercial','E',5,'PRA5',5,5),(39.128,-77.128,'128 Main
St',20855,'Public','F',6,'PRA6',6,6),(39.129,-77.129,'129 Main
St',20856,'Residential','G',7,'PRA7',7,7),(39.13,-77.13,'130 Main
St',20857,'Commercial','H',8,'PRA8',8,8),(39.131,-77.131,'131 Main
St',20858,'Public','I',9,'PRA9',9,9),(39.132,-77.132,'132 Main
St',20859,'Residential','J',10,'PRA10',10,10),(39.133,-77.133,'133 Main
St',20860,'Commercial','K',11,'PRA11',11,11),(39.134,-77.134,'134 Main
St',20861,'Public','L',12,'PRA12',12,12),(39.135,-77.135,'135 Main
St',20862,'Residential','M',13,'PRA13',13,13),(39.136,-77.136,'136 Main
St',20863,'Commercial','N',14,'PRA14',14,14),(39.137,-77.137,'137 Main
St',20864,'Public','O',15,'PRA15',15,15);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Offense`
--
DROP TABLE IF EXISTS `Offense`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Offense` (
`Offense_code` int NOT NULL,
`Description` varchar(255) DEFAULT NULL,
PRIMARY KEY (`Offense_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Offense`
--
LOCK TABLES `Offense` WRITE;
/*!40000 ALTER TABLE `Offense` DISABLE KEYS */;
INSERT INTO `Offense` VALUES
(11,'Murder'),(12,'Abduction'),(13,'Battery'),(14,'Graffiti'),(15,'Illegal
Possession'),(16,'Public
Disturbance'),(17,'Solicitation'),(18,'DUI'),(19,'Hacking'),(21,'Property
Damage'),(22,'Residential Burglary'),(23,'Larceny'),(26,'Identity
Theft'),(31,'Armed Robbery'),(35,'Drug Possession');
/*!40000 ALTER TABLE `Offense` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Police_District`
--
DROP TABLE IF EXISTS `Police_District`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Police_District` (
`District_number` int NOT NULL,
`District_Name` varchar(45) DEFAULT NULL,
PRIMARY KEY (`District_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Police_District`
--
LOCK TABLES `Police_District` WRITE;
/*!40000 ALTER TABLE `Police_District` DISABLE KEYS */;
INSERT INTO `Police_District` VALUES (1,'North District'),(2,'South
District'),(3,'East District'),(4,'West District'),(5,'Central District');
/*!40000 ALTER TABLE `Police_District` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Property`
--
DROP TABLE IF EXISTS `Property`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Property` (
`PropertyID` int NOT NULL,
`Description` varchar(255) DEFAULT NULL,
`Incident_IncidentID` int NOT NULL,
`Incident_Crime_CRNumber` int NOT NULL,
PRIMARY KEY (`PropertyID`),
KEY `fk_Property_Incident1_idx`
(`Incident_IncidentID`,`Incident_Crime_CRNumber`),
CONSTRAINT `fk_Property_Incident1` FOREIGN KEY (`Incident_IncidentID`,
`Incident_Crime_CRNumber`) REFERENCES `Incident` (`IncidentID`,
`Crime_CRNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Property`
--
LOCK TABLES `Property` WRITE;
/*!40000 ALTER TABLE `Property` DISABLE KEYS */;
INSERT INTO `Property` VALUES (1,'Stolen Car',1,1),(2,'Broken
Window',2,2),(3,'Stolen Wallet',3,3),(4,'Vandalized Wall',4,4),(5,'Stolen
Jewelry',5,5),(6,'Damaged Fence',6,6),(7,'Stolen Bike',7,7),(8,'Graffiti
on Building',8,8),(9,'Burnt House',9,9),(10,'Stolen
Purse',10,10),(11,'Broken Door',11,11),(12,'Stolen
Laptop',12,12),(13,'Damaged Car',13,13),(14,'Stolen
Phone',14,14),(15,'Vandalized Vehicle',15,15);
/*!40000 ALTER TABLE `Property` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `view_avg_victims_per_crime`
--
DROP TABLE IF EXISTS `view_avg_victims_per_crime`;
/*!50001 DROP VIEW IF EXISTS `view_avg_victims_per_crime`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_avg_victims_per_crime` AS SELECT
1. AS `Crime_name_1`,
1. AS `Avg_Victims`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_count_incidents_per_crime`
--
DROP TABLE IF EXISTS `view_count_incidents_per_crime`;
/*!50001 DROP VIEW IF EXISTS `view_count_incidents_per_crime`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_count_incidents_per_crime` AS SELECT
1. AS `Crime_name_1`,
1. AS `Incident_Count`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_crime_incident`
--
DROP TABLE IF EXISTS `view_crime_incident`;
/*!50001 DROP VIEW IF EXISTS `view_crime_incident`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_crime_incident` AS SELECT
1. AS `CRNumber`,
1. AS `Crime_name_1`,--
-- Dumping data for table `Property`
--
LOCK TABLES `Property` WRITE;
/*!40000 ALTER TABLE `Property` DISABLE KEYS */;
INSERT INTO `Property` VALUES (1,'Stolen Car',1,1),(2,'Broken
Window',2,2),(3,'Stolen Wallet',3,3),(4,'Vandalized Wall',4,4),(5,'Stolen
Jewelry',5,5),(6,'Damaged Fence',6,6),(7,'Stolen Bike',7,7),(8,'Graffiti
on Building',8,8),(9,'Burnt House',9,9),(10,'Stolen
Purse',10,10),(11,'Broken Door',11,11),(12,'Stolen
Laptop',12,12),(13,'Damaged Car',13,13),(14,'Stolen
Phone',14,14),(15,'Vandalized Vehicle',15,15);
/*!40000 ALTER TABLE `Property` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `view_avg_victims_per_crime`
--
DROP TABLE IF EXISTS `view_avg_victims_per_crime`;
/*!50001 DROP VIEW IF EXISTS `view_avg_victims_per_crime`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_avg_victims_per_crime` AS SELECT
1. AS `Crime_name_1`,
1. AS `Avg_Victims`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_count_incidents_per_crime`
--
DROP TABLE IF EXISTS `view_count_incidents_per_crime`;
/*!50001 DROP VIEW IF EXISTS `view_count_incidents_per_crime`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_count_incidents_per_crime` AS SELECT
1. AS `Crime_name_1`,
1. AS `Incident_Count`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_crime_incident`
--
DROP TABLE IF EXISTS `view_crime_incident`;
/*!50001 DROP VIEW IF EXISTS `view_crime_incident`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_crime_incident` AS SELECT
1. AS `CRNumber`,
1. AS `Crime_name_1`,
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `End_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_filter_crimes_by_nibrs`
--
DROP TABLE IF EXISTS `view_filter_crimes_by_nibrs`;
/*!50001 DROP VIEW IF EXISTS `view_filter_crimes_by_nibrs`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_filter_crimes_by_nibrs` AS SELECT
1. AS `CRNumber`,
1. AS `Crime_name_1`,
1. AS `NIBRS_Code`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_filter_incidents_by_date`
--
DROP TABLE IF EXISTS `view_filter_incidents_by_date`;
/*!50001 DROP VIEW IF EXISTS `view_filter_incidents_by_date`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_filter_incidents_by_date` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `End_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_incident_crime_offense`
--
DROP TABLE IF EXISTS `view_incident_crime_offense`;
/*!50001 DROP VIEW IF EXISTS `view_incident_crime_offense`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incident_crime_offense` AS SELECT
1. AS `IncidentID`,
1. AS `Crime_name_1`,
1. AS `Description`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_incident_date`
--
DROP TABLE IF EXISTS `view_incident_date`;
/*!50001 DROP VIEW IF EXISTS `view_incident_date`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incident_date` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `Date`,
1. AS `Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_incident_police_district`
--
DROP TABLE IF EXISTS `view_incident_police_district`;
/*!50001 DROP VIEW IF EXISTS `view_incident_police_district`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incident_police_district` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `District_Name`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view
`view_incidents_with_high_victim_crimes`
--
DROP TABLE IF EXISTS `view_incidents_with_high_victim_crimes`;
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_high_victim_crimes`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incidents_with_high_victim_crimes` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `End_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view
`view_incidents_with_multiple_offenses`
--
DROP TABLE IF EXISTS `view_incidents_with_multiple_offenses`;
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_multiple_offenses`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incidents_with_multiple_offenses` AS SELECT
1. AS `IncidentID`,
1. AS `Offense_Count`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_location_incident`
--/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incident_date` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `Date`,
1. AS `Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_incident_police_district`
--
DROP TABLE IF EXISTS `view_incident_police_district`;
/*!50001 DROP VIEW IF EXISTS `view_incident_police_district`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incident_police_district` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `District_Name`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view
`view_incidents_with_high_victim_crimes`
--
DROP TABLE IF EXISTS `view_incidents_with_high_victim_crimes`;
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_high_victim_crimes`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incidents_with_high_victim_crimes` AS SELECT
1. AS `IncidentID`,
1. AS `Start_Date_Time`,
1. AS `End_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view
`view_incidents_with_multiple_offenses`
--
DROP TABLE IF EXISTS `view_incidents_with_multiple_offenses`;
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_multiple_offenses`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_incidents_with_multiple_offenses` AS SELECT
1. AS `IncidentID`,
1. AS `Offense_Count`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `view_location_incident`
--
DROP TABLE IF EXISTS `view_location_incident`;
/*!50001 DROP VIEW IF EXISTS `view_location_incident`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_location_incident` AS SELECT
1. AS `Street_Address`,
1. AS `Zipcode`,
1. AS `IncidentID`,
1. AS `Start_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Final view structure for view `view_avg_victims_per_crime`
--
/*!50001 DROP VIEW IF EXISTS `view_avg_victims_per_crime`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_avg_victims_per_crime` AS select `c`.`Crime_name_1` AS
`Crime_name_1`,avg(`c`.`Victim_Count`) AS `Avg_Victims` from `crime` `c`
group by `c`.`Crime_name_1` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_count_incidents_per_crime`
--
/*!50001 DROP VIEW IF EXISTS `view_count_incidents_per_crime`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_count_incidents_per_crime` AS select
`c`.`Crime_name_1` AS `Crime_name_1`,count(`i`.`IncidentID`) AS
`Incident_Count` from (`crime` `c` join `incident` `i` on((`c`.`CRNumber`
= `i`.`Crime_CRNumber`))) group by `c`.`Crime_name_1` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--DROP TABLE IF EXISTS `view_location_incident`;
/*!50001 DROP VIEW IF EXISTS `view_location_incident`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_location_incident` AS SELECT
1. AS `Street_Address`,
1. AS `Zipcode`,
1. AS `IncidentID`,
1. AS `Start_Date_Time`*/;
SET character_set_client = @saved_cs_client;
--
-- Final view structure for view `view_avg_victims_per_crime`
--
/*!50001 DROP VIEW IF EXISTS `view_avg_victims_per_crime`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_avg_victims_per_crime` AS select `c`.`Crime_name_1` AS
`Crime_name_1`,avg(`c`.`Victim_Count`) AS `Avg_Victims` from `crime` `c`
group by `c`.`Crime_name_1` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_count_incidents_per_crime`
--
/*!50001 DROP VIEW IF EXISTS `view_count_incidents_per_crime`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_count_incidents_per_crime` AS select
`c`.`Crime_name_1` AS `Crime_name_1`,count(`i`.`IncidentID`) AS
`Incident_Count` from (`crime` `c` join `incident` `i` on((`c`.`CRNumber`
= `i`.`Crime_CRNumber`))) group by `c`.`Crime_name_1` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_crime_incident`
--
/*!50001 DROP VIEW IF EXISTS `view_crime_incident`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_crime_incident` AS select `c`.`CRNumber` AS
`CRNumber`,`c`.`Crime_name_1` AS `Crime_name_1`,`i`.`IncidentID` AS
`IncidentID`,`i`.`Start_Date_Time` AS
`Start_Date_Time`,`i`.`End_Date_Time` AS `End_Date_Time` from (`crime` `c`
join `incident` `i` on((`c`.`CRNumber` = `i`.`Crime_CRNumber`))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_filter_crimes_by_nibrs`
--
/*!50001 DROP VIEW IF EXISTS `view_filter_crimes_by_nibrs`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_filter_crimes_by_nibrs` AS select `crime`.`CRNumber`
AS `CRNumber`,`crime`.`Crime_name_1` AS
`Crime_name_1`,`crime`.`NIBRS_Code` AS `NIBRS_Code` from `crime` where
(`crime`.`NIBRS_Code` = 23) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_filter_incidents_by_date`
--
/*!50001 DROP VIEW IF EXISTS `view_filter_incidents_by_date`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */-- Final view structure for view `view_crime_incident`
--
/*!50001 DROP VIEW IF EXISTS `view_crime_incident`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_crime_incident` AS select `c`.`CRNumber` AS
`CRNumber`,`c`.`Crime_name_1` AS `Crime_name_1`,`i`.`IncidentID` AS
`IncidentID`,`i`.`Start_Date_Time` AS
`Start_Date_Time`,`i`.`End_Date_Time` AS `End_Date_Time` from (`crime` `c`
join `incident` `i` on((`c`.`CRNumber` = `i`.`Crime_CRNumber`))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_filter_crimes_by_nibrs`
--
/*!50001 DROP VIEW IF EXISTS `view_filter_crimes_by_nibrs`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_filter_crimes_by_nibrs` AS select `crime`.`CRNumber`
AS `CRNumber`,`crime`.`Crime_name_1` AS
`Crime_name_1`,`crime`.`NIBRS_Code` AS `NIBRS_Code` from `crime` where
(`crime`.`NIBRS_Code` = 23) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_filter_incidents_by_date`
--
/*!50001 DROP VIEW IF EXISTS `view_filter_incidents_by_date`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_filter_incidents_by_date` AS select
`incident`.`IncidentID` AS `IncidentID`,`incident`.`Start_Date_Time` AS
`Start_Date_Time`,`incident`.`End_Date_Time` AS `End_Date_Time` from
`incident` where (`incident`.`Start_Date_Time` between '2018-01-01' and
'2020-12-31') */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_incident_crime_offense`
--
/*!50001 DROP VIEW IF EXISTS `view_incident_crime_offense`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_incident_crime_offense` AS select `i`.`IncidentID` AS
`IncidentID`,`c`.`Crime_name_1` AS `Crime_name_1`,`o`.`Description` AS
`Description` from (((`incident_has_offense` `ih` join `incident` `i`
on(((`ih`.`Incident_IncidentID` = `i`.`IncidentID`) and
(`ih`.`Incident_Crime_CRNumber` = `i`.`Crime_CRNumber`)))) join `crime`
`c` on((`i`.`Crime_CRNumber` = `c`.`CRNumber`))) join `offense` `o`
on((`ih`.`Offense_Offense_code` = `o`.`Offense_code`))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_incident_date`
--
/*!50001 DROP VIEW IF EXISTS `view_incident_date`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_incident_date` AS select `i`.`IncidentID` AS
`IncidentID`,`i`.`Start_Date_Time` AS `Start_Date_Time`,`d`.`Date` AS
`Date`,`d`.`Time` AS `Time` from (`incident` `i` join `date` `d`
on((`i`.`Date_DateID` = `d`.`DateID`))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_incident_police_district`
--
/*!50001 DROP VIEW IF EXISTS `view_incident_police_district`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_incident_police_district` AS select `i`.`IncidentID`
AS `IncidentID`,`i`.`Start_Date_Time` AS
`Start_Date_Time`,`pd`.`District_Name` AS `District_Name` from (`incident`
`i` join `police_district` `pd` on((`i`.`Police_District_District_number`
= `pd`.`District_number`))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_incidents_with_high_victim_crimes`
--
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_high_victim_crimes`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_incidents_with_high_victim_crimes` AS select
`i`.`IncidentID` AS `IncidentID`,`i`.`Start_Date_Time` AS
`Start_Date_Time`,`i`.`End_Date_Time` AS `End_Date_Time` from `incident`
`i` where `i`.`Crime_CRNumber` in (select `c`.`CRNumber` from `crime` `c`
where (`c`.`Victim_Count` > 1)) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_incidents_with_multiple_offenses`
--
/*!50001 DROP VIEW IF EXISTS `view_incidents_with_multiple_offenses`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_incidents_with_multiple_offenses` AS select
`i`.`IncidentID` AS `IncidentID`,count(`ih`.`Offense_Offense_code`) AS
`Offense_Count` from (`incident` `i` join `incident_has_offense` `ih`
on(((`i`.`IncidentID` = `ih`.`Incident_IncidentID`) and
(`i`.`Crime_CRNumber` = `ih`.`Incident_Crime_CRNumber`)))) group by
`i`.`IncidentID` having (`Offense_Count` > 1) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `view_location_incident`
--
/*!50001 DROP VIEW IF EXISTS `view_location_incident`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_location_incident` AS select `l`.`Street_Address` AS
`Street_Address`,`l`.`Zipcode` AS `Zipcode`,`i`.`IncidentID` AS
`IncidentID`,`i`.`Start_Date_Time` AS `Start_Date_Time` from (`location`
`l` join `incident` `i` on(((`l`.`Incident_IncidentID` = `i`.`IncidentID`)
and (`l`.`Incident_Crime_CRNumber` = `i`.`Crime_CRNumber`)))) */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- Dump completed on 2024-05-11 19:48:57