-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2023 a las 17:19:48
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
-- Base de datos: `prestamos1_2`
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
  `calle` varchar(50) NOT NULL,
  `num_ext` smallint(5) UNSIGNED DEFAULT NULL,
  `num_int` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_usuario`, `nombre`, `ape_pat`, `ape_mat`, `id_genero`, `fecha_nacimiento`, `id_nivelEdu`, `id_ocupacion`, `ingresos_mensuales`, `curp`, `tel_cel`, `tel_casa`, `email`, `password`, `calle`, `num_ext`, `num_int`) VALUES
(1, 'Angel', 'Perez', 'Rodriguez', 1, '2023-08-02', 1, 1, 2000, 'PERA030717HTLRDNA4', '2471014138', '2453511112', 'ared230000@gmail.com', 'pbkdf2:sha256:600000$XOPz67ueeRwDZGAT$33672a4634dcc47bfc2061bb6d00c3055fc6cbea347f8b0ea375b4f11c675f03', 'Andador Los Reyes', 60, 1),
(2, 'Diana', 'Rodriguez', 'Rodriguez', 2, '2001-08-12', 4, 1, 7000, 'PERA030717HTLRDNA4', '2411342422', '2453511111', 'ared17@outlook.com', 'pbkdf2:sha256:600000$NrNEpHTQodc8cFMr$a15c1e3c917fc9a19123afd6275d21c522f1bab6fd7fee91963d733c6c0243f7', 'Andador Los Reyes', 60, 2);

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
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `fk_nivelEducativo` FOREIGN KEY (`id_nivelEdu`) REFERENCES `nivel_educativo` (`id_nivelEdu`),
  ADD CONSTRAINT `fk_ocupacion` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
