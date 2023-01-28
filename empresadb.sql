-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: empresadb
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `idtipodoc` int NOT NULL,
  `idsubtip` int DEFAULT NULL,
  `num_doc` varchar(11) DEFAULT NULL,
  `nom_ape` varchar(255) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `cel` varchar(11) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `fec_reg` datetime DEFAULT NULL,
  `fec_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`idcliente`,`idtipodoc`),
  KEY `fk_tipdoc_idx` (`idtipodoc`),
  KEY `fk_subtip_idx` (`idsubtip`),
  CONSTRAINT `fk_subtip` FOREIGN KEY (`idsubtip`) REFERENCES `subtip` (`idsubtip`),
  CONSTRAINT `fk_tipdoc` FOREIGN KEY (`idtipodoc`) REFERENCES `tipodoc` (`idtipodoc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,NULL,'71523215','HECTOR MARTIN BAZALAR CONTRERAS','Jr avenida caslle','947158040','1',NULL,NULL),(2,2,NULL,'10764380733','DAYANNA MARJORIE NEYRA SAAVEDRA','Jr avenida calle','915963138','1',NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtip`
--

DROP TABLE IF EXISTS `subtip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtip` (
  `idsubtip` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `nom_corto` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `fec_reg` datetime DEFAULT NULL,
  `fec_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`idsubtip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtip`
--

LOCK TABLES `subtip` WRITE;
/*!40000 ALTER TABLE `subtip` DISABLE KEYS */;
INSERT INTO `subtip` VALUES (1,'Individuales','ind','1',NULL,NULL),(2,'Mancomunadas','man','1',NULL,NULL);
/*!40000 ALTER TABLE `subtip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodoc`
--

DROP TABLE IF EXISTS `tipodoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodoc` (
  `idtipodoc` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripción` varchar(200) DEFAULT NULL,
  `nom_corto` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `fec_reg` datetime DEFAULT NULL,
  `fec_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`idtipodoc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodoc`
--

LOCK TABLES `tipodoc` WRITE;
/*!40000 ALTER TABLE `tipodoc` DISABLE KEYS */;
INSERT INTO `tipodoc` VALUES (1,'LIBRETA ELECTORAL O DNI','Documento de identidad unico.','DNI','1',NULL,NULL),(2,'REG. UNICO DE CONTRIBUYENTES','REG. UNICO DE CONTRIBUYENTES','RUC','1',NULL,NULL);
/*!40000 ALTER TABLE `tipodoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `fec_reg` datetime DEFAULT NULL,
  `fec_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'hbazalar','Hbazalar123!','1',NULL,NULL),(2,2,'dneyra','Dneyra123!','1',NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-27 23:27:17
