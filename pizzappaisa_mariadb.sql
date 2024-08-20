-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2024 a las 22:19:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzappaisa_mariadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `idingreidente` varchar(6) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `Existencias` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`idingreidente`, `Descripcion`, `Existencias`) VALUES
('CAMPIN', 'Campinones', 7.50),
('CARNE', 'Carne', 9.00),
('CEBOLL', 'Cebolla', 6.20),
('CERALM', 'CerezasAlmibar', 5.80),
('CHORI', 'Chorizo', 8.60),
('DURALM', 'DuraznosAlmibar', 7.25),
('JALAP', 'Jalapenos', 6.75),
('JAMON', 'Jamon', 9.10),
('MADURO', 'Maduro', 7.90),
('MAIZ', 'Maiz', 7.30),
('MANGO', 'Mango', 8.45),
('MASA', 'Masa', 9.99),
('PASTOM', 'Pasta de tomate', 8.10),
('PEPPER', 'Pepperoni', 9.40),
('PIMIEN', 'Pimiento', 6.85),
('PINA', 'Pina', 5.95),
('POLLO', 'Pollo', 9.30),
('QUESO', 'Queso', 9.75),
('SALCHI', 'Salchichas', 7.00),
('SALSA', 'Salsa de tomate', 8.90),
('SBBQ', 'Salsa BBQ', 8.00),
('TOCINE', 'Tocineta', 9.50),
('UVASPA', 'Uvas pasas', 7.65);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `idSabor` varchar(6) NOT NULL,
  `idPedido` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `numeroPorciones` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`idSabor`, `idPedido`, `numeroPorciones`) VALUES
('CBBQ', 000001, 2),
('HAWIA', 000001, 1),
('MEXIC', 000002, 2),
('RANCH', 000002, 1),
('MADUR', 000003, 1),
('TROPIC', 000004, 1),
('PCHAMP', 000004, 1),
('MTOCIN', 000005, 3),
('CBBQ', 000006, 2),
('MADUR', 000006, 1),
('HAWIA', 000007, 2),
('MEXIC', 000007, 1),
('PCHAMP', 000008, 1),
('RANCH', 000008, 1),
('CBBQ', 000009, 2),
('TROPIC', 000009, 1),
('MEXIC', 000010, 2),
('MADUR', 000010, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordencompra`
--

CREATE TABLE `ordencompra` (
  `idOrden` int(6) UNSIGNED ZEROFILL NOT NULL,
  `usuarioDocumento` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `fechaPedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordencompra`
--

INSERT INTO `ordencompra` (`idOrden`, `usuarioDocumento`, `fechaPedido`) VALUES
(000001, 1234567890, '2024-08-17'),
(000002, 1234567890, '2024-08-18'),
(000003, 2345678901, '2024-08-18'),
(000004, 3456789012, '2024-08-19'),
(000005, 1234567890, '2024-08-20'),
(000006, 2345678901, '2024-08-20'),
(000007, 3456789012, '2024-08-21'),
(000008, 1234567890, '2024-08-21'),
(000009, 2345678901, '2024-08-22'),
(000010, 3456789012, '2024-08-22'),
(000011, 1234567890, '2024-08-23'),
(000012, 2345678901, '2024-08-23'),
(000013, 3456789012, '2024-08-24'),
(000014, 1234567890, '2024-08-24'),
(000015, 2345678901, '2024-08-25'),
(000016, 3456789012, '2024-08-25'),
(000017, 1234567890, '2024-08-26'),
(000018, 2345678901, '2024-08-26'),
(000019, 3456789012, '2024-08-27'),
(000020, 1234567890, '2024-08-27'),
(000021, 2345678901, '2024-08-28'),
(000022, 3456789012, '2024-08-28'),
(000023, 1234567890, '2024-08-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordeningrediente`
--

CREATE TABLE `ordeningrediente` (
  `idOrden` int(6) UNSIGNED ZEROFILL NOT NULL,
  `idIngrediente` varchar(6) NOT NULL,
  `idProveedor` int(6) UNSIGNED ZEROFILL NOT NULL,
  `cantidadSolicitada` decimal(3,2) NOT NULL,
  `cantidadComprada` decimal(3,2) NOT NULL,
  `fechaCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordeningrediente`
--

INSERT INTO `ordeningrediente` (`idOrden`, `idIngrediente`, `idProveedor`, `cantidadSolicitada`, `cantidadComprada`, `fechaCompra`) VALUES
(000001, 'MASA', 000001, 9.99, 9.99, '2024-07-01'),
(000002, 'UVASPA', 000002, 9.99, 9.80, '2024-07-05'),
(000003, 'PASTOM', 000003, 9.99, 9.99, '2024-07-07'),
(000004, 'QUESO', 000004, 9.99, 9.99, '2024-07-10'),
(000005, 'PINA', 000005, 9.99, 9.99, '2024-07-12'),
(000006, 'DURALM', 000006, 9.99, 9.99, '2024-07-15'),
(000007, 'CERALM', 000007, 9.99, 9.99, '2024-07-18'),
(000008, 'TOCINE', 000008, 9.99, 9.99, '2024-07-20'),
(000009, 'CEBOLL', 000009, 9.99, 9.99, '2024-07-22'),
(000010, 'CHORI', 000010, 9.99, 9.99, '2024-07-25'),
(000011, 'MAIZ', 000011, 9.99, 9.99, '2024-07-28'),
(000012, 'MANGO', 000012, 9.99, 9.99, '2024-07-30'),
(000013, 'CARNE', 000013, 9.99, 9.99, '2024-08-01'),
(000014, 'MADURO', 000014, 9.99, 9.90, '2024-08-03'),
(000015, 'SALSA', 000015, 9.99, 9.99, '2024-08-05'),
(000016, 'PEPPER', 000016, 9.99, 9.99, '2024-08-08'),
(000017, 'SBBQ', 000017, 9.99, 9.99, '2024-08-10'),
(000018, 'PIMIEN', 000018, 9.99, 9.99, '2024-08-12'),
(000019, 'POLLO', 000019, 9.99, 9.99, '2024-08-15'),
(000020, 'CAMPIN', 000020, 9.99, 9.99, '2024-08-18'),
(000021, 'SALCHI', 000021, 9.99, 9.99, '2024-08-20'),
(000022, 'JALAP', 000022, 9.99, 9.85, '2024-08-22'),
(000023, 'JAMON', 000023, 9.99, 9.99, '2024-08-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(6) UNSIGNED ZEROFILL NOT NULL,
  `nombreProveedor` varchar(60) NOT NULL,
  `apellidosProveedor` varchar(60) DEFAULT NULL,
  `telefonoProveedor` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Indicasiones` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombreProveedor`, `apellidosProveedor`, `telefonoProveedor`, `Direccion`, `Indicasiones`) VALUES
(000001, 'Proveedores Alimentarios S.A.', NULL, 3001234567, 'Carrera 10 #15-20', 'Centro-Bogota'),
(000002, 'Luis', 'Gomez', 3012345678, 'Avenida 7 #12-34', 'Zona Norte-Bogota'),
(000003, 'Tomate y Salsa Ltda.', NULL, 3023456789, 'Calle 3 #45-67', 'Sur-Bogota'),
(000004, 'Maria', 'Perez', 3034567890, 'Carrera 5 #67-89', 'Zona Centro-Bogota'),
(000005, 'Frutas Tropicales S.A.', NULL, 3045678901, 'Avenida 9 #10-11', 'Occidente-Bogota'),
(000006, 'Ana', 'Martinez', 3056789012, 'Calle 8 #21-22', 'Este-Bogota'),
(000007, 'Carlos', 'Reyes', 3067890123, 'Carrera 6 #34-56', 'Sur-Bogota'),
(000008, 'Carnes del Valle S.A.', NULL, 3078901234, 'Avenida 3 #44-55', 'Norte-Bogota'),
(000009, 'Jorge', 'García', 3089012345, 'Calle 5 #56-78', 'Centro-Bogota'),
(000010, 'Chorizos y Embutidos Ltda.', NULL, 3090123456, 'Carrera 2 #11-22', 'Centro-Bogota'),
(000011, 'Agricola El Campo S.A.', NULL, 3101234567, 'Avenida 6 #77-88', 'Sur-Bogota'),
(000012, 'Isabel', 'Hernandez', 3112345678, 'Calle 12 #23-24', 'Norte-Bogota'),
(000013, 'Carnes del Norte S.A.', NULL, 3123456789, 'Carrera 15 #22-33', 'Norte-Bogota'),
(000014, 'Laura', 'Torres', 3134567890, 'Avenida 4 #31-32', 'Occidente-Bogota'),
(000015, 'Salsas Gourmet Ltda.', NULL, 3145678901, 'Carrera 8 #21-22', 'Centro-Bogota'),
(000016, 'Pepperoni del Valle S.A.', NULL, 3156789012, 'Calle 2 #33-44', 'Norte-Bogota'),
(000017, 'Ricardo', 'Valencia', 3167890123, 'Avenida 5 #45-46', 'Centro-Bogota'),
(000018, 'Verduras Frescas Ltda.', NULL, 3178901234, 'Calle 6 #56-57', 'Sur-Bogota'),
(000019, 'Luis', 'Hernandez', 3189012345, 'Avenida 10 #12-13', 'Norte-Bogota'),
(000020, 'Hongos y Setas S.A.', NULL, 3190123456, 'Carrera 7 #77-88', 'Este-Bogota'),
(000021, 'Pedro', 'Lopez', 3201234567, 'Calle 4 #44-45', 'Occidente-Bogota'),
(000022, 'Picantes S.A.', NULL, 3212345678, 'Avenida 7 #67-68', 'Sur-Bogota'),
(000023, 'Natalia', 'Rodriguez', 3223456789, 'Calle 9 #23-24', 'Centro-Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idPedido` bigint(6) UNSIGNED ZEROFILL NOT NULL,
  `fechaHoraRealizacion` datetime NOT NULL,
  `usuarioDocumento` bigint(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `fechaHoraEntrega` datetime NOT NULL,
  `precioTotal` int(7) NOT NULL,
  `Entregado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idPedido`, `fechaHoraRealizacion`, `usuarioDocumento`, `fechaHoraEntrega`, `precioTotal`, `Entregado`) VALUES
(000001, '2024-08-18 14:30:00', 2345678901, '2024-08-18 16:00:00', 30000, 0),
(000002, '2024-08-18 15:00:00', 2345678901, '2024-08-18 17:00:00', 46000, 0),
(000003, '2024-08-18 16:00:00', 3456789012, '2024-08-18 18:00:00', 11500, 1),
(000004, '2024-08-18 17:00:00', 3456789012, '2024-08-18 19:00:00', 26500, 0),
(000005, '2024-08-18 18:00:00', 4567890123, '2024-08-18 20:00:00', 45000, 0),
(000006, '2024-08-18 19:00:00', 5678901234, '2024-08-18 21:00:00', 35000, 0),
(000007, '2024-08-18 20:00:00', 5678901234, '2024-08-18 22:00:00', 23000, 0),
(000008, '2024-08-18 21:00:00', 6789012345, '2024-08-18 23:00:00', 32000, 1),
(000009, '2024-08-18 22:00:00', 7890123456, '2024-08-19 00:00:00', 40000, 0),
(000010, '2024-08-18 23:00:00', 8901234567, '2024-08-19 01:00:00', 28000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sabor`
--

CREATE TABLE `sabor` (
  `idSabor` varchar(6) NOT NULL,
  `nombrePizza` varchar(20) NOT NULL,
  `precioPorcion` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sabor`
--

INSERT INTO `sabor` (`idSabor`, `nombrePizza`, `precioPorcion`) VALUES
('CBBQ', 'Carne BBQ', 15000),
('CTRAD', 'CarneTradicional', 13000),
('HAWIA', 'Hawiana', 12000),
('MADUR', 'Maduro', 11500),
('MEXIC', 'Mexicana', 14500),
('MTOCIN', 'Mango Tocineta', 15000),
('PAISA', 'Paisa', 13500),
('PCHAMP', 'Pollo Champinones', 14000),
('RANCH', 'Ranchera', 14000),
('TROPIC', 'Tropical', 12500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saboringrediente`
--

CREATE TABLE `saboringrediente` (
  `idSabor` varchar(6) NOT NULL,
  `idIngrediente` varchar(6) NOT NULL,
  `Cantidad` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `saboringrediente`
--

INSERT INTO `saboringrediente` (`idSabor`, `idIngrediente`, `Cantidad`) VALUES
('TROPIC', 'MASA', 0.13),
('TROPIC', 'UVASPA', 0.03),
('TROPIC', 'PASTOM', 0.05),
('TROPIC', 'QUESO', 0.05),
('TROPIC', 'PINA', 0.04),
('TROPIC', 'DURALM', 0.03),
('TROPIC', 'CERALM', 0.03),
('PAISA', 'MASA', 0.13),
('PAISA', 'TOCINE', 0.04),
('PAISA', 'PASTOM', 0.05),
('PAISA', 'QUESO', 0.05),
('PAISA', 'CEBOLL', 0.04),
('PAISA', 'CHORI', 0.04),
('PAISA', 'MAIZ', 0.04),
('MTOCIN', 'MASA', 0.13),
('MTOCIN', 'MANGO', 0.04),
('MTOCIN', 'PASTOM', 0.05),
('MTOCIN', 'QUESO', 0.05),
('MTOCIN', 'TOCINE', 0.04),
('MADUR', 'MASA', 0.13),
('MADUR', 'CARNE', 0.05),
('MADUR', 'MADURO', 0.05),
('MADUR', 'SALSA', 0.05),
('MADUR', 'QUESO', 0.05),
('CBBQ', 'MASA', 0.13),
('CBBQ', 'PEPPER', 0.05),
('CBBQ', 'CARNE', 0.05),
('CBBQ', 'SALSA', 0.05),
('CBBQ', 'QUESO', 0.05),
('CBBQ', 'SBBQ', 0.05),
('CBBQ', 'PIMIEN', 0.03),
('PCHAMP', 'MASA', 0.13),
('PCHAMP', 'POLLO', 0.05),
('PCHAMP', 'CAMPIN', 0.05),
('PCHAMP', 'SALSA', 0.05),
('PCHAMP', 'QUESO', 0.05),
('CTRAD', 'MASA', 0.13),
('CTRAD', 'PEPPER', 0.05),
('CTRAD', 'CARNE', 0.05),
('CTRAD', 'SALSA', 0.05),
('CTRAD', 'QUESO', 0.05),
('CTRAD', 'SALCHI', 0.04),
('MEXIC', 'MASA', 0.13),
('MEXIC', 'CARNE', 0.05),
('MEXIC', 'PASTOM', 0.05),
('MEXIC', 'QUESO', 0.05),
('MEXIC', 'JALAP', 0.03),
('MEXIC', 'PIMIEN', 0.01),
('MEXIC', 'CEBOLL', 0.03),
('HAWIA', 'MASA', 0.13),
('HAWIA', 'JAMON', 0.04),
('HAWIA', 'PASTOM', 0.05),
('HAWIA', 'QUESO', 0.05),
('HAWIA', 'PINA', 0.04),
('RANCH', 'MASA', 0.13),
('RANCH', 'CARNE', 0.05),
('RANCH', 'PASTOM', 0.05),
('RANCH', 'QUESO', 0.05),
('RANCH', 'JALAP', 0.03);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` varchar(5) NOT NULL,
  `tipoDocumento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `tipoDocumento`) VALUES
('CC', 'Cedula de Ciudadania'),
('CE', 'Cedula de Extranjeria'),
('DE', 'Documento de Identidad para Extranjeros'),
('TI', 'Tarjeta de Identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` varchar(5) NOT NULL,
  `tipoUsuario` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `tipoUsuario`) VALUES
('ADMIN', 'Administrador'),
('CLNT', 'Cliente'),
('VENDR', 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `tipoUsuario` varchar(5) NOT NULL,
  `usuarioNombre` varchar(50) NOT NULL,
  `usuarioApellidos` varchar(60) DEFAULT NULL,
  `tipoDocumento` varchar(5) NOT NULL,
  `Documento` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `usuarioTelefono` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`tipoUsuario`, `usuarioNombre`, `usuarioApellidos`, `tipoDocumento`, `Documento`, `usuarioTelefono`, `Correo`, `Contrasena`) VALUES
('CLNT', 'Andres', 'Jimenez', 'DE', 1023456789, 3901234567, 'andres.jimenez@ejemplo.com', 'cliente104'),
('ADMIN', 'Juan', 'Perez', 'CC', 1234567890, 3001234567, 'juan.perez@ejemplo.com', 'admin1234'),
('VENDR', 'Maria', 'Garcia', 'TI', 2345678901, 3101234567, 'maria.garcia@ejemplo.com', 'vend1234'),
('VENDR', 'Luis', 'Martinez', 'CE', 3456789012, 3201234567, 'luis.martinez@ejemplo.com', 'vend5678'),
('CLNT', 'Ana', 'Rodriguez', 'CC', 4567890123, 3301234567, 'ana.rodriguez@ejemplo.com', 'cliente123'),
('CLNT', 'Carlos', 'Mendoza', 'TI', 5678901234, 3401234567, 'carlos.mendoza@ejemplo.com', 'cliente456'),
('CLNT', 'Laura', 'Castro', 'DE', 6789012345, 3501234567, 'laura.castro@ejemplo.com', 'cliente789'),
('CLNT', 'Pedro', 'Sqnchez', 'CC', 7890123456, 3601234567, 'pedro.sanchez@ejemplo.com', 'cliente101'),
('CLNT', 'Isabella', 'Lopez', 'TI', 8901234567, 3701234567, 'isabella.lopez@ejemplo.com', 'cliente102'),
('CLNT', 'Sofia', 'Torres', 'CE', 9012345678, 3801234567, 'sofia.torres@ejemplo.com', 'cliente103');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`idingreidente`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD KEY `idSabor` (`idSabor`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `usuarioDocumento` (`usuarioDocumento`);

--
-- Indices de la tabla `ordeningrediente`
--
ALTER TABLE `ordeningrediente`
  ADD KEY `idIngrediente` (`idIngrediente`),
  ADD KEY `idProveedor` (`idProveedor`),
  ADD KEY `idOrden` (`idOrden`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `usuarioDocumento` (`usuarioDocumento`);

--
-- Indices de la tabla `sabor`
--
ALTER TABLE `sabor`
  ADD PRIMARY KEY (`idSabor`);

--
-- Indices de la tabla `saboringrediente`
--
ALTER TABLE `saboringrediente`
  ADD KEY `idSabor` (`idSabor`),
  ADD KEY `idIngrediente` (`idIngrediente`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Documento`),
  ADD KEY `tipoUsuario` (`tipoUsuario`),
  ADD KEY `tipoDocumento` (`tipoDocumento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `idPedido` bigint(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
  MODIFY `idOrden` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idPedido` bigint(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `linea_ibfk_1` FOREIGN KEY (`idSabor`) REFERENCES `sabor` (`idSabor`),
  ADD CONSTRAINT `linea_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `reserva` (`idPedido`);

--
-- Filtros para la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
  ADD CONSTRAINT `ordencompra_ibfk_1` FOREIGN KEY (`usuarioDocumento`) REFERENCES `usuario` (`Documento`);

--
-- Filtros para la tabla `ordeningrediente`
--
ALTER TABLE `ordeningrediente`
  ADD CONSTRAINT `ordeningrediente_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `ordencompra` (`idOrden`),
  ADD CONSTRAINT `ordeningrediente_ibfk_2` FOREIGN KEY (`idIngrediente`) REFERENCES `ingrediente` (`idingreidente`),
  ADD CONSTRAINT `ordeningrediente_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`usuarioDocumento`) REFERENCES `usuario` (`Documento`);

--
-- Filtros para la tabla `saboringrediente`
--
ALTER TABLE `saboringrediente`
  ADD CONSTRAINT `saboringrediente_ibfk_1` FOREIGN KEY (`idSabor`) REFERENCES `sabor` (`idSabor`),
  ADD CONSTRAINT `saboringrediente_ibfk_2` FOREIGN KEY (`idIngrediente`) REFERENCES `ingrediente` (`idingreidente`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`tipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
