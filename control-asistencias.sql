-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-11-2012 a las 18:24:30
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
-- Estructura de tabla para la tabla `asist_alumno`
--

CREATE TABLE IF NOT EXISTS `asist_alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` varchar(9) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asist_alumno_3a4655fd` (`seccion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `asist_alumno`
--

INSERT INTO `asist_alumno` (`id`, `nombre`, `apellido`, `cedula`, `seccion_id`) VALUES
(1, 'Natasha', 'Alvarez', '20503873', 1),
(2, 'Jaynires', 'Araque', '21235003', 1),
(3, 'Abril', 'Bravo', '20807399', 1),
(9, 'Asdrúbal', 'Carrasquel', '19864650', 1),
(10, 'Hugo', 'Carvajal', '19419310', 1),
(11, 'Perci', 'Divapuri', 'E06855274', 1),
(12, 'Frandis', 'Fermín', 'V20300946', 1),
(13, 'Luis', 'Figueroa', 'V24847531', 1),
(14, 'Osmary', 'Flores', '22716823', 1),
(15, 'Leonardo', 'García', '19095432', 1),
(16, 'Eladio', 'Godoy', '21451328', 1),
(17, 'Gerardo', 'Gonzalez', '20808633', 1),
(18, 'Victor', 'Gonzalez', '19635693', 1),
(19, 'Catherine', 'Graterol', '19905679', 1),
(20, 'Yorge', 'Guerra', 'V16614345', 1),
(21, 'Keidy', 'Guzmán', '19910317', 1),
(22, 'Christian', 'Hernandez', '19419621', 1),
(23, 'Deymar', 'Idrogo', '19159975', 1),
(24, 'Yudeisy', 'Jaramillo', '19041983', 1),
(25, 'Antonio', 'Leon', '16556852', 1),
(26, 'Pool', 'Lopez', '20806613', 1),
(27, 'Arturo', 'Lopez', '18885268', 1),
(28, 'Ximara', 'Machado', '20136688', 1),
(29, 'Yusnaira', 'Malave', '20036788', 1),
(30, 'Carmen', 'Martinez', '20506749', 1),
(31, 'Rosemery ', 'Martinez', '19419437', 1),
(32, 'Angelica', 'Martinez', '22822827', 1),
(33, 'Edwin', 'Mendez', '24796323', 1),
(34, 'Fiorella', 'Moreno', '21247696', 1),
(35, 'Aurelis', 'Moreno', '18885399', 1),
(36, 'Miguel', 'Mujica', '20223197', 1),
(37, 'Josmary', 'Polo', '20503085', 1),
(38, 'Aristides', 'Pulvett', '20934387', 1),
(39, 'Abraham', 'Quintero', '17631328', 1),
(40, 'Jesus', 'Ricupero', '19621892', 1),
(41, 'Tania', 'Rodriguez', '22833214', 1),
(42, 'Ender', 'Salazar', '18076040', 1),
(43, 'Gelys', 'Salazar', '23552684', 1),
(44, 'Francelis', 'Tablante', '21498346', 1),
(45, 'Bexi', 'Velasquez', '23501295', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asist_clase`
--

CREATE TABLE IF NOT EXISTS `asist_clase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` longtext NOT NULL,
  `lugar` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `asist_clase`
--

INSERT INTO `asist_clase` (`id`, `fecha`, `descripcion`, `lugar`) VALUES
(1, '2012-11-08', 'Arreglos y prácticas de cadenas.', 'L'),
(3, '2012-11-06', 'Práctica de cadenas', 'L'),
(4, '2012-11-15', '', 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asist_seccion`
--

CREATE TABLE IF NOT EXISTS `asist_seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor` varchar(2) NOT NULL,
  `materia` varchar(3) NOT NULL,
  `numero` int(11) NOT NULL,
  `periodo` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `asist_seccion`
--

INSERT INTO `asist_seccion` (`id`, `profesor`, `materia`, `numero`, `periodo`) VALUES
(1, 'AL', 'PII', 3, '12II'),
(2, 'OS', 'PII', 4, '12II'),
(3, 'OS', 'PII', 5, '12II');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add migration history', 8, 'add_migrationhistory'),
(23, 'Can change migration history', 8, 'change_migrationhistory'),
(24, 'Can delete migration history', 8, 'delete_migrationhistory'),
(25, 'Can add clase', 9, 'add_clase'),
(26, 'Can change clase', 9, 'change_clase'),
(27, 'Can delete clase', 9, 'delete_clase'),
(28, 'Can add alumno', 10, 'add_alumno'),
(29, 'Can change alumno', 10, 'change_alumno'),
(30, 'Can delete alumno', 10, 'delete_alumno'),
(31, 'Can add asistencia', 11, 'add_asistencia'),
(32, 'Can change asistencia', 11, 'change_asistencia'),
(33, 'Can delete asistencia', 11, 'delete_asistencia'),
(34, 'Can add seccion', 12, 'add_seccion'),
(35, 'Can change seccion', 12, 'change_seccion'),
(36, 'Can delete seccion', 12, 'delete_seccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'capi', '', '', 'cpinelly@gmail.com', 'pbkdf2_sha256$10000$b0dTqE2rmSlN$9+0AVtxikMnHQyZmUhBv4kyBGrmmT9/sh+nkQaPIj2Y=', 1, 1, 1, '2012-11-10 23:32:30', '2012-11-09 04:11:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2012-11-09 04:36:53', 1, 12, '1', 'Seccion object', 1, ''),
(2, '2012-11-09 04:37:08', 1, 12, '2', 'Seccion object', 1, ''),
(3, '2012-11-09 04:37:10', 1, 12, '2', 'Seccion object', 2, 'No fields changed.'),
(4, '2012-11-09 04:37:19', 1, 12, '3', 'Seccion object', 1, ''),
(5, '2012-11-09 04:54:48', 1, 10, '1', 'Alumno object', 1, ''),
(6, '2012-11-09 05:00:07', 1, 10, '2', 'Jaynires Araque, Sec. 3', 1, ''),
(7, '2012-11-09 05:00:22', 1, 10, '3', 'Abril Bravo, Sec. 3', 1, ''),
(8, '2012-11-09 05:09:37', 1, 10, '9', 'Asdrúbal Carrasquel, Sec. 3 ', 1, ''),
(9, '2012-11-09 05:10:24', 1, 10, '10', 'Hugo Carvajal, Sec. 3 ', 1, ''),
(10, '2012-11-09 05:10:56', 1, 10, '11', 'Perci Divapuri, Sec. 3 ', 1, ''),
(11, '2012-11-09 05:11:21', 1, 10, '12', 'Frandis Fermín, Sec. 3 ', 1, ''),
(12, '2012-11-09 05:11:50', 1, 10, '13', 'Luis Figueroa, Sec. 3 ', 1, ''),
(13, '2012-11-09 05:12:18', 1, 10, '14', 'Osmary Flores, Sec. 3 ', 1, ''),
(14, '2012-11-09 05:12:38', 1, 10, '15', 'Leonardo García, Sec. 3 ', 1, ''),
(15, '2012-11-09 05:12:52', 1, 10, '16', 'Eladio Godoy, Sec. 3 ', 1, ''),
(16, '2012-11-09 05:13:07', 1, 10, '17', 'Gerardo Gonzalez, Sec. 3 ', 1, ''),
(17, '2012-11-09 05:13:28', 1, 10, '18', 'Victor Gonzalez, Sec. 3 ', 1, ''),
(18, '2012-11-09 05:13:49', 1, 10, '19', 'Catherine Graterol, Sec. 3 ', 1, ''),
(19, '2012-11-09 05:14:20', 1, 10, '20', 'Yorge Guerra, Sec. 3 ', 1, ''),
(20, '2012-11-09 05:14:41', 1, 10, '21', 'Keidy Guzmán, Sec. 3 ', 1, ''),
(21, '2012-11-09 05:15:04', 1, 10, '22', 'Christian Hernandez, Sec. 3 ', 1, ''),
(22, '2012-11-09 05:15:23', 1, 10, '23', 'Deymar Idrogo, Sec. 3 ', 1, ''),
(23, '2012-11-09 05:15:51', 1, 10, '24', 'Yudeisy Jaramillo, Sec. 3 ', 1, ''),
(24, '2012-11-09 05:16:08', 1, 10, '25', 'Antonio Leon, Sec. 3 ', 1, ''),
(25, '2012-11-09 05:16:32', 1, 10, '26', 'Pool Lopez, Sec. 3 ', 1, ''),
(26, '2012-11-09 05:16:46', 1, 10, '27', 'Arturo Lopez, Sec. 3 ', 1, ''),
(27, '2012-11-09 05:17:04', 1, 10, '28', 'Ximara Machado, Sec. 3 ', 1, ''),
(28, '2012-11-09 05:17:21', 1, 10, '29', 'Yusnaira Malave, Sec. 3 ', 1, ''),
(29, '2012-11-09 05:17:36', 1, 10, '30', 'Carmen Martinez, Sec. 3 ', 1, ''),
(30, '2012-11-09 05:18:05', 1, 10, '31', 'Rosemery  Martinez, Sec. 3 ', 1, ''),
(31, '2012-11-09 05:18:20', 1, 10, '32', 'Angelica Martinez, Sec. 3 ', 1, ''),
(32, '2012-11-09 05:18:49', 1, 10, '33', 'Edwin Mendez, Sec. 3 ', 1, ''),
(33, '2012-11-09 05:19:06', 1, 10, '34', 'Fiorella Moreno, Sec. 3 ', 1, ''),
(34, '2012-11-09 05:19:20', 1, 10, '35', 'Aurelis Moreno, Sec. 3 ', 1, ''),
(35, '2012-11-09 05:19:32', 1, 10, '36', 'Miguel Mujica, Sec. 3 ', 1, ''),
(36, '2012-11-09 05:19:45', 1, 10, '37', 'Josmary Pol, Sec. 3 ', 1, ''),
(37, '2012-11-09 05:20:02', 1, 10, '38', 'Aristides Pulvett, Sec. 3 ', 1, ''),
(38, '2012-11-09 05:20:19', 1, 10, '39', 'Abraham Quintero, Sec. 3 ', 1, ''),
(39, '2012-11-09 05:20:35', 1, 10, '40', 'Jesus Ricupero, Sec. 3 ', 1, ''),
(40, '2012-11-09 05:20:50', 1, 10, '41', 'Tania Rodriguez, Sec. 3 ', 1, ''),
(41, '2012-11-09 05:21:07', 1, 10, '42', 'Ender Salazar, Sec. 3 ', 1, ''),
(42, '2012-11-09 05:21:28', 1, 10, '43', 'Gelys Salazar, Sec. 3 ', 1, ''),
(43, '2012-11-09 05:21:49', 1, 10, '44', 'Francelis Tablante, Sec. 3 ', 1, ''),
(44, '2012-11-09 05:22:02', 1, 10, '45', 'Bexi Velasquez, Sec. 3 ', 1, ''),
(45, '2012-11-09 05:22:37', 1, 10, '37', 'Josmary Polo, Sec. 3 ', 2, 'Changed apellido.'),
(46, '2012-11-09 05:59:35', 1, 12, '3', 'Seccion 5, Prof. Oscar Salazar', 2, 'Changed numero.'),
(47, '2012-11-10 22:42:28', 1, 9, '1', 'Clase object', 1, ''),
(48, '2012-11-10 22:45:05', 1, 9, '3', 'Clases del %s2012-11-06', 1, ''),
(49, '2012-11-10 22:45:30', 1, 9, '4', 'Clases del 2012-11-15', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'migration history', 'south', 'migrationhistory'),
(9, 'clase', 'asist', 'clase'),
(10, 'alumno', 'asist', 'alumno'),
(11, 'asistencia', 'asist', 'asistencia'),
(12, 'seccion', 'asist', 'seccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('516bad3206b0b347d0020a1db26aa24f', 'ZTcxNzg0YzEyNGI3ZjZiYjgzMjE3ZTBlYWMwZTY2ZWE1MzMxZDliNDqAAn1xAS4=\n', '2012-11-27 00:50:00'),
('baf61c8ef1781c0f75cd1a17af004ae9', 'MjM1YjA1MTE5ZjdkMDU3MDU4NDI0OGM0NjIzOTAzZTAwNWE1YzMyOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-11-24 23:32:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `south_migrationhistory`
--

CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `south_migrationhistory`
--

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`) VALUES
(1, 'asist', '0001_initial', '2012-11-09 04:11:24'),
(2, 'asist', '0002_auto__add_unique_asistencia_alumno_clase__chg_field_clase_fecha', '2012-11-14 16:35:58');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asist_alumno`
--
ALTER TABLE `asist_alumno`
  ADD CONSTRAINT `seccion_id_refs_id_782a7c70` FOREIGN KEY (`seccion_id`) REFERENCES `asist_seccion` (`id`);

--
-- Filtros para la tabla `asist_asistencia`
--
ALTER TABLE `asist_asistencia`
  ADD CONSTRAINT `alumno_id_refs_id_1f235637` FOREIGN KEY (`alumno_id`) REFERENCES `asist_alumno` (`id`),
  ADD CONSTRAINT `clase_id_refs_id_2ef3b5ea` FOREIGN KEY (`clase_id`) REFERENCES `asist_clase` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
