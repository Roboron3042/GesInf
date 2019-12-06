CREATE DATABASE  IF NOT EXISTS `GI` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `GI`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: GI
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `tMuestra`
--

DROP TABLE IF EXISTS `tMuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tMuestra` (
  `ID` int(11) NOT NULL,
  `NIF_Paciente` varchar(50) DEFAULT NULL,
  `Cultivo` varchar(50) DEFAULT NULL,
  `Solucion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `tSolucion` FOREIGN KEY (`ID`) REFERENCES `tSolucion` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tMuestra`
--

LOCK TABLES `tMuestra` WRITE;
/*!40000 ALTER TABLE `tMuestra` DISABLE KEYS */;
INSERT INTO `tMuestra` VALUES (1,'11111111A','SANGRE',10),(2,'22222222B','orina',5),(3,'11111111A','citologia',17),(4,'22222222B','heces',1);
/*!40000 ALTER TABLE `tMuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPermiso`
--

DROP TABLE IF EXISTS `tPermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPermiso` (
  `rolName` varchar(50) NOT NULL,
  `pantalla` varchar(50) NOT NULL,
  `acceso` bit(32) NOT NULL,
  `insertar` bit(32) NOT NULL,
  `modificar` bit(32) NOT NULL,
  `borrar` bit(32) NOT NULL,
  PRIMARY KEY (`rolName`),
  CONSTRAINT `rolName` FOREIGN KEY (`rolName`) REFERENCES `tRol` (`rolName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPermiso`
--

LOCK TABLES `tPermiso` WRITE;
/*!40000 ALTER TABLE `tPermiso` DISABLE KEYS */;
INSERT INTO `tPermiso` VALUES ('Administrador','Muestras','\0\0\01','\0\0\01','\0\0\01','\0\0\01'),('Invitado','Muestras','\0\0\01','\0\0\00','\0\0\00','\0\0\00'),('Usuario','Muestras','\0\0\01','\0\0\00','\0\0\01','\0\0\01');
/*!40000 ALTER TABLE `tPermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tRol`
--

DROP TABLE IF EXISTS `tRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tRol` (
  `rolName` varchar(50) NOT NULL,
  `rolDes` varchar(255) DEFAULT NULL,
  `admin` bit(32) NOT NULL,
  PRIMARY KEY (`rolName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tRol`
--

LOCK TABLES `tRol` WRITE;
/*!40000 ALTER TABLE `tRol` DISABLE KEYS */;
INSERT INTO `tRol` VALUES ('Administrador',NULL,'\0\0\01'),('Invitado',NULL,'\0\0\00'),('Usuario',NULL,'\0\0\00');
/*!40000 ALTER TABLE `tRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tSolucion`
--

DROP TABLE IF EXISTS `tSolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tSolucion` (
  `ID` int(11) NOT NULL,
  `Solucion` varchar(50) DEFAULT NULL,
  `Uso` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tSolucion`
--

LOCK TABLES `tSolucion` WRITE;
/*!40000 ALTER TABLE `tSolucion` DISABLE KEYS */;
INSERT INTO `tSolucion` VALUES (1,NULL,NULL),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL);
/*!40000 ALTER TABLE `tSolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuario`
--

DROP TABLE IF EXISTS `tUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuario` (
  `nif` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rolName` varchar(50) NOT NULL,
  KEY `tRol_idx` (`rolName`),
  CONSTRAINT `tRol` FOREIGN KEY (`rolName`) REFERENCES `tRol` (`rolName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuario`
--

LOCK TABLES `tUsuario` WRITE;
/*!40000 ALTER TABLE `tUsuario` DISABLE KEYS */;
INSERT INTO `tUsuario` VALUES ('11111111A','admin','Administrador'),('22222222B','usuario','Usuario'),('33333333C','Invitado','Invitado');
/*!40000 ALTER TABLE `tUsuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06 18:05:31
