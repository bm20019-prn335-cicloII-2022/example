-- Adminer 4.8.1 MySQL 5.5.5-10.9.1-MariaDB-1:10.9.1+maria~jammy dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `bolsa_trabajo`;

SET NAMES utf8mb4;

CREATE TABLE `documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `valor` text COLLATE utf8mb4_bin NOT NULL,
  `fecha_modificacion` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_persona`,`id_tipo_documento`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `experiencia` (
  `id_experiencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `institucion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `posicion_laboral` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_experiencia`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `experiencia_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `formacion` (
  `id_formacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `nivel_educativo` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `institucion` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `titulado` bit(1) NOT NULL DEFAULT b'0',
  `titulo` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_formacion`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `formacion_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `medio_contacto` (
  `id_medio_contacto` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) NOT NULL,
  `id_tipo_medio_contacto` int(11) NOT NULL,
  `valor` text COLLATE utf8mb4_bin NOT NULL,
  `fecha_modificacion` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_medio_contacto`),
  KEY `id_persona` (`id_persona`),
  KEY `id_tipo_medio_contacto` (`id_tipo_medio_contacto`),
  CONSTRAINT `medio_contacto_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `medio_contacto_ibfk_2` FOREIGN KEY (`id_tipo_medio_contacto`) REFERENCES `tipo_medio_contacto` (`id_tipo_medio_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `persona` (
  `id_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `genero` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'f',
  `fecha_nacimiento` date NOT NULL DEFAULT current_timestamp(),
  `direccion` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) COLLATE utf8mb4_bin NOT NULL,
  `expresion_regular` text COLLATE utf8mb4_bin NOT NULL DEFAULT '.',
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


CREATE TABLE `tipo_medio_contacto` (
  `id_tipo_medio_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(155) COLLATE utf8mb4_bin NOT NULL,
  `nombre_visible` varchar(155) COLLATE utf8mb4_bin NOT NULL,
  `indicaciones_llenado` text COLLATE utf8mb4_bin DEFAULT NULL,
  `expresion_regular` text COLLATE utf8mb4_bin NOT NULL DEFAULT '.',
  PRIMARY KEY (`id_tipo_medio_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- 2022-08-26 03:23:11
