-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for osx10.15 (x86_64)
--
-- Host: localhost    Database: EventAja
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `EventAja`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `EventAja` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `EventAja`;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `album_name` varchar(100) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `song_amount` int(11) NOT NULL DEFAULT 0,
  `released_year` year(4) NOT NULL,
  PRIMARY KEY (`album_name`),
  KEY `FK_Artist` (`artist_id`),
  CONSTRAINT `FK_Artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` (`album_name`, `artist_id`, `song_amount`, `released_year`) VALUES ('Basdat Serenade',2,1,2018),('Cry of Database',3,1,2015),('Databases of Despairs',1,1,2013),('Living in The Database',5,2,2021),('Love of Basdat',5,1,2020);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `artist_ID` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  PRIMARY KEY (`artist_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` (`artist_ID`, `artist_name`, `gender`, `country`, `genre`) VALUES (1,'Alan','Male','Kanada','Electronic'),(2,'Efendi','Male','Indonesia','Rock'),(3,'Jeremy','Male','England','Jazz'),(4,'Niki','Female','Indonesia','R&B'),(5,'Isyana','Female','Indonesia','Pop');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concert`
--

DROP TABLE IF EXISTS `concert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concert` (
  `concert_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(100) NOT NULL,
  `loc_ID` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `artist_ID` int(11) NOT NULL,
  `concert_name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`concert_id`),
  KEY `FK_TourC` (`tour_name`),
  KEY `FK_LocC` (`loc_ID`),
  KEY `FK_AlbumC` (`album_name`),
  KEY `FK_ArtistC` (`artist_ID`),
  CONSTRAINT `FK_AlbumC` FOREIGN KEY (`album_name`) REFERENCES `album` (`album_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ArtistC` FOREIGN KEY (`artist_ID`) REFERENCES `artist` (`artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LocC` FOREIGN KEY (`loc_ID`) REFERENCES `location` (`loc_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TourC` FOREIGN KEY (`tour_name`) REFERENCES `tour` (`tour_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concert`
--

LOCK TABLES `concert` WRITE;
/*!40000 ALTER TABLE `concert` DISABLE KEYS */;
INSERT INTO `concert` (`concert_id`, `tour_name`, `loc_ID`, `album_name`, `artist_ID`, `concert_name`, `date`) VALUES (1,'Basis',1,'Basdat Serenade',1,'Basisten','2021-03-17'),(2,'Lilacs',2,'Cry of Database',2,'Lilacsin','2021-02-17'),(3,'Roses',3,'Databases of Despairs',3,'Databases My Fav','2021-02-01'),(4,'Tulips',4,'Living in The Database',4,'Livingers','2021-07-10'),(5,'Violets',5,'Love of Basdat',5,'My Love','2021-02-14'),(6,'Basis',2,'Basdat Serenade',1,'Basisten','2021-03-21'),(7,'Basis',5,'Basdat Serenade',1,'Basisten','2021-03-25'),(8,'Tulips',4,'Love of Basdat',5,'My Love','2021-02-16');
/*!40000 ALTER TABLE `concert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `loc_ID` int(11) NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL CHECK (`capacity` >= 1),
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`loc_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`loc_ID`, `loc_name`, `address`, `capacity`, `type`) VALUES (1,'Aula Barat ITB','Jalan Ganesha ITB',300,'Aula'),(2,'Lapangan Basket','Jalan Ganesha ITB',350,'Lapangan'),(3,'West Avenue','Wall Street Manhattan',175,'Avenue'),(4,'Red Rocks','Alameda Street Morison',1202,'Amphiteatre'),(5,'Amphiteatre ITB','Jalan Ganesha ITB',200,'Amphiteatre');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchandise`
--

DROP TABLE IF EXISTS `merchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchandise` (
  `merch_ID` int(11) NOT NULL AUTO_INCREMENT,
  `concert_ID` int(11) NOT NULL,
  `merch_name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`merch_ID`),
  KEY `FK_concertIDmerch` (`concert_ID`),
  CONSTRAINT `FK_concertIDmerch` FOREIGN KEY (`concert_ID`) REFERENCES `concert` (`concert_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchandise`
--

LOCK TABLES `merchandise` WRITE;
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;
INSERT INTO `merchandise` (`merch_ID`, `concert_ID`, `merch_name`, `type`, `price`) VALUES (1,1,'Stickers','unofficial',10000),(2,1,'Patches','official',450000),(3,2,'Guitar picks','official',25000),(4,3,'Keychains','official',35000),(5,4,'Tote Bags','unofficial',55000),(6,5,'Patches','unofficial',225000),(7,2,'Beanies Hat','official',150000),(8,3,'Guitar picks','unofficial',20000),(9,4,'Posters','official',35000),(10,5,'Posters','official',55000),(11,5,'Tote Bags','unofficial',45000);
/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official` (
  `merch_id` int(11) NOT NULL,
  `kode_official` varchar(20) NOT NULL,
  PRIMARY KEY (`merch_id`),
  CONSTRAINT `FK_merchIDO` FOREIGN KEY (`merch_id`) REFERENCES `merchandise` (`merch_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` (`merch_id`, `kode_official`) VALUES (2,'A01'),(3,'B01'),(4,'C01'),(7,'B02'),(9,'D01'),(10,'E01');
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `pay_method` varchar(30) NOT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `FK_User` (`user_ID`),
  CONSTRAINT `FK_User` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_ID`, `user_ID`, `total_price`, `pay_method`) VALUES (1,1,100000,'Gopay'),(2,2,100000,'M-Banking'),(3,3,200000,'DANA'),(4,4,300000,'ATM'),(5,5,200000,'DANA'),(6,2,1100000,'Gopay'),(7,1,400000,'M-Banking'),(8,3,700000,'DANA'),(9,5,700000,'ATM'),(10,2,700000,'M-Banking');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `order_ID` int(11) NOT NULL,
  `ticket_ID` int(11) NOT NULL,
  PRIMARY KEY (`order_ID`,`ticket_ID`),
  KEY `FK_ticketID` (`ticket_ID`),
  CONSTRAINT `FK_orderID` FOREIGN KEY (`order_ID`) REFERENCES `order` (`order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ticketID` FOREIGN KEY (`ticket_ID`) REFERENCES `ticket` (`ticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`order_ID`, `ticket_ID`) VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,13),(7,9),(8,12),(9,17),(10,18);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `song_name` varchar(100) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `no_track` int(11) NOT NULL DEFAULT 1,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`song_name`,`album_name`),
  KEY `FK_Album` (`album_name`),
  CONSTRAINT `FK_Album` FOREIGN KEY (`album_name`) REFERENCES `album` (`album_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`song_name`, `album_name`, `no_track`, `duration`) VALUES ('Crying with Basdat','Basdat Serenade',1,230),('DATABASE DATABASE!','Living in The Database',1,237),('I Love Basdat','Love of Basdat',1,212),('JUST LIVING IN THE DATABASE!','Living in The Database',2,246),('Lullaby of Database','Cry of Database',1,224),('The Reason of Database','Databases of Despairs',1,286);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger increaseCount after insert on song
for each row
update album 
set album.song_amount = (select song_amount from album where 
new.album_name = album.album_name) + 1
where new.album_name = album.album_name */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_ID` int(11) NOT NULL AUTO_INCREMENT,
  `concert_ID` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'Regular',
  `price` int(11) NOT NULL,
  PRIMARY KEY (`ticket_ID`),
  KEY `FK_concertID` (`concert_ID`),
  CONSTRAINT `FK_concertID` FOREIGN KEY (`concert_ID`) REFERENCES `concert` (`concert_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` (`ticket_ID`, `concert_ID`, `type`, `price`) VALUES (1,1,'Silver',100000),(2,2,'Silver',100000),(3,3,'Gold',200000),(4,4,'Premium',300000),(5,5,'Gold',200000),(6,6,'Silver',250000),(7,6,'Gold',300000),(8,6,'VIP',400000),(9,7,'Silver',400000),(10,7,'Gold',650000),(11,7,'VIP',900000),(12,8,'Festival',700000),(13,8,'Premium',1100000),(14,8,'Premium',1100000),(15,8,'Premium',1100000),(16,8,'Premium',1100000),(17,8,'Festival',700000),(18,8,'Festival',700000),(19,8,'Festival',700000);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `tour_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL CHECK (`finish_date` > `start_date`),
  PRIMARY KEY (`tour_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` (`tour_name`, `start_date`, `finish_date`) VALUES ('Basis','2021-05-16','2021-05-17'),('Lilacs','2021-03-13','2021-03-17'),('Roses','2021-01-01','2021-02-01'),('Tulips','2021-07-02','2021-07-10'),('Violets','2020-09-22','2021-02-14');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unofficial`
--

DROP TABLE IF EXISTS `unofficial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unofficial` (
  `merch_id` int(11) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  PRIMARY KEY (`merch_id`),
  CONSTRAINT `FK_merchIDU` FOREIGN KEY (`merch_id`) REFERENCES `merchandise` (`merch_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unofficial`
--

LOCK TABLES `unofficial` WRITE;
/*!40000 ALTER TABLE `unofficial` DISABLE KEYS */;
INSERT INTO `unofficial` (`merch_id`, `supplier`) VALUES (1,'Hanata'),(5,'TotalGifts'),(6,'Oblivion Merch'),(8,'Hanata'),(11,'Xtreme Merch');
/*!40000 ALTER TABLE `unofficial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_ID`, `first_name`, `last_name`, `birth_date`) VALUES (1,'Fabi','Anandi','2001-01-22'),(2,'Eja','Morteza','2000-11-09'),(3,'Nadim','Amizah','2005-06-29'),(4,'Kiya','Utama','2001-09-10'),(5,'Rafli','Ananda','2002-05-12');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-08 13:18:41
