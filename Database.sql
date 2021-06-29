-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2021 at 11:03 PM
-- Server version: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rayendra_pangestu_311810356`
--

-- --------------------------------------------------------

--
-- Table structure for table `BARANG`
--

CREATE TABLE `BARANG` (
  `KODE` varchar(1024) NOT NULL,
  `NAMABARANG` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BARANG`
--

INSERT INTO `BARANG` (`KODE`, `NAMABARANG`) VALUES
('B0031', 'Kampas Rem Depan (Disk ) - Import Honda Karisma 125 Cc'),
('B0032', 'Kampas Rem Depan (Disk ) - Import Honda Mega Pro'),
('B0033', 'Kampas Rem Depan (Disk ) - Lokal Honda Karisma 125 Cc'),
('B0034', 'Kampas Rem Depan (Disk ) - Lokal Honda Mega Pro'),
('B0035', 'Kampas Rem Depan Honda Absolut Revo'),
('B0036', 'Kampas Rem Depan Honda Beat 110 cc'),
('B0037', 'Kampas Rem Depan Honda Beat 125 cc');

-- --------------------------------------------------------

--
-- Table structure for table `DETAILTRANSAKSI`
--

CREATE TABLE `DETAILTRANSAKSI` (
  `ID` int(11) NOT NULL,
  `NOPEMBELIAN` varchar(1024) DEFAULT NULL,
  `KODE` varchar(1024) DEFAULT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DETAILTRANSAKSI`
--

INSERT INTO `DETAILTRANSAKSI` (`ID`, `NOPEMBELIAN`, `KODE`, `HARGA`, `QTY`, `SUBTOTAL`) VALUES
(1, 'BL00004', 'B0031', 76000, 10, 760000),
(2, 'BL00004', 'B0032', 76000, 10, 760000),
(3, 'BL00004', 'B0033', 37000, 10, 370000),
(4, 'BL00004', 'B0034', 37000, 10, 370000),
(5, 'BL00004', 'B0035', 37000, 10, 370000),
(6, 'BL00004', 'B0036', 41000, 10, 410000),
(7, 'BL00004', 'B0037', 41000, 10, 410000);

-- --------------------------------------------------------

--
-- Table structure for table `NOTAPEMBELIAN`
--

CREATE TABLE `NOTAPEMBELIAN` (
  `NOPEMBELIAN` varchar(1024) NOT NULL,
  `IDSUPPLIER` varchar(1024) DEFAULT NULL,
  `TANGGAL` date DEFAULT NULL,
  `KETERANGAN` varchar(1024) DEFAULT NULL,
  `GRANDTOTAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NOTAPEMBELIAN`
--

INSERT INTO `NOTAPEMBELIAN` (`NOPEMBELIAN`, `IDSUPPLIER`, `TANGGAL`, `KETERANGAN`, `GRANDTOTAL`) VALUES
('BL00004', 'SUP001', '2015-01-29', 'Belanja Stock Sparepart', 3040000);

-- --------------------------------------------------------

--
-- Table structure for table `SUPPLIER`
--

CREATE TABLE `SUPPLIER` (
  `IDSUPPLIER` varchar(100) NOT NULL,
  `NAMASUPPLIER` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SUPPLIER`
--

INSERT INTO `SUPPLIER` (`IDSUPPLIER`, `NAMASUPPLIER`) VALUES
('SUP001', 'ASTRA MOTOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BARANG`
--
ALTER TABLE `BARANG`
  ADD PRIMARY KEY (`KODE`);

--
-- Indexes for table `DETAILTRANSAKSI`
--
ALTER TABLE `DETAILTRANSAKSI`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DETAILTRANSAKSI` (`KODE`),
  ADD KEY `FK_TRANSAKSI` (`NOPEMBELIAN`);

--
-- Indexes for table `NOTAPEMBELIAN`
--
ALTER TABLE `NOTAPEMBELIAN`
  ADD PRIMARY KEY (`NOPEMBELIAN`),
  ADD KEY `FK_KODESUPPLIER2` (`IDSUPPLIER`);

--
-- Indexes for table `SUPPLIER`
--
ALTER TABLE `SUPPLIER`
  ADD PRIMARY KEY (`IDSUPPLIER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DETAILTRANSAKSI`
--
ALTER TABLE `DETAILTRANSAKSI`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `DETAILTRANSAKSI`
--
ALTER TABLE `DETAILTRANSAKSI`
  ADD CONSTRAINT `FK_DETAILTRANSAKSI` FOREIGN KEY (`KODE`) REFERENCES `BARANG` (`KODE`),
  ADD CONSTRAINT `FK_TRANSAKSI` FOREIGN KEY (`NOPEMBELIAN`) REFERENCES `NOTAPEMBELIAN` (`NOPEMBELIAN`);

--
-- Constraints for table `NOTAPEMBELIAN`
--
ALTER TABLE `NOTAPEMBELIAN`
  ADD CONSTRAINT `FK_KODESUPPLIER2` FOREIGN KEY (`IDSUPPLIER`) REFERENCES `SUPPLIER` (`IDSUPPLIER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
