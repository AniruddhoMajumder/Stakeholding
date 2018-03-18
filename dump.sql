-- MySQL dump 10.13  Distrib 5.5.57, for Win64 (AMD64)
--
-- Host: localhost    Database: stocks
-- ------------------------------------------------------
-- Server version	5.5.57-log

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `licence` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(3000) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('cmp0000001','Meridia Trading Ltd','MT0010','8334859892','agarwal.25ans@gmail.com','Christ University, Bengaluru','meridia','meridia-25'),('cmp0000002','Apple','APPL','9874653210','a.g@com','USA','apple','apple'),('cmp0000003','Google','GOOG','9874653210','a.g@com','USA','google','apple12'),('cmp0000004','Microsoft','MICR','9874653210','a.g@com','USA','microsoft','apple123'),('cmp0000005','TCS','Tata','9874653211','a.g@com','India','tcs','tcs2345'),('cmp0000006','Infosys','Inf','9874653111','a.g@com','Australia','infosys','inf2345'),('cmp0000007','Circus','Circ','9874651111','a.g@com','Europe','Circus','joker2345'),('cmp0000008','Wipro','Wip','9874611111','a.g@com','India','wipro','joker23456'),('cmp0000009','DE Shaw','DES','9874011111','a.grr@com','USA','deshaw','deshaw23'),('cmp0000010','PWC','PWC','9864011111','a.grr@com','Europe','pwc','orange234');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securities`
--

DROP TABLE IF EXISTS `securities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securities` (
  `id` varchar(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `registered` int(11) DEFAULT NULL,
  `issued` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyIdSecurities_idx` (`company_id`),
  KEY `typesIdSecurities_idx` (`type_id`),
  CONSTRAINT `companyIdSecurities` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typesIdSecurities` FOREIGN KEY (`type_id`) REFERENCES `security_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securities`
--

LOCK TABLES `securities` WRITE;
/*!40000 ALTER TABLE `securities` DISABLE KEYS */;
INSERT INTO `securities` VALUES ('sec0000001','cmp0000001','eshr',50.00,500,200,0),('sec0000002','cmp0000002','eshr',100.00,1200,600,0),('sec0000003','cmp0000003','eshr',100.00,200,100,0),('sec0000004','cmp0000004','eshr',150.00,2000,1000,0),('sec0000005','cmp0000005','eshr',250.00,20000,9000,0),('sec0000006','cmp0000006','eshr',255.00,200,90,0),('sec0000007','cmp0000007','eshr',1000.00,2000,900,0),('sec0000008','cmp0000008','eshr',10.00,200000,90000,0),('sec0000009','cmp0000009','eshr',100.00,200000,90000,0),('sec0000010','cmp0000010','eshr',140.00,200000,90000,0);
/*!40000 ALTER TABLE `securities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_trend`
--

DROP TABLE IF EXISTS `security_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_trend` (
  `security_id` varchar(50) NOT NULL,
  `closing_datetime` datetime DEFAULT NULL,
  `closing_price` decimal(11,2) DEFAULT NULL,
  KEY `securityIdTrend_idx` (`security_id`),
  CONSTRAINT `securityIdTrend` FOREIGN KEY (`security_id`) REFERENCES `securities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_trend`
--

LOCK TABLES `security_trend` WRITE;
/*!40000 ALTER TABLE `security_trend` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_types`
--

DROP TABLE IF EXISTS `security_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_types` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `voting_rights` tinyint(4) DEFAULT NULL,
  `transferrable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_types`
--

LOCK TABLES `security_types` WRITE;
/*!40000 ALTER TABLE `security_types` DISABLE KEYS */;
INSERT INTO `security_types` VALUES ('eshr','Equity Shares','',1,1);
/*!40000 ALTER TABLE `security_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trader`
--

DROP TABLE IF EXISTS `trader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trader` (
  `id` varchar(50) NOT NULL,
  `title` varchar(5) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `m_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `id_proof` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(3000) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trader`
--

LOCK TABLES `trader` WRITE;
/*!40000 ALTER TABLE `trader` DISABLE KEYS */;
INSERT INTO `trader` VALUES ('trd0000001','Mr.','Anshul','','Agarwal','M','Aadhar','1997-10-09','9742903823','aga@g.com','Kolkata, West Bengal','anshul25','joker25'),('trd0000002','Mr','Aniruddho','','Majumder','M','Aadhar','1997-10-25','9864011111','a.grr@com','Europe','aniruddho','orange234'),('trd0000003','Mrs.','Debanjana','','Santra','F','Aadhar','1998-01-01','9864011011','a.grr@com','India','debu','orange234'),('trd0000004','Mr.','Swapnil','','Shrey','M','Passport','1998-11-12','9998886660','a.g@com','India','swapnil','shrey'),('trd0000005','Mrs.','Priya','P.','Periee','F','Passport','1998-11-12','9998586660','a.g@com','UK','priya','shrey23'),('trd0000006','Mr.','Kushal','P.','Agarwal','M','Passport','1998-09-12','9998586560','a.eg@com','Singapore','kushal','shrey234'),('trd0000007','Mr.','Ayush','P.','Agarwal','M','Passport','1998-09-01','9998586560','a.eg@com','Singapore','ayush','shrey1234'),('trd0000008','Mr.','Joker','','Aggarwal','M','Passport','1998-09-30','9598586560','a.ege@com','USA','joker','shrey12345'),('trd0000009','Mrs.','Kane','','Kanya','F','Passport','1998-03-30','9598586561','a.ege@com','Australia','joker23','appelel'),('trd0000010','Mrs.','North','','Kanyaw','F','Passport','1998-03-11','8598586561','a.ege@com','Australia','North','appleorange');
/*!40000 ALTER TABLE `trader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` varchar(50) NOT NULL,
  `buyer_id` varchar(50) DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `security_id` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `t_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buyerPartyIdTransaction_idx` (`buyer_id`),
  KEY `sellerPartyIdTransaction_idx` (`seller_id`),
  KEY `securityIdTransaction_idx` (`security_id`),
  CONSTRAINT `buyerPartyIdTransaction` FOREIGN KEY (`buyer_id`) REFERENCES `transaction_party` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `securityIdTransaction` FOREIGN KEY (`security_id`) REFERENCES `securities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sellerPartyIdTransaction` FOREIGN KEY (`seller_id`) REFERENCES `transaction_party` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('txn0000001','tpy0000002','tpy0000001','sec0000001',30,1500.00,'2018-03-13 14:34:00'),('txn0000002','tpy0000002','tpy0000003','sec0000002',30,3000.00,'2018-03-13 14:35:00'),('txn0000003','tpy0000012','tpy0000004','sec0000003',30,3000.00,'2018-03-13 14:36:00'),('txn0000004','tpy0000013','tpy0000005','sec0000004',30,4500.00,'2018-03-13 14:37:00'),('txn0000005','tpy0000014','tpy0000006','sec0000005',30,7500.00,'2018-03-13 14:38:00'),('txn0000006','tpy0000015','tpy0000007','sec0000006',30,7650.00,'2018-03-13 14:39:00'),('txn0000007','tpy0000016','tpy0000008','sec0000007',30,30000.00,'2018-03-13 14:45:00'),('txn0000008','tpy0000017','tpy0000009','sec0000008',30,300.00,'2018-03-13 14:55:00'),('txn0000009','tpy0000018','tpy0000010','sec0000009',30,3000.00,'2018-03-13 14:15:00'),('txn0000010','tpy0000019','tpy0000011','sec0000010',30,4200.00,'2018-03-13 14:25:00'),('txn0000011','tpy0000020','tpy0000012','sec0000002',30,3000.00,'2018-03-13 14:35:00');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_party`
--

DROP TABLE IF EXISTS `transaction_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_party` (
  `id` varchar(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `trader_id` varchar(50) DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyIdTransactionParty_idx` (`company_id`),
  KEY `traderIdTransactionParty_idx` (`trader_id`),
  CONSTRAINT `companyIdParty` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `traderIdParty` FOREIGN KEY (`trader_id`) REFERENCES `trader` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_party`
--

LOCK TABLES `transaction_party` WRITE;
/*!40000 ALTER TABLE `transaction_party` DISABLE KEYS */;
INSERT INTO `transaction_party` VALUES ('tpy0000001','cmp0000001',NULL,0.00),('tpy0000002',NULL,'trd0000001',50000.00),('tpy0000003','cmp0000002',NULL,0.00),('tpy0000004','cmp0000003',NULL,0.00),('tpy0000005','cmp0000004',NULL,0.00),('tpy0000006','cmp0000005',NULL,0.00),('tpy0000007','cmp0000006',NULL,0.00),('tpy0000008','cmp0000007',NULL,0.00),('tpy0000009','cmp0000008',NULL,0.00),('tpy0000010','cmp0000009',NULL,0.00),('tpy0000011','cmp0000010',NULL,0.00),('tpy0000012',NULL,'trd0000002',150000.00),('tpy0000013',NULL,'trd0000003',150000.00),('tpy0000014',NULL,'trd0000004',9500.00),('tpy0000015',NULL,'trd0000005',950000.00),('tpy0000016',NULL,'trd0000006',450000.00),('tpy0000017',NULL,'trd0000007',157000.00),('tpy0000018',NULL,'trd0000008',1150000.00),('tpy0000019',NULL,'trd0000009',550000.00),('tpy0000020',NULL,'trd0000010',1500000.00);
/*!40000 ALTER TABLE `transaction_party` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13 14:48:36
