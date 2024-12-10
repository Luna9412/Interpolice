-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 06:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interpolice`
--

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(150) DEFAULT NULL,
  `apodo` varchar(200) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `foto` varchar(256) NOT NULL,
  `fechanace` date NOT NULL,
  `especie_ciudadano_idespecie_ciudadano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citizen_has_registro_delito`
--

CREATE TABLE `citizen_has_registro_delito` (
  `citizen_id` int(11) NOT NULL,
  `registro_delito_idregistro_delito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especie_ciudadano`
--

CREATE TABLE `especie_ciudadano` (
  `idespecie_ciudadano` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `especie_ciudadano`
--

INSERT INTO `especie_ciudadano` (`idespecie_ciudadano`, `nombre`) VALUES
(1, 'Humano'),
(2, 'Extraterrestre'),
(3, 'Androide');

-- --------------------------------------------------------

--
-- Table structure for table `grado_delito`
--

CREATE TABLE `grado_delito` (
  `id` int(11) NOT NULL,
  `grado` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grado_delito`
--

INSERT INTO `grado_delito` (`id`, `grado`) VALUES
(1, 'Grado 1'),
(2, 'Grado 2'),
(3, 'Grado 3');

-- --------------------------------------------------------

--
-- Table structure for table `registro_delito`
--

CREATE TABLE `registro_delito` (
  `idregistro_delito` int(11) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `tipo_delito_idtipo_delito` int(11) NOT NULL,
  `usuarios_idusuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Juez'),
(3, 'Policia');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_delito`
--

CREATE TABLE `tipo_delito` (
  `idtipo_delito` int(11) NOT NULL,
  `delito` varchar(45) DEFAULT NULL,
  `grado_delito_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_delito`
--

INSERT INTO `tipo_delito` (`idtipo_delito`, `delito`, `grado_delito_id`) VALUES
(1, 'Robo', 2),
(2, 'Homicidio', 3),
(3, 'Fraude', 1),
(4, 'Vandalismo', 2),
(5, 'Secuestro', 3);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `rol_idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_citizen_especie_ciudadano_idx` (`especie_ciudadano_idespecie_ciudadano`);

--
-- Indexes for table `citizen_has_registro_delito`
--
ALTER TABLE `citizen_has_registro_delito`
  ADD PRIMARY KEY (`citizen_id`,`registro_delito_idregistro_delito`),
  ADD KEY `fk_citizen_has_registro_delito_registro_delito1_idx` (`registro_delito_idregistro_delito`),
  ADD KEY `fk_citizen_has_registro_delito_citizen1_idx` (`citizen_id`);

--
-- Indexes for table `especie_ciudadano`
--
ALTER TABLE `especie_ciudadano`
  ADD PRIMARY KEY (`idespecie_ciudadano`);

--
-- Indexes for table `grado_delito`
--
ALTER TABLE `grado_delito`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registro_delito`
--
ALTER TABLE `registro_delito`
  ADD PRIMARY KEY (`idregistro_delito`),
  ADD KEY `fk_registro_delito_tipo_delito1_idx` (`tipo_delito_idtipo_delito`),
  ADD KEY `fk_registro_delito_usuarios1_idx` (`usuarios_idusuarios`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indexes for table `tipo_delito`
--
ALTER TABLE `tipo_delito`
  ADD PRIMARY KEY (`idtipo_delito`),
  ADD KEY `fk_tipo_delito_grado_delito1_idx` (`grado_delito_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD KEY `fk_usuarios_rol1_idx` (`rol_idrol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `especie_ciudadano`
--
ALTER TABLE `especie_ciudadano`
  MODIFY `idespecie_ciudadano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grado_delito`
--
ALTER TABLE `grado_delito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_delito`
--
ALTER TABLE `tipo_delito`
  MODIFY `idtipo_delito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citizen`
--
ALTER TABLE `citizen`
  ADD CONSTRAINT `fk_citizen_especie_ciudadano` FOREIGN KEY (`especie_ciudadano_idespecie_ciudadano`) REFERENCES `especie_ciudadano` (`idespecie_ciudadano`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `citizen_has_registro_delito`
--
ALTER TABLE `citizen_has_registro_delito`
  ADD CONSTRAINT `fk_citizen_has_registro_delito_citizen1` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_citizen_has_registro_delito_registro_delito1` FOREIGN KEY (`registro_delito_idregistro_delito`) REFERENCES `registro_delito` (`idregistro_delito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registro_delito`
--
ALTER TABLE `registro_delito`
  ADD CONSTRAINT `fk_registro_delito_tipo_delito1` FOREIGN KEY (`tipo_delito_idtipo_delito`) REFERENCES `tipo_delito` (`idtipo_delito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_delito_usuarios1` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tipo_delito`
--
ALTER TABLE `tipo_delito`
  ADD CONSTRAINT `fk_tipo_delito_grado_delito1` FOREIGN KEY (`grado_delito_id`) REFERENCES `grado_delito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
