-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Mar-2017 às 15:47
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brbconvenio`
--
CREATE DATABASE IF NOT EXISTS `brbconvenio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `brbconvenio`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `CPF` varchar(18) DEFAULT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `Telefone` varchar(16) DEFAULT NULL,
  `Agencia` varchar(45) DEFAULT NULL,
  `Conta` varchar(45) DEFAULT NULL,
  `Banco` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `Codigo` int(11) NOT NULL,
  `NVenda` int(11) NOT NULL,
  `Cliente_Codigo` int(11) NOT NULL,
  `Convenio_Codigo` int(11) NOT NULL,
  `OrdemDebito` int(11) DEFAULT NULL,
  `NotaFiscal` varchar(45) DEFAULT NULL,
  `OrgaoGDF` varchar(45) DEFAULT NULL,
  `DataCompra` date DEFAULT NULL,
  `QtdeParcelas` int(11) DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  `ValorParcela` double NOT NULL,
  `NumParcela` int(11) NOT NULL,
  `ValorExtenso` varchar(100) NOT NULL,
  `DataDebito` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenio`
--

CREATE TABLE `convenio` (
  `Codigo` int(11) NOT NULL,
  `Empresa` varchar(45) DEFAULT NULL,
  `CodConvenio` varchar(45) DEFAULT NULL,
  `CNPJ` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `CodUser` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `Senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`CodUser`, `Nome`, `Login`, `Senha`) VALUES
(1, 'Administrador', 'administrador', '142536');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`Codigo`,`Cliente_Codigo`,`Convenio_Codigo`),
  ADD KEY `Compra_FKIndex1` (`Cliente_Codigo`),
  ADD KEY `Compra_FKIndex2` (`Convenio_Codigo`);

--
-- Indexes for table `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `convenio`
--
ALTER TABLE `convenio`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Cliente_Codigo`) REFERENCES `cliente` (`Codigo`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Convenio_Codigo`) REFERENCES `convenio` (`Codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
