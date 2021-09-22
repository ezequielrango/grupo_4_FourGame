CREATE DATABASE  IF NOT EXISTS `fourgame_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fourgame_dev`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fourgame_dev
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` int NOT NULL,
  `number` varchar(255) NOT NULL,
  `postalCode` tinyint NOT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `countryId` int NOT NULL,
  `stateId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_002ec1a0-3ea3-4b13-8c6d-c6165574adb9` (`countryId`),
  KEY `FK_9f6ac0d0-2209-477c-9366-4ee340a1a15e` (`stateId`),
  KEY `FK_eb33374d-1a31-47d4-9011-f1facaeaf53d` (`userId`),
  CONSTRAINT `FK_002ec1a0-3ea3-4b13-8c6d-c6165574adb9` FOREIGN KEY (`countryId`) REFERENCES `countrys` (`id`),
  CONSTRAINT `FK_9f6ac0d0-2209-477c-9366-4ee340a1a15e` FOREIGN KEY (`stateId`) REFERENCES `states` (`id`),
  CONSTRAINT `FK_eb33374d-1a31-47d4-9011-f1facaeaf53d` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'best-seller'),(2,'in-sale'),(3,'new-release');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrys`
--

DROP TABLE IF EXISTS `countrys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrys`
--

LOCK TABLES `countrys` WRITE;
/*!40000 ALTER TABLE `countrys` DISABLE KEYS */;
INSERT INTO `countrys` VALUES (1,'argentina');
/*!40000 ALTER TABLE `countrys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailorder`
--

DROP TABLE IF EXISTS `detailorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e74d7049-449b-4520-9cf0-a650062c7df1` (`productId`),
  KEY `FK_e9397a06-e46e-4ea0-8aa6-b980a2d8da74` (`orderId`),
  CONSTRAINT `FK_e74d7049-449b-4520-9cf0-a650062c7df1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e9397a06-e46e-4ea0-8aa6-b980a2d8da74` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailorder`
--

LOCK TABLES `detailorder` WRITE;
/*!40000 ALTER TABLE `detailorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `detailorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_736122bf-3278-4757-8d0e-5f4e02b22e6d` (`productId`),
  KEY `FK_a16c7b5f-ed29-4ae6-8018-133f0bad20dc` (`userId`),
  CONSTRAINT `FK_736122bf-3278-4757-8d0e-5f4e02b22e6d` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_a16c7b5f-ed29-4ae6-8018-133f0bad20dc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `finalPrice` int unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `cardQuantity` tinyint NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int NOT NULL,
  `addressId` int NOT NULL,
  `payMethodId` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_51ca60e4-c75d-4a21-8e29-cf91e1910d92` (`userId`),
  KEY `FK_47bb05b7-f55c-490a-9ba9-16c1564878b8` (`addressId`),
  KEY `FK_d8dc20de-f195-4d7f-898b-200bf10cf065` (`payMethodId`),
  CONSTRAINT `FK_47bb05b7-f55c-490a-9ba9-16c1564878b8` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_51ca60e4-c75d-4a21-8e29-cf91e1910d92` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_d8dc20de-f195-4d7f-898b-200bf10cf065` FOREIGN KEY (`payMethodId`) REFERENCES `paymethods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymethods`
--

DROP TABLE IF EXISTS `paymethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymethods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymethods`
--

LOCK TABLES `paymethods` WRITE;
/*!40000 ALTER TABLE `paymethods` DISABLE KEYS */;
INSERT INTO `paymethods` VALUES (1,'efectivo'),(2,'cuotas');
/*!40000 ALTER TABLE `paymethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_37e75634-cb13-44fe-81ef-7c03659395cd` (`productId`),
  CONSTRAINT `FK_37e75634-cb13-44fe-81ef-7c03659395cd` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,'ps4.jpg',1),(2,'mando.jpg',1),(3,'ps4_alt.jpg',1),(4,'callOfDuty-ps5.png',2),(5,'img-1628746860772.jpg',3),(6,'ps5.jpg',4),(7,'mando.jpeg',4),(8,'ps5_alt.jpg',4),(9,'PC-Armada-Media-0026_600.jpg',5),(10,'img-1629611566665.jpg',5),(11,'img-1629611566667.jpg',5),(12,'img-1629611566668.jpg',5),(13,'img-1629611566670.jpg',5),(14,'nintendo.jpg',6),(15,'switch.jpg',6),(16,'img-1629678319484.jpg',6),(17,'img-1629678319486.jpg',6),(18,'pc-premire.jpg',7),(19,'disco.jpg',7),(20,'mother.jpg',7),(21,'micro.jpg',7),(22,'gpu.jpg',7),(23,'xbox-s.jpg',8),(24,'spiderman.webp',9),(25,'default-image.png',10);
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int unsigned NOT NULL,
  `discount` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` datetime DEFAULT NULL,
  `delete` tinyint NOT NULL DEFAULT '0',
  `categoryId` int NOT NULL,
  `userId` int NOT NULL,
  `typeProductId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d8c8e5e2-d698-476b-8af2-c309f1f3c67f` (`typeProductId`),
  KEY `FK_418feb3d-d2b5-42bb-adba-044d29827552` (`categoryId`),
  KEY `FK_03a76175-8f9b-4842-825f-5aac561ed541` (`userId`),
  CONSTRAINT `FK_03a76175-8f9b-4842-825f-5aac561ed541` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_418feb3d-d2b5-42bb-adba-044d29827552` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_d8c8e5e2-d698-476b-8af2-c309f1f3c67f` FOREIGN KEY (`typeProductId`) REFERENCES `typeproducts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sony PlayStation 4 Slim 1TB',62980,10,'Con la consola PlayStation 4, líder mundial en ventas durante años, podrás gozar de horas de juego y una excelente navegabilidad para disfrutar de películas, series y contenido online.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,1,1,1),(2,'Call of Duty Black Ops Cold War Standard Edition',5300,10,'Combinando realidad con ficción, Call of Duty es un juego único por su calidad de desarrollo. Su objetivo es que cada jugador logre conquistar todas las misiones, ya sea en una batalla contra otros ejércitos o combatiendo zombies. Sus gráficos, jugabilidad, desafíos e historias han hecho de la franquicia una de las más destacadas dentro de los videojuegos en primera persona.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,2,1,2),(3,'Resident Evil Village Collector\'s Edition Capcom PS4 Físico',7999,0,'Juego para disfrutar con la luz encendida y un rosario en el cuello. No apto para pacientes de riesgo, epilépticos ni vacunados con Sputnik (Los zombies tienen Astrazeneca)','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,3,2,2),(4,'Sony PlayStation 5 825GB Digital Edition White color',234900,15,'Con tu consola PlayStation 5 tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos.PlayStation renovó las expectativas del mundo virtual con esta nueva consola y su gran rendimiento. Cuenta con una interfaz de usuario más rápida y fácil de navegar que en anteriores modelos. Además, podrás jugar durante horas desafiando a millones de contrincantes alrededor del mundo que esperan nuevos retos.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,3,2,1),(5,'Pc Ryzen 3 ,msi A320M PRO MAX ,8gb oloy',105599,15,'Pc Ryzen 3 3200G ,msi A320M PRO MAX,8GB oloy RGB,Fuente cooler master smart 600w','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,2,1,3),(6,'Super Smash Bros Ultimate Standard Edition Nintendo Switch Físico',1980,10,'Este videojuego de acción y pelea combina diversos personajes de distintas sagas de Nintendo y otras editoriales, con más de 100 escenarios disponibles, 74 luchadores y más de 800 temas musicales. Esto convierte a Super Smash Bros Ultimate en un juego con un sinfín de aventuras y posibilidades de enfrentar a luchadores muy distintos entre sí.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,2,1,2),(7,'Amd Ryzen 5 3600X + B450M + 16gb Ddr4 + 1tb',162980,25,'PLACA DE VIDEO 1x MSI RADEON RX 570 ARMOR 4GB OC DDR5 DUAL FAN (NO UTILIZAR) ALMACENAMIENTO 1x WESTERN DIGITAL NO UTILIZAR - EX DISCO HDD 1TB BLUE - NO UTILIZAR - FUENTES UPS Y CABLES MOD 1x SENTEY FUENTE 550W SNP-HS WHITE 80+ MEMORIAS RAM 1x CRUCIAL MEMORIA RAM 16GB 3200MHZ BALLISTIX SPORT LT WHITE DDR4 MOTHERBOARDS 1x ASUS MOTHER B450M-A PRIME CSM AM4 AMD ALMACENAMIENTO 1x ADATA SSD M.2 256GB XPG GAMMIX S11 PRO M.2 NVME 3500 MB GABINETE 1x LNZ GABINETE LZ40 RGB PROCESADORES 1x AMD MICRO RYZEN 5 3600X 4.4GHz TURBO AM4','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,1,1,3),(8,'Microsoft Xbox Series S 512GB color blanco',89999,20,'La nueva generación de consolas está comandada por la Xbox Series que llegó al mercado para sorprender a todos. Su potencia y alto rendimiento te permitirá reducir las horas de descarga de juegos y contenido de manera considerable en comparación con otras consolas. Además, vas a poder jugar durante horas mientras te divertís con jugadores de todo el mundo.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,1,2,1),(9,'Marvel\'s Spider-Man Miles Morales Standard Edition Sony PS5 Físico',2980,0,'Disfruta de ésta edición, acompañando a Peter Parker en sus aventuras.','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,0,1,2,2),(10,'juan de giorgi',70000,40,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2021-09-22 02:27:14','2021-09-22 02:27:26',NULL,0,3,1,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `countryId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2fc1f8d8-a93f-457f-9e82-34fe537bcec3` (`countryId`),
  CONSTRAINT `FK_2fc1f8d8-a93f-457f-9e82-34fe537bcec3` FOREIGN KEY (`countryId`) REFERENCES `countrys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Buenos Aires',1),(2,'Catamarca',1),(3,'Chaco',1),(4,'Chubut',1),(5,'Córdoba',1),(6,'Corrientes',1),(7,'Entre Ríos',1),(8,'Formosa',1),(9,'Jujuy',1),(10,'La Pampa',1),(11,'La Rioja',1),(12,'Mendoza',1),(13,'Misiones',1),(14,'Neuquén',1),(15,'Río Negro',1),(16,'Salta',1),(17,'San Juan',1),(18,'San Luis',1),(19,'Santa Cruz',1),(20,'Santa Fe',1),(21,'Santiago del Estero',1),(22,'Tierra del Fuego',1),(23,'Tucumán',1);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeproducts`
--

DROP TABLE IF EXISTS `typeproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeproducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeproducts`
--

LOCK TABLES `typeproducts` WRITE;
/*!40000 ALTER TABLE `typeproducts` DISABLE KEYS */;
INSERT INTO `typeproducts` VALUES (1,'consolas'),(2,'juegos'),(3,'pc');
/*!40000 ALTER TABLE `typeproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default-user-image.png',
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` datetime DEFAULT NULL,
  `loginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete` tinyint NOT NULL DEFAULT '0',
  `accessId` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_feb7d98d-c838-4adb-b8c3-a1b4c1ca5668` (`accessId`),
  CONSTRAINT `FK_feb7d98d-c838-4adb-b8c3-a1b4c1ca5668` FOREIGN KEY (`accessId`) REFERENCES `access` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'juan','juanmadegiorgi@gmail.com','img-1630181477130.png','$2a$12$wL2ZSsc19lTwGCqZiUC4GedUcwQILqXtakNLsEdiVefjho7MKMMNu','2021-09-22 02:16:18','2021-09-22 02:26:56',NULL,'2021-09-22 02:26:56',0,2),(2,'Rango','ezequielrango290@gmail.com','img-1630902354443.jpg','$2a$12$ADn4LaKEisc1oTVlijocyuPCOCnUCyklVv0h8r5vwd2tpSHWnZGnK','2021-09-22 02:16:18','2021-09-22 02:16:18',NULL,'2021-09-22 02:16:18',0,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21 23:51:55