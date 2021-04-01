-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2020 at 04:21 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bengxell`
--

-- --------------------------------------------------------

--
-- Table structure for table `213_mekanik`
--

CREATE TABLE IF NOT EXISTS `213_mekanik` (
`id_mekanik` int(5) unsigned NOT NULL,
  `nama_mekanik` varchar(50) DEFAULT NULL,
  `umur` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_mekanik`
--

INSERT INTO `213_mekanik` (`id_mekanik`, `nama_mekanik`, `umur`) VALUES
(2, 'Sukandar', 23),
(3, 'Ujang Bewok', 26),
(4, 'Suryanto', 28),
(5, 'Aggun', 21);

-- --------------------------------------------------------

--
-- Table structure for table `213_pelanggan`
--

CREATE TABLE IF NOT EXISTS `213_pelanggan` (
`id_pelanggan` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `tgl` varchar(20) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `nopol` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pelanggan`
--

INSERT INTO `213_pelanggan` (`id_pelanggan`, `nama`, `jk`, `alamat`, `tgl`, `telp`, `jenis`, `nopol`) VALUES
(5, 'sahrulsss', 'Priass', 'brebesss', '14/05/2020', '09899d', 'Honda Beats', 'e232s'),
(7, 'kursio', 'laki-laki', 'cirebon', '16/05/2020', '0989944', 'Honda Beat', 'e332'),
(10, 'handoko', 'laki-laki', 'cirebon', '18/11/2020', '0899', 'honda', 'e343'),
(11, 'ahmad', 'laki-laki', 'brebes', '12-20-2020', '0898766233', 'beat', 'en 2039 hp');

-- --------------------------------------------------------

--
-- Table structure for table `213_pembelian`
--

CREATE TABLE IF NOT EXISTS `213_pembelian` (
`id_pembelian` int(5) NOT NULL,
  `id_mekanik` int(5) DEFAULT NULL,
  `id_sparepart` int(5) DEFAULT NULL,
  `id_pelanggan` int(5) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `harga_jasa` varchar(10) DEFAULT NULL,
  `tgl_beli` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pembelian`
--

INSERT INTO `213_pembelian` (`id_pembelian`, `id_mekanik`, `id_sparepart`, `id_pelanggan`, `qty`, `harga_jasa`, `tgl_beli`) VALUES
(8, 1, 1, 5, 1, '30000', '2020-05-01'),
(9, 1, 14, 7, 1, '20000', '2020-05-01'),
(13, 3, 27, 10, 1, '5000', '2020-05-02'),
(25, 3, 2, 5, 1, '3500', '2020-05-03'),
(27, 1, 1, 7, 1, '35000', '2020-05-04'),
(28, 3, 6, 0, 1, '35000', '2020-05-05'),
(30, 3, 18, 0, 2, '10000', '2020-05-07'),
(31, 4, 11, 0, 1, '35000', '2020-05-08'),
(33, 3, 2, 0, 2, '20000', '2020-05-09'),
(34, 2, 2, 7, 5, '700000', '2020-05-10'),
(44, 5, 14, 5, 1, '10000', '2020-05-15'),
(45, 2, 12, 5, 1, '10000', '2020-06-24'),
(46, 4, 19, 10, 1, '10000', '2020-06-24');

--
-- Triggers `213_pembelian`
--
DELIMITER //
CREATE TRIGGER `jual` AFTER INSERT ON `213_pembelian`
 FOR EACH ROW BEGIN
UPDATE 213_sparepart SET stock=stock-NEW.qty
WHERE id_sparepart=NEW.id_sparepart;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `213_pengguna`
--

CREATE TABLE IF NOT EXISTS `213_pengguna` (
`id_pengguna` int(5) NOT NULL,
  `nama_pengguna` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pengguna`
--

INSERT INTO `213_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `status`) VALUES
(1, 'aziz', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `213_sparepart`
--

CREATE TABLE IF NOT EXISTS `213_sparepart` (
`id_sparepart` int(5) NOT NULL,
  `sparepart` varchar(50) NOT NULL,
  `stock` varchar(5) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `harga` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_sparepart`
--

INSERT INTO `213_sparepart` (`id_sparepart`, `sparepart`, `stock`, `kategori`, `harga`) VALUES
(1, 'Filter Udara', '12', 'Onderdil', '32000'),
(2, 'Kampas Rem Depan', '4', 'Onderdil', '37000'),
(3, 'Kampas Rem Belakang', '0', 'Onderdil', '26000'),
(4, 'Rantai', '12', 'Onderdil', '65000'),
(5, 'Gir Depan', '3', 'Onderdil', '35000'),
(6, 'Gir belakang', '0', 'Onderdil', '63000'),
(7, 'Bohlam Depan', '21', 'Aksesosris', '25000'),
(8, 'Bohlam Belakang', '18', 'Aksesosris', '7500'),
(9, 'Kabel Gas', '20', 'Onderdil', '20000'),
(10, 'Kampas Kopling', '5', 'Onderdil', '148000'),
(11, 'Piston', '2', 'Onderdil', '38000'),
(12, 'Ring Piston', '5', 'Onderdil', '60000'),
(13, 'V-belt', '4', 'Onderdil', '43000'),
(14, 'CDI', '5', 'Aksesoris', '340000'),
(15, 'Relay Starter', '6', 'Aksesoris', '40000'),
(16, 'Sokbreker Belakang', '6', 'Onderdil', '180000'),
(17, 'Kem', '5', 'Aksesoris', '115000'),
(18, 'Oli Yamalube', '3', 'Pelumas', '35000'),
(19, 'Oli Top One', '5', 'Pelumas', '40000'),
(20, 'Oli Castroll', '5', 'Pelumas', '65000'),
(21, 'Oli Mesran', '5', 'Pelumas', '35000'),
(27, 'Spion', '6', 'Aksesosris', '25000'),
(28, 'sasis', '3', 'Onderdil', '3000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `213_mekanik`
--
ALTER TABLE `213_mekanik`
 ADD PRIMARY KEY (`id_mekanik`);

--
-- Indexes for table `213_pelanggan`
--
ALTER TABLE `213_pelanggan`
 ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `213_pembelian`
--
ALTER TABLE `213_pembelian`
 ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `213_pengguna`
--
ALTER TABLE `213_pengguna`
 ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `213_sparepart`
--
ALTER TABLE `213_sparepart`
 ADD PRIMARY KEY (`id_sparepart`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `213_mekanik`
--
ALTER TABLE `213_mekanik`
MODIFY `id_mekanik` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `213_pelanggan`
--
ALTER TABLE `213_pelanggan`
MODIFY `id_pelanggan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `213_pembelian`
--
ALTER TABLE `213_pembelian`
MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `213_pengguna`
--
ALTER TABLE `213_pengguna`
MODIFY `id_pengguna` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `213_sparepart`
--
ALTER TABLE `213_sparepart`
MODIFY `id_sparepart` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
