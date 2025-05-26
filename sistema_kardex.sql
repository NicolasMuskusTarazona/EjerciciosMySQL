-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: sistema_kardex
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

--
-- Base de datos: sistema_kardex
--
DROP DATABASE IF EXISTS sistema_kardex;
CREATE DATABASE sistema_kardex;
USE sistema_kardex;

--
-- Tabla: Categoria
--
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
    `id_categoria` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: TipoProducto
--
DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE `tipo_producto` (
    `id_tipo_producto` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Producto
--
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
    `id_producto` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `descripcion` TEXT,
    `id_tipo_producto` INT NOT NULL,
    PRIMARY KEY (`id_producto`),
    FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto`(`id_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla intermedia: Producto_Categoria (muchos a muchos)
--
DROP TABLE IF EXISTS `producto_categoria`;
CREATE TABLE `producto_categoria` (
    `id_producto` INT NOT NULL,
    `id_categoria` INT NOT NULL,
    PRIMARY KEY (`id_producto`, `id_categoria`),
    FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id_producto`),
    FOREIGN KEY (`id_categoria`) REFERENCES `categoria`(`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Tercero (cliente o proveedor)
--
DROP TABLE IF EXISTS `tercero`;
CREATE TABLE `tercero` (
    `id_tercero` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `tipo` ENUM('cliente', 'proveedor') NOT NULL,
    PRIMARY KEY (`id_tercero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: Movimiento (cabecera)
--
DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento` (
    `id_movimiento` INT NOT NULL AUTO_INCREMENT,
    `fecha` DATETIME NOT NULL,
    `tipo` ENUM('entrada', 'salida') NOT NULL,
    `motivo` VARCHAR(255),
    `id_tercero` INT,
    PRIMARY KEY (`id_movimiento`),
    FOREIGN KEY (`id_tercero`) REFERENCES `tercero`(`id_tercero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tabla: DetalleMovimiento (detalle)
--
DROP TABLE IF EXISTS `detalle_movimiento`;
CREATE TABLE `detalle_movimiento` (
    `id_detalle` INT NOT NULL AUTO_INCREMENT,
    `id_movimiento` INT NOT NULL,
    `id_producto` INT NOT NULL,
    `cantidad` DECIMAL(10,2) NOT NULL,
    `valor_unitario` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`id_detalle`),
    FOREIGN KEY (`id_movimiento`) REFERENCES `movimiento`(`id_movimiento`),
    FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 21:20:42
