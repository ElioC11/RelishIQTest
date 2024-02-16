-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para relish
CREATE DATABASE IF NOT EXISTS `relish` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `relish`;

-- Volcando estructura para tabla relish.address
CREATE TABLE IF NOT EXISTS `address` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `street` varchar(50) DEFAULT NULL,
  `suite` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `geo` int DEFAULT NULL,
  PRIMARY KEY (`idaddress`),
  KEY `FK_address_geo` (`geo`),
  CONSTRAINT `FK_address_geo` FOREIGN KEY (`geo`) REFERENCES `geo` (`idgeo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.address: ~1 rows (aproximadamente)
INSERT INTO `address` (`idaddress`, `street`, `suite`, `city`, `zipcode`, `geo`) VALUES
	(1, 'Kulas Light', 'Apt. 556', 'Gwenborough', '92998-3874', 1);

-- Volcando estructura para tabla relish.album
CREATE TABLE IF NOT EXISTS `album` (
  `idalbum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  PRIMARY KEY (`idalbum`),
  KEY `FK__users` (`iduser`),
  CONSTRAINT `FK__users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.album: ~1 rows (aproximadamente)
INSERT INTO `album` (`idalbum`, `title`, `iduser`) VALUES
	(1, 'quidem molestiae enim', 1);

-- Volcando estructura para tabla relish.company
CREATE TABLE IF NOT EXISTS `company` (
  `idcompany` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `catchPhrase` varchar(50) DEFAULT NULL,
  `bs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.company: ~1 rows (aproximadamente)
INSERT INTO `company` (`idcompany`, `name`, `catchPhrase`, `bs`) VALUES
	(1, 'Romaguera-Crona', 'Multi-layered client-server neural-net', 'harness real-time e-markets');

-- Volcando estructura para tabla relish.geo
CREATE TABLE IF NOT EXISTS `geo` (
  `idgeo` int NOT NULL AUTO_INCREMENT,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  PRIMARY KEY (`idgeo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.geo: ~1 rows (aproximadamente)
INSERT INTO `geo` (`idgeo`, `lat`, `lng`) VALUES
	(1, -37.3159, 81.1496);

-- Volcando estructura para tabla relish.photos
CREATE TABLE IF NOT EXISTS `photos` (
  `idphoto` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `thumbnailUrl` varchar(50) DEFAULT NULL,
  `idalbum` int DEFAULT NULL,
  PRIMARY KEY (`idphoto`),
  KEY `FK__album` (`idalbum`),
  CONSTRAINT `FK__album` FOREIGN KEY (`idalbum`) REFERENCES `album` (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.photos: ~1 rows (aproximadamente)
INSERT INTO `photos` (`idphoto`, `title`, `url`, `thumbnailUrl`, `idalbum`) VALUES
	(1, 'accusamus beatae ad facilis cum similique qui sunt', 'https://via.placeholder.com/600/92c952', 'https://via.placeholder.com/150/92c952', 1);

-- Volcando estructura para tabla relish.users
CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `website` varchar(50) DEFAULT NULL,
  `idaddress` int DEFAULT NULL,
  `idcompany` int DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  KEY `FK_users_address` (`idaddress`),
  KEY `FK_users_company` (`idcompany`),
  CONSTRAINT `FK_users_address` FOREIGN KEY (`idaddress`) REFERENCES `address` (`idaddress`),
  CONSTRAINT `FK_users_company` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla relish.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`iduser`, `name`, `username`, `email`, `phone`, `website`, `idaddress`, `idcompany`) VALUES
	(1, 'Elio', 'elioC911', 'Sincere@april.biz', '1-770-736-8031 x56442', 'hildegard.org', 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
