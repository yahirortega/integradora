-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2023 a las 16:46:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prestamos1_3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `ape_pat` varchar(25) NOT NULL,
  `ape_mat` varchar(25) NOT NULL,
  `id_genero` tinyint(4) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_nivelEdu` tinyint(4) NOT NULL,
  `id_ocupacion` tinyint(4) NOT NULL,
  `ingresos_mensuales` float DEFAULT NULL,
  `curp` varchar(18) NOT NULL,
  `tel_cel` varchar(10) NOT NULL,
  `tel_casa` varchar(12) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(150) NOT NULL,
  `rol` varchar(15) NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_usuario`, `nombre`, `ape_pat`, `ape_mat`, `id_genero`, `fecha_nacimiento`, `id_nivelEdu`, `id_ocupacion`, `ingresos_mensuales`, `curp`, `tel_cel`, `tel_casa`, `email`, `password`, `rol`) VALUES
(2, 'yahir', 'ortega', 'lavalle', 1, '2002-04-02', 3, 1, 11111100, '222222222222222222', '2411809501', '2411809502', 'gemah@gmail.com', 'pbkdf2:sha256:600000$bzS8cstpvZYs6wI8$2f8e3f19687f77f5119aa89a970112808dbc81817285d764a90f3a499e51a8b5', 'admin'),
(3, 'Adriana', 'Medina', 'Montiel', 2, '2004-05-22', 3, 2, 2000, '222222222222222222', '2412384306', '', 'adri@gmail.com', 'pbkdf2:sha256:600000$uhuYEnYOx87uuYZC$72ee58e1d0145887e3aa45830cf52056a303c5ffc045164f05308dd39a731420', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id_domicilio` int(10) NOT NULL,
  `id_estado` tinyint(4) UNSIGNED NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `cp` mediumint(5) NOT NULL,
  `tipo_asen` tinyint(4) NOT NULL,
  `asentamiento` varchar(60) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `num_ext` smallint(5) UNSIGNED DEFAULT NULL,
  `num_int` smallint(5) UNSIGNED DEFAULT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` tinyint(4) UNSIGNED NOT NULL,
  `estado` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `estado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Coahuila'),
(6, 'Colima'),
(7, 'Chiapas'),
(8, 'Chihuahua'),
(9, 'Ciudad de México'),
(10, 'Durango'),
(11, 'Estado de México'),
(12, 'Guanajuato'),
(13, 'Guerrero'),
(14, 'Hidalgo'),
(15, 'Jalisco'),
(16, 'Michoacán'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz'),
(31, 'Yucatán'),
(32, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` tinyint(4) NOT NULL,
  `genero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades_pago`
--

CREATE TABLE `modalidades_pago` (
  `id_modalidad` tinyint(4) NOT NULL,
  `modalidad_pago` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidades_pago`
--

INSERT INTO `modalidades_pago` (`id_modalidad`, `modalidad_pago`) VALUES
(1, 'Quincenal'),
(2, 'Mensual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_educativo`
--

CREATE TABLE `nivel_educativo` (
  `id_nivelEdu` tinyint(4) NOT NULL,
  `nivelEdu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel_educativo`
--

INSERT INTO `nivel_educativo` (`id_nivelEdu`, `nivelEdu`) VALUES
(1, 'Sin estudios'),
(2, 'Educación básica'),
(3, 'Preparatoria'),
(4, 'Licenciatura '),
(5, 'Ingeniería'),
(6, 'Maestría o Superior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `id_ocupacion` tinyint(4) NOT NULL,
  `ocupacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ocupacion`
--

INSERT INTO `ocupacion` (`id_ocupacion`, `ocupacion`) VALUES
(1, 'Empleado del sector privado'),
(2, 'Empleado del sector público');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `monto` float UNSIGNED NOT NULL,
  `periodo` tinyint(3) UNSIGNED NOT NULL,
  `modalidad_pago` tinyint(4) NOT NULL,
  `fecha_in` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_asen`
--

CREATE TABLE `tipos_asen` (
  `id_tipo_asen` tinyint(4) NOT NULL,
  `tipoAsen` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_asen`
--

INSERT INTO `tipos_asen` (`id_tipo_asen`, `tipoAsen`) VALUES
(1, 'Ampliación'),
(2, 'Barrio'),
(3, 'Ciudad'),
(4, 'Ciudad Industrial'),
(5, 'Colonia'),
(6, 'Condominio'),
(7, 'Conjunto Habitacional'),
(8, 'Corredor Industrial'),
(9, 'Ejido'),
(10, 'Exhacienda'),
(11, 'Fracción'),
(12, 'Fraccionamiento'),
(13, 'Granja'),
(14, 'Hacienda'),
(15, 'Manzana'),
(16, 'Paraje'),
(17, 'Privada'),
(18, 'Prolongación'),
(19, 'Pueblo'),
(20, 'Puerto'),
(21, 'Ranchería'),
(22, 'Rancho'),
(23, 'Región'),
(24, 'Residencial'),
(25, 'Rinconada'),
(26, 'Sección'),
(27, 'Sector'),
(28, 'Supermanzana'),
(29, 'Unidad'),
(30, 'Unidad Habitacional'),
(31, 'Villa'),
(32, 'Zona Federal'),
(33, 'Zona Industrial'),
(34, 'Zona Militar');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes` (
`nombre` varchar(25)
,`ape_pat` varchar(25)
,`ape_mat` varchar(25)
,`genero` varchar(10)
,`fecha_nacimiento` date
,`nivelEdu` varchar(30)
,`ocupacion` varchar(30)
,`ingresos_mensuales` float
,`curp` varchar(18)
,`tel_cel` varchar(10)
,`tel_casa` varchar(12)
,`email` varchar(254)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes`
--
DROP TABLE IF EXISTS `vista_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes`  AS SELECT `clientes`.`nombre` AS `nombre`, `clientes`.`ape_pat` AS `ape_pat`, `clientes`.`ape_mat` AS `ape_mat`, `genero`.`genero` AS `genero`, `clientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `nivel_educativo`.`nivelEdu` AS `nivelEdu`, `ocupacion`.`ocupacion` AS `ocupacion`, `clientes`.`ingresos_mensuales` AS `ingresos_mensuales`, `clientes`.`curp` AS `curp`, `clientes`.`tel_cel` AS `tel_cel`, `clientes`.`tel_casa` AS `tel_casa`, `clientes`.`email` AS `email` FROM (((`clientes` join `genero` on(`clientes`.`id_genero` = `genero`.`id_genero`)) join `nivel_educativo` on(`clientes`.`id_nivelEdu` = `nivel_educativo`.`id_nivelEdu`)) join `ocupacion` on(`clientes`.`id_ocupacion` = `ocupacion`.`id_ocupacion`)) WHERE `clientes`.`rol` = 'cliente' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_ocupacion` (`id_ocupacion`),
  ADD KEY `fk_nivelEducativo` (`id_nivelEdu`),
  ADD KEY `fk_genero` (`id_genero`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD KEY `cp` (`cp`),
  ADD KEY `municipios_idx` (`municipio`),
  ADD KEY `fk_domicilio_estados_idx` (`id_estado`),
  ADD KEY `fk_domicilio_clientes` (`id_cliente`),
  ADD KEY `fk_domicilio_tipoAsentamiento` (`tipo_asen`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `modalidades_pago`
--
ALTER TABLE `modalidades_pago`
  ADD PRIMARY KEY (`id_modalidad`);

--
-- Indices de la tabla `nivel_educativo`
--
ALTER TABLE `nivel_educativo`
  ADD PRIMARY KEY (`id_nivelEdu`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`id_ocupacion`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `fk_prestamo_cliente` (`id_cliente`),
  ADD KEY `fk_prestamo_modalidad` (`modalidad_pago`);

--
-- Indices de la tabla `tipos_asen`
--
ALTER TABLE `tipos_asen`
  ADD PRIMARY KEY (`id_tipo_asen`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modalidades_pago`
--
ALTER TABLE `modalidades_pago`
  MODIFY `id_modalidad` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `nivel_educativo`
--
ALTER TABLE `nivel_educativo`
  MODIFY `id_nivelEdu` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `id_ocupacion` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_asen`
--
ALTER TABLE `tipos_asen`
  MODIFY `id_tipo_asen` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `fk_nivelEducativo` FOREIGN KEY (`id_nivelEdu`) REFERENCES `nivel_educativo` (`id_nivelEdu`),
  ADD CONSTRAINT `fk_ocupacion` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `fk_domicilio_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_usuario`),
  ADD CONSTRAINT `fk_domicilio_estados` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `fk_domicilio_tipoAsentamiento` FOREIGN KEY (`tipo_asen`) REFERENCES `tipos_asen` (`id_tipo_asen`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_prestamo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_usuario`),
  ADD CONSTRAINT `fk_prestamo_modalidad` FOREIGN KEY (`modalidad_pago`) REFERENCES `modalidades_pago` (`id_modalidad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
