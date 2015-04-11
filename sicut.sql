-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2015 at 09:45 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `SICuT`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE IF NOT EXISTS `akun` (
  `Id` int(11) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `No_telp` char(12) NOT NULL,
  `Alamat` varchar(70) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`Id`, `Password`, `Email`, `Nama`, `No_telp`, `Alamat`, `Role`) VALUES
(54321, '12345', 'yodi@ui.ac.id', 'yodi', '081208120812', 'bekasi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `Id_murid` int(11) NOT NULL,
  `Id_guru` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Rating` int(11) NOT NULL,
  `Kelebihan` varchar(100) NOT NULL,
  `Kekurangan` varchar(100) NOT NULL,
  `Saran` varchar(100) NOT NULL,
  `Ket` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`Id_murid`,`Id_guru`),
  KEY `Id_sales` (`Id_sales`),
  KEY `Id_guru` (`Id_guru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
  `Id_guru` int(11) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_guru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`Id_guru`, `Nama`) VALUES
(12345, 'Pamela');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE IF NOT EXISTS `murid` (
  `Id_murid` int(11) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`Id_murid`),
  KEY `Id_sales` (`Id_sales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`Id_murid`, `Nama`, `Id_sales`) VALUES
(13579, 'Derien', 54321);

-- --------------------------------------------------------

--
-- Table structure for table `not_recurring`
--

CREATE TABLE IF NOT EXISTS `not_recurring` (
  `Id_guru` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Alasan` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_guru`,`Id_murid`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recurring`
--

CREATE TABLE IF NOT EXISTS `recurring` (
  `Id_guru` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Jadwal` date NOT NULL,
  `Jumlah_jam` int(11) NOT NULL,
  PRIMARY KEY (`Id_guru`,`Id_murid`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_status`
--

CREATE TABLE IF NOT EXISTS `recurring_status` (
  `Id_guru` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`Id_guru`,`Id_murid`),
  KEY `Id_sales` (`Id_sales`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE IF NOT EXISTS `refund` (
  `Id_guru` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Jam_hilang` int(11) NOT NULL,
  `Alasan` varchar(100) NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`Id_guru`,`Id_murid`),
  KEY `Id_sales` (`Id_sales`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE IF NOT EXISTS `sesi` (
  `Id_guru` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Invoice_number` int(11) NOT NULL,
  `Jumlah_jam` int(11) NOT NULL,
  `Harga_per_jam` int(11) NOT NULL,
  PRIMARY KEY (`Id_guru`,`Id_murid`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_akhir`
--

CREATE TABLE IF NOT EXISTS `status_akhir` (
  `No` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Id_guru` int(11) NOT NULL,
  `Jam` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`No`,`Id_murid`,`Id_guru`),
  KEY `Id_sales` (`Id_sales`),
  KEY `Id_murid` (`Id_murid`),
  KEY `Id_guru` (`Id_guru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_awal`
--

CREATE TABLE IF NOT EXISTS `status_awal` (
  `No` int(11) NOT NULL,
  `Id_murid` int(11) NOT NULL,
  `Jam` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Id_sales` int(11) NOT NULL,
  PRIMARY KEY (`No`,`Id_murid`),
  KEY `Id_sales` (`Id_sales`),
  KEY `Id_murid` (`Id_murid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE IF NOT EXISTS `target` (
  `Id_sales` int(11) NOT NULL,
  `Periode_awal` date NOT NULL,
  `Periode_akhir` date NOT NULL,
  `Target` int(11) NOT NULL,
  `Id_supervisor` int(11) NOT NULL,
  PRIMARY KEY (`Id_sales`),
  KEY `Id_supervisor` (`Id_supervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`),
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Id_murid`) REFERENCES `murid` (`Id_murid`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`Id_guru`) REFERENCES `guru` (`Id_guru`);

--
-- Constraints for table `murid`
--
ALTER TABLE `murid`
  ADD CONSTRAINT `murid_ibfk_1` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`);

--
-- Constraints for table `not_recurring`
--
ALTER TABLE `not_recurring`
  ADD CONSTRAINT `not_recurring_ibfk_2` FOREIGN KEY (`Id_murid`) REFERENCES `recurring_status` (`Id_murid`),
  ADD CONSTRAINT `not_recurring_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `recurring_status` (`Id_guru`);

--
-- Constraints for table `recurring`
--
ALTER TABLE `recurring`
  ADD CONSTRAINT `recurring_ibfk_2` FOREIGN KEY (`Id_murid`) REFERENCES `recurring_status` (`Id_murid`),
  ADD CONSTRAINT `recurring_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `recurring_status` (`Id_guru`);

--
-- Constraints for table `recurring_status`
--
ALTER TABLE `recurring_status`
  ADD CONSTRAINT `recurring_status_ibfk_3` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`),
  ADD CONSTRAINT `recurring_status_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `sesi` (`Id_guru`),
  ADD CONSTRAINT `recurring_status_ibfk_2` FOREIGN KEY (`Id_murid`) REFERENCES `sesi` (`Id_murid`);

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `refund_ibfk_3` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`),
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `sesi` (`Id_guru`),
  ADD CONSTRAINT `refund_ibfk_2` FOREIGN KEY (`Id_murid`) REFERENCES `sesi` (`Id_murid`);

--
-- Constraints for table `sesi`
--
ALTER TABLE `sesi`
  ADD CONSTRAINT `sesi_ibfk_2` FOREIGN KEY (`Id_murid`) REFERENCES `murid` (`Id_murid`),
  ADD CONSTRAINT `sesi_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `guru` (`Id_guru`);

--
-- Constraints for table `status_akhir`
--
ALTER TABLE `status_akhir`
  ADD CONSTRAINT `status_akhir_ibfk_3` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`),
  ADD CONSTRAINT `status_akhir_ibfk_1` FOREIGN KEY (`Id_murid`) REFERENCES `sesi` (`Id_murid`),
  ADD CONSTRAINT `status_akhir_ibfk_2` FOREIGN KEY (`Id_guru`) REFERENCES `sesi` (`Id_guru`);

--
-- Constraints for table `status_awal`
--
ALTER TABLE `status_awal`
  ADD CONSTRAINT `status_awal_ibfk_2` FOREIGN KEY (`Id_sales`) REFERENCES `akun` (`Id`),
  ADD CONSTRAINT `status_awal_ibfk_1` FOREIGN KEY (`Id_murid`) REFERENCES `murid` (`Id_murid`);

--
-- Constraints for table `target`
--
ALTER TABLE `target`
  ADD CONSTRAINT `target_ibfk_1` FOREIGN KEY (`Id_supervisor`) REFERENCES `akun` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
