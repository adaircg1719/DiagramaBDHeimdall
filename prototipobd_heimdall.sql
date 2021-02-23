-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2021 a las 06:24:37
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prototipobd_heimdall`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Filiales_Clientes_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Filiales_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `CantidadPedestales` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filiales`
--

CREATE TABLE `filiales` (
  `Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Clientes_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Domicilio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupousuario`
--

CREATE TABLE `grupousuario` (
  `GrupoUsuario_idGrupoUsuario` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedestal`
--

CREATE TABLE `pedestal` (
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Acceso_Filiales_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Acceso_Filiales_Clientes_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Nombre` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `Regsitro_idRegistro` int(10) UNSIGNED NOT NULL,
  `Usuarios_Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Usuarios_Pedestal_Acceso_Filiales_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Usuarios_Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Usuarios_Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Usuarios_GrupoUsuario_idGrupoUsuario` int(10) UNSIGNED NOT NULL,
  `Usuarios_Usuario_idUsuarios` int(10) UNSIGNED NOT NULL,
  `IdentificadorUsuario` int(10) UNSIGNED DEFAULT NULL,
  `LecturaTermica` varchar(20) DEFAULT NULL,
  `HoraRegistro` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario_idUsuarios` int(10) UNSIGNED NOT NULL,
  `GrupoUsuario_idGrupoUsuario` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filiales_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Identificador` int(10) UNSIGNED DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Fecha_Nacimiento` varchar(20) DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL,
  `Curp` varchar(20) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Asunto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`Acceso_idAcceso`,`Filiales_Clientes_Cliente_idCliente`,`Filiales_Filial_idFilial`),
  ADD KEY `Acceso_FKIndex1` (`Filiales_Filial_idFilial`,`Filiales_Clientes_Cliente_idCliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cliente_idCliente`);

--
-- Indices de la tabla `filiales`
--
ALTER TABLE `filiales`
  ADD PRIMARY KEY (`Filial_idFilial`,`Clientes_Cliente_idCliente`),
  ADD KEY `Filiales_FKIndex1` (`Clientes_Cliente_idCliente`);

--
-- Indices de la tabla `grupousuario`
--
ALTER TABLE `grupousuario`
  ADD PRIMARY KEY (`GrupoUsuario_idGrupoUsuario`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`Pedestal_idPedestal`,`Acceso_Filiales_Filial_idFilial`,`Acceso_Filiales_Clientes_Cliente_idCliente`,`Acceso_idAcceso`),
  ADD KEY `Pedestal_FKIndex1` (`Acceso_idAcceso`,`Acceso_Filiales_Clientes_Cliente_idCliente`,`Acceso_Filiales_Filial_idFilial`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`Regsitro_idRegistro`,`Usuarios_Pedestal_idPedestal`,`Usuarios_Pedestal_Acceso_Filiales_Filial_idFilial`,`Usuarios_Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Usuarios_Pedestal_Acceso_idAcceso`,`Usuarios_GrupoUsuario_idGrupoUsuario`,`Usuarios_Usuario_idUsuarios`),
  ADD KEY `Registro_FKIndex1` (`Usuarios_Usuario_idUsuarios`,`Usuarios_GrupoUsuario_idGrupoUsuario`,`Usuarios_Pedestal_Acceso_idAcceso`,`Usuarios_Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Usuarios_Pedestal_Acceso_Filiales_Filial_idFilial`,`Usuarios_Pedestal_idPedestal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario_idUsuarios`,`GrupoUsuario_idGrupoUsuario`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Pedestal_Acceso_Filiales_Filial_idFilial`,`Pedestal_idPedestal`),
  ADD KEY `Usuarios_FKIndex1` (`GrupoUsuario_idGrupoUsuario`),
  ADD KEY `Usuarios_FKIndex2` (`Pedestal_idPedestal`,`Pedestal_Acceso_Filiales_Filial_idFilial`,`Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `Acceso_idAcceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cliente_idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `filiales`
--
ALTER TABLE `filiales`
  MODIFY `Filial_idFilial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupousuario`
--
ALTER TABLE `grupousuario`
  MODIFY `GrupoUsuario_idGrupoUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  MODIFY `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `Regsitro_idRegistro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usuario_idUsuarios` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`Filiales_Filial_idFilial`,`Filiales_Clientes_Cliente_idCliente`) REFERENCES `filiales` (`Filial_idFilial`, `Clientes_Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `filiales`
--
ALTER TABLE `filiales`
  ADD CONSTRAINT `filiales_ibfk_1` FOREIGN KEY (`Clientes_Cliente_idCliente`) REFERENCES `clientes` (`Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `pedestal_ibfk_1` FOREIGN KEY (`Acceso_idAcceso`,`Acceso_Filiales_Clientes_Cliente_idCliente`,`Acceso_Filiales_Filial_idFilial`) REFERENCES `acceso` (`Acceso_idAcceso`, `Filiales_Clientes_Cliente_idCliente`, `Filiales_Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`Usuarios_Usuario_idUsuarios`,`Usuarios_GrupoUsuario_idGrupoUsuario`,`Usuarios_Pedestal_Acceso_idAcceso`,`Usuarios_Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Usuarios_Pedestal_Acceso_Filiales_Filial_idFilial`,`Usuarios_Pedestal_idPedestal`) REFERENCES `usuarios` (`Usuario_idUsuarios`, `GrupoUsuario_idGrupoUsuario`, `Pedestal_Acceso_idAcceso`, `Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`, `Pedestal_Acceso_Filiales_Filial_idFilial`, `Pedestal_idPedestal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`GrupoUsuario_idGrupoUsuario`) REFERENCES `grupousuario` (`GrupoUsuario_idGrupoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Filiales_Filial_idFilial`,`Pedestal_Acceso_Filiales_Clientes_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`Pedestal_idPedestal`, `Acceso_Filiales_Filial_idFilial`, `Acceso_Filiales_Clientes_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
