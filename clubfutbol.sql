-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: clubfutbol
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `clubfutbol`;
CREATE DATABASE `clubfutbol`;
USE `clubfutbol`;

--
-- Table structure for table `Sede`
--

DROP TABLE IF EXISTS `Sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sede` (
    `id_sede` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `direccion` varchar(255),
    `telefono` varchar(20),
    PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
    `id_categoria` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Jugador`
--

DROP TABLE IF EXISTS `Jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador` (
    `id_jugador` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `fecha_nacimiento` date,
    `id_categoria` int,
    PRIMARY KEY (`id_jugador`),
    FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProgramaEntrenamiento`
--

DROP TABLE IF EXISTS `ProgramaEntrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProgramaEntrenamiento` (
    `id_programa` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `descripcion` text,
    `id_sede` int,
    PRIMARY KEY (`id_programa`),
    FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SesionEntrenamiento`
--

DROP TABLE IF EXISTS `SesionEntrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SesionEntrenamiento` (
    `id_sesion` int NOT NULL AUTO_INCREMENT,
    `id_programa` int,
    `fecha` date,
    `objetivos` text,
    PRIMARY KEY (`id_sesion`),
    FOREIGN KEY (`id_programa`) REFERENCES `ProgramaEntrenamiento` (`id_programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Jugador_Programa`
--

DROP TABLE IF EXISTS `Jugador_Programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador_Programa` (
    `id_jugador` int,
    `id_programa` int,
    PRIMARY KEY (`id_jugador`, `id_programa`),
    FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id_jugador`),
    FOREIGN KEY (`id_programa`) REFERENCES `ProgramaEntrenamiento` (`id_programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Evento`
--

DROP TABLE IF EXISTS `Evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento` (
    `id_evento` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `fecha` date,
    `ubicacion` varchar(255),
    `estado` varchar(50),
    PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Personal`
--

DROP TABLE IF EXISTS `Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personal` (
    `id_personal` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `rol` varchar(50),
    PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Evento_Personal`
--

DROP TABLE IF EXISTS `Evento_Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Personal` (
    `id_evento` int,
    `id_personal` int,
    PRIMARY KEY (`id_evento`, `id_personal`),
    FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id_evento`),
    FOREIGN KEY (`id_personal`) REFERENCES `Personal` (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Patrocinador`
--

DROP TABLE IF EXISTS `Patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patrocinador` (
    `id_patrocinador` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `contacto` varchar(100),
    PRIMARY KEY (`id_patrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Evento_Patrocinador`
--

DROP TABLE IF EXISTS `Evento_Patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Patrocinador` (
    `id_evento` int,
    `id_patrocinador` int,
    PRIMARY KEY (`id_evento`, `id_patrocinador`),
    FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id_evento`),
    FOREIGN KEY (`id_patrocinador`) REFERENCES `Patrocinador` (`id_patrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Incidencia`
--

DROP TABLE IF EXISTS `Incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incidencia` (
    `id_incidencia` int NOT NULL AUTO_INCREMENT,
    `id_evento` int,
    `descripcion` text,
    `accion_tomada` text,
    `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_incidencia`),
    FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Recurso`
--

DROP TABLE IF EXISTS `Recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recurso` (
    `id_recurso` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100),
    `tipo` varchar(50),
    `descripcion` text,
    PRIMARY KEY (`id_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Evento_Recurso`
--

DROP TABLE IF EXISTS `Evento_Recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Recurso` (
    `id_evento` int,
    `id_recurso` int,
    PRIMARY KEY (`id_evento`, `id_recurso`),
    FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id_evento`),
    FOREIGN KEY (`id_recurso`) REFERENCES `Recurso` (`id_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 21:12:37
