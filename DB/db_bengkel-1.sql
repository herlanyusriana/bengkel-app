-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2021 at 07:26 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `213_mekanik`
--

CREATE TABLE `213_mekanik` (
  `id_mekanik` int(5) UNSIGNED NOT NULL,
  `nama_mekanik` varchar(50) DEFAULT NULL,
  `umur` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_mekanik`
--

INSERT INTO `213_mekanik` (`id_mekanik`, `nama_mekanik`, `umur`) VALUES
(2, 'Sukandaro', 26),
(3, 'Ujang Bewok', 26),
(4, 'Suryanto', 28),
(5, 'Aggun23', 21),
(6, 'jamet', 12),
(8, 'pio', 23);

-- --------------------------------------------------------

--
-- Table structure for table `213_pelanggan`
--

CREATE TABLE `213_pelanggan` (
  `id_pelanggan` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `tgl` varchar(20) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `nopol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pelanggan`
--

INSERT INTO `213_pelanggan` (`id_pelanggan`, `nama`, `jk`, `alamat`, `tgl`, `telp`, `jenis`, `nopol`) VALUES
(5, 'sahrulsss', 'Priass', 'brebesss', '14/05/2020', '098999', 'Honda Beats', 'e232s'),
(7, 'kursio', 'laki-laki', 'cirebon', '16/05/2020', '0989944', 'Honda Beat g', 'e332'),
(10, 'handoko', 'laki-laki', 'cirebon', '18/11/2020', '0899', 'honda', 'e343'),
(11, 'ahmad', 'laki-laki', 'brebes', '12-20-2020', '0898766233', 'beat', 'en 2039 hp'),
(12, 'memt', 'bencong', 'rd', '12', '12', '21', '22'),
(14, 'kakhsk', 'bencong', ',mabdbam', '121', '0101010', 'motor', '1212112');

-- --------------------------------------------------------

--
-- Table structure for table `213_pembelian`
--

CREATE TABLE `213_pembelian` (
  `id_pembelian` int(5) NOT NULL,
  `id_mekanik` int(5) DEFAULT NULL,
  `id_sparepart` int(5) DEFAULT NULL,
  `id_pelanggan` int(5) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `harga_jasa` varchar(10) DEFAULT NULL,
  `tgl_beli` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pembelian`
--

INSERT INTO `213_pembelian` (`id_pembelian`, `id_mekanik`, `id_sparepart`, `id_pelanggan`, `qty`, `harga_jasa`, `tgl_beli`) VALUES
(8, 1, 1, 5, 1, '30000', '2020-05-01'),
(9, 1, 14, 7, 1, '20000', '2020-05-01'),
(27, 1, 1, 7, 1, '35000', '2020-05-04'),
(28, 3, 6, 0, 1, '35000', '2020-05-05'),
(30, 3, 18, 0, 2, '10000', '2020-05-07'),
(31, 4, 11, 0, 1, '35000', '2020-05-08'),
(33, 3, 2, 0, 2, '20000', '2020-05-09'),
(46, 4, 19, 10, 1, '10000', '2020-06-24'),
(47, 3, 9, 10, 10, '100000', '2021-03-25'),
(48, 3, 14, 10, 500, '100', '2021-03-25'),
(49, 3, 9, 11, 100, '10000', '2021-03-25'),
(51, 3, 7, 12, 1, '1000000', '2021-03-25'),
(52, 3, 21, 5, 1, '500', '2021-03-25'),
(53, 2, 1, 5, 1, '500', '2021-03-25'),
(54, 2, 18, 5, 7, '100000', '2021-03-25'),
(55, 2, 10, 12, 1, '200', '2021-04-10'),
(56, 3, 0, 7, 0, '10000', '2021-04-17'),
(57, 3, 0, 7, 0, '10000', '2021-04-17'),
(58, 2, 0, 5, 0, '10000', '2021-04-17'),
(59, 2, 0, 5, 0, '10000', '2021-04-17');

--
-- Triggers `213_pembelian`
--
DELIMITER $$
CREATE TRIGGER `jual` AFTER INSERT ON `213_pembelian` FOR EACH ROW BEGIN
UPDATE 213_sparepart SET stock=stock-NEW.qty
WHERE id_sparepart=NEW.id_sparepart;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `213_pembelian_detail`
--

CREATE TABLE `213_pembelian_detail` (
  `id_pembelian_detail` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_sparepart` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pembelian_detail`
--

INSERT INTO `213_pembelian_detail` (`id_pembelian_detail`, `id_pembelian`, `id_sparepart`, `qty`) VALUES
(1, 8, 1, 3),
(2, 8, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `213_pengguna`
--

CREATE TABLE `213_pengguna` (
  `id_pengguna` int(5) NOT NULL,
  `nama_pengguna` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` enum('Y','N') DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_pengguna`
--

INSERT INTO `213_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `status`) VALUES
(1, 'aziz', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `213_sparepart`
--

CREATE TABLE `213_sparepart` (
  `id_sparepart` int(5) NOT NULL,
  `sparepart` varchar(50) NOT NULL,
  `stock` varchar(5) NOT NULL,
  `harga` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `213_sparepart`
--

INSERT INTO `213_sparepart` (`id_sparepart`, `sparepart`, `stock`, `harga`) VALUES
(1, 'Filter Udara', '300', '32000'),
(2, 'Kampas Rem Depan', '4', '37000'),
(3, 'Kampas Rem Belakang', '200', '26000'),
(4, 'Rantai', '12', '65000'),
(5, 'Gir Depan', '3', '35000'),
(6, 'Gir belakang', '200', '63000'),
(7, 'Bohlam Depan', '20', '25000'),
(8, 'Bohlam Belakang', '18', '7500'),
(9, 'Kabel Gas', '200', '20000'),
(10, 'Kampas Kopling', '4', '148000'),
(11, 'Piston', '2', '38000'),
(12, 'Ring Piston', '5', '60000'),
(13, 'V-belt', '-996', '43000'),
(14, 'CDI', '-495', '340000'),
(15, 'Relay Starter', '6', '40000'),
(16, 'Sokbreker Belakang', '6', '180000'),
(17, 'Kem', '5', '115000'),
(18, 'Oli Yamalube', '-4', '35000'),
(19, 'Oli Top One', '5', '40000'),
(20, 'Oli Castroll', '5', '65000'),
(21, 'Oli Mesran', '4', '35000'),
(27, 'Spion', '6', '25000'),
(28, 'sasis', '3', '3000000'),
(29, 'Lampu Depan', '10', '10000');

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
-- Indexes for table `213_pembelian_detail`
--
ALTER TABLE `213_pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

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
  MODIFY `id_mekanik` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `213_pelanggan`
--
ALTER TABLE `213_pelanggan`
  MODIFY `id_pelanggan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `213_pembelian`
--
ALTER TABLE `213_pembelian`
  MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `213_pembelian_detail`
--
ALTER TABLE `213_pembelian_detail`
  MODIFY `id_pembelian_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `213_pengguna`
--
ALTER TABLE `213_pengguna`
  MODIFY `id_pengguna` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `213_sparepart`
--
ALTER TABLE `213_sparepart`
  MODIFY `id_sparepart` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
