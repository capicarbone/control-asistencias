-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-11-2012 a las 16:36:39
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `control-asistencias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asist_asistencia`
--

CREATE TABLE IF NOT EXISTS `asist_asistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `punto` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asist_asistencia_alumno_id_90ea2_uniq` (`alumno_id`,`clase_id`),
  KEY `asist_asistencia_7e8dc332` (`alumno_id`),
  KEY `asist_asistencia_6290ba1d` (`clase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Volcado de datos para la tabla `asist_asistencia`
--

INSERT INTO `asist_asistencia` (`id`, `alumno_id`, `clase_id`, `punto`) VALUES
(2, 3, 1, 1),
(13, 27, 3, 1),
(14, 9, 3, 0),
(15, 39, 3, 0),
(16, 3, 3, 1),
(23, 25, 3, 1),
(24, 38, 3, 1),
(25, 39, 1, 0),
(27, 32, 1, 1),
(28, 25, 1, 1),
(31, 9, 1, 1),
(36, 38, 1, 1),
(37, 27, 1, 1),
(49, 32, 3, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asist_asistencia`
--
ALTER TABLE `asist_asistencia`
  ADD CONSTRAINT `alumno_id_refs_id_1f235637` FOREIGN KEY (`alumno_id`) REFERENCES `asist_alumno` (`id`),
  ADD CONSTRAINT `clase_id_refs_id_2ef3b5ea` FOREIGN KEY (`clase_id`) REFERENCES `asist_clase` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
