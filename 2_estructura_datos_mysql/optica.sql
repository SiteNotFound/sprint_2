-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `clientes/as`
--

DROP TABLE IF EXISTS `clientes/as`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes/as` (
  `idcliente` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `direccion_postal` varchar(25) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `id_cliente_recomendacion` int DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes/as`
--

LOCK TABLES `clientes/as` WRITE;
/*!40000 ALTER TABLE `clientes/as` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes/as` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado/a`
--

DROP TABLE IF EXISTS `empleado/a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado/a` (
  `idempleado` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado/a`
--

LOCK TABLES `empleado/a` WRITE;
/*!40000 ALTER TABLE `empleado/a` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado/a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `num_calle` varchar(45) DEFAULT NULL,
  `piso` varchar(15) DEFAULT NULL,
  `puerta` varchar(15) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(15) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nif` varchar(15) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventa` int NOT NULL,
  `id_gafas` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `fecha_venta` date NOT NULL,
  `id_empleado` int NOT NULL,
  `empleado/a_idempleado` int NOT NULL,
  `clientes/as_idcliente` int NOT NULL,
  PRIMARY KEY (`idventa`,`empleado/a_idempleado`,`clientes/as_idcliente`),
  KEY `fk_ventas_empleado/a1_idx` (`empleado/a_idempleado`),
  KEY `fk_ventas_clientes/as1_idx` (`clientes/as_idcliente`),
  CONSTRAINT `fk_ventas_clientes/as1` FOREIGN KEY (`clientes/as_idcliente`) REFERENCES `clientes/as` (`idcliente`),
  CONSTRAINT `fk_ventas_empleado/a1` FOREIGN KEY (`empleado/a_idempleado`) REFERENCES `empleado/a` (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 23:36:48
