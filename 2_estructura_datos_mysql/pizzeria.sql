-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente/a`
--

DROP TABLE IF EXISTS `cliente/a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente/a` (
  `idcliente` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `direccion` varchar(60) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente/a`
--

LOCK TABLES `cliente/a` WRITE;
/*!40000 ALTER TABLE `cliente/a` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente/a` ENABLE KEYS */;
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
  `nif` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `tienda_idtienda` int NOT NULL,
  PRIMARY KEY (`idempleado`,`tienda_idtienda`),
  KEY `fk_empleado/a_tienda1_idx` (`tienda_idtienda`),
  CONSTRAINT `fk_empleado/a_tienda1` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`)
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
-- Table structure for table `lista_productos`
--

DROP TABLE IF EXISTS `lista_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_productos` (
  `idlista_productos` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `pedidos_idpedido` int NOT NULL,
  `pedidos_cliente/a_idcliente` int NOT NULL,
  `pedidos_tienda_idtienda` int NOT NULL,
  `pedidos_repartidor_idrepartidor` int NOT NULL,
  PRIMARY KEY (`idlista_productos`,`pedidos_idpedido`,`pedidos_cliente/a_idcliente`,`pedidos_tienda_idtienda`,`pedidos_repartidor_idrepartidor`),
  KEY `fk_lista_productos_pedidos1_idx` (`pedidos_idpedido`,`pedidos_cliente/a_idcliente`,`pedidos_tienda_idtienda`,`pedidos_repartidor_idrepartidor`),
  CONSTRAINT `fk_lista_productos_pedidos1` FOREIGN KEY (`pedidos_idpedido`, `pedidos_cliente/a_idcliente`, `pedidos_tienda_idtienda`, `pedidos_repartidor_idrepartidor`) REFERENCES `pedidos` (`idpedido`, `cliente/a_idcliente`, `tienda_idtienda`, `repartidor_idrepartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_productos`
--

LOCK TABLES `lista_productos` WRITE;
/*!40000 ALTER TABLE `lista_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idpedido` int NOT NULL,
  `fecha/hora` datetime NOT NULL,
  `entrega` enum('a domicilio','recoger en tienda') NOT NULL,
  `id_lista_productos` int NOT NULL,
  `total_precio` decimal(6,2) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_tienda` int NOT NULL,
  `cliente/a_idcliente` int NOT NULL,
  `tienda_idtienda` int NOT NULL,
  `repartidor_idrepartidor` int NOT NULL,
  PRIMARY KEY (`idpedido`,`cliente/a_idcliente`,`tienda_idtienda`,`repartidor_idrepartidor`),
  KEY `fk_pedidos_cliente/a_idx` (`cliente/a_idcliente`),
  KEY `fk_pedidos_tienda1_idx` (`tienda_idtienda`),
  KEY `fk_pedidos_repartidor1_idx` (`repartidor_idrepartidor`),
  CONSTRAINT `fk_pedidos_cliente/a` FOREIGN KEY (`cliente/a_idcliente`) REFERENCES `cliente/a` (`idcliente`),
  CONSTRAINT `fk_pedidos_repartidor1` FOREIGN KEY (`repartidor_idrepartidor`) REFERENCES `repartidor` (`idrepartidor`),
  CONSTRAINT `fk_pedidos_tienda1` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL,
  `producto` enum('pizza','hamburguesa','bebida') NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` longblob,
  `precio` decimal(6,2) NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `pedidos_idpedido` int NOT NULL,
  `pedidos_cliente/a_idcliente` int NOT NULL,
  `pedidos_tienda_idtienda` int NOT NULL,
  `pedidos_repartidor_idrepartidor` int NOT NULL,
  `lista_productos_idlista_productos` int NOT NULL,
  `lista_productos_pedidos_idpedido` int NOT NULL,
  `lista_productos_pedidos_cliente/a_idcliente` int NOT NULL,
  `lista_productos_pedidos_tienda_idtienda` int NOT NULL,
  `lista_productos_pedidos_repartidor_idrepartidor` int NOT NULL,
  `categoria_idcategoria1` int NOT NULL,
  PRIMARY KEY (`idproducto`,`pedidos_idpedido`,`pedidos_cliente/a_idcliente`,`pedidos_tienda_idtienda`,`pedidos_repartidor_idrepartidor`,`lista_productos_idlista_productos`,`lista_productos_pedidos_idpedido`,`lista_productos_pedidos_cliente/a_idcliente`,`lista_productos_pedidos_tienda_idtienda`,`lista_productos_pedidos_repartidor_idrepartidor`),
  KEY `fk_producto_pedidos1_idx` (`pedidos_idpedido`,`pedidos_cliente/a_idcliente`,`pedidos_tienda_idtienda`,`pedidos_repartidor_idrepartidor`),
  KEY `fk_producto_lista_productos1_idx` (`lista_productos_idlista_productos`,`lista_productos_pedidos_idpedido`,`lista_productos_pedidos_cliente/a_idcliente`,`lista_productos_pedidos_tienda_idtienda`,`lista_productos_pedidos_repartidor_idrepartidor`),
  KEY `fk_producto_categoria2_idx` (`categoria_idcategoria1`),
  CONSTRAINT `fk_producto_categoria2` FOREIGN KEY (`categoria_idcategoria1`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `fk_producto_lista_productos1` FOREIGN KEY (`lista_productos_idlista_productos`, `lista_productos_pedidos_idpedido`, `lista_productos_pedidos_cliente/a_idcliente`, `lista_productos_pedidos_tienda_idtienda`, `lista_productos_pedidos_repartidor_idrepartidor`) REFERENCES `lista_productos` (`idlista_productos`, `pedidos_idpedido`, `pedidos_cliente/a_idcliente`, `pedidos_tienda_idtienda`, `pedidos_repartidor_idrepartidor`),
  CONSTRAINT `fk_producto_pedidos1` FOREIGN KEY (`pedidos_idpedido`, `pedidos_cliente/a_idcliente`, `pedidos_tienda_idtienda`, `pedidos_repartidor_idrepartidor`) REFERENCES `pedidos` (`idpedido`, `cliente/a_idcliente`, `tienda_idtienda`, `repartidor_idrepartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidor`
--

DROP TABLE IF EXISTS `repartidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidor` (
  `idrepartidor` int NOT NULL,
  `id_pedido` int DEFAULT NULL,
  `fecha/hora` datetime DEFAULT NULL,
  PRIMARY KEY (`idrepartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidor`
--

LOCK TABLES `repartidor` WRITE;
/*!40000 ALTER TABLE `repartidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `repartidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `idtienda` int NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`idtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 23:37:21
