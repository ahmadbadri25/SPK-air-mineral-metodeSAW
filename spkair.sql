-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 10:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spkambing`
--

-- --------------------------------------------------------

--
-- Table structure for table `air`
--

CREATE TABLE `air` (
  `id_air` int(10) NOT NULL,
  `no_kalung` varchar(6) NOT NULL,
  `ciri_khas` text NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `air`
--

INSERT INTO `air` (`id_air`, `no_kalung`, `ciri_khas`, `tanggal_input`) VALUES
(13, 'Eterna', 'Raih Potensi Abadi Anda dengan Eternal Plus (E+)', '2023-07-11'),
(14, 'Evian', 'Hiduplah dengan muda. Hiduplah dengan murni. Evian.', '2023-07-11'),
(15, 'EQUIL', 'Seimbangkan hidupmu. EQUIL.', '2023-07-11'),
(16, 'Pristi', 'Tetaplah murni, tetaplah Pristine.', '2023-07-11'),
(17, 'Super', 'Air mineral dengan oksigen.', '2023-07-11'),
(18, 'Netle', 'Kehidupan Murni Dimulai Sekarang.', '2023-07-11'),
(19, 'TOTAL8', 'Alkaline Ionized Water.', '2023-07-11'),
(20, 'Le Min', 'Minumlah Perbedaannya.', '2023-07-11'),
(21, 'AQUA', 'Air Minum Sehat AQUA.', '2023-07-11'),
(22, 'Cleo', 'Kelembutan Murni, Difilter untuk Anda.', '2023-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama`, `type`, `bobot`, `ada_pilihan`, `urutan_order`) VALUES
(18, 'Kandungan Mineral', 'benefit', 0.3, 0, 0),
(19, 'pH Air', 'benefit', 0.2, 0, 1),
(20, 'Kekeruhan', 'benefit', 0.1, 0, 2),
(21, 'Kandungan Bakteri', 'benefit', 0.2, 0, 3),
(22, 'Sertifikasi', 'benefit', 0.1, 0, 4),
(23, 'Kemasan', 'benefit', 0.05, 0, 5),
(24, 'Harga', 'cost', 0.05, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_air`
--

CREATE TABLE `nilai_air` (
  `id_nilai_air` int(11) NOT NULL,
  `id_air` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_air`
--

INSERT INTO `nilai_air` (`id_nilai_air`, `id_air`, `id_kriteria`, `nilai`) VALUES
(62, 13, 18, 0.28),
(63, 13, 19, 0.18),
(64, 13, 20, 0.002),
(65, 13, 21, 0.001),
(66, 13, 22, 0.09),
(67, 13, 23, 0.04),
(68, 13, 24, 0.04),
(69, 14, 18, 0.27),
(70, 14, 19, 0.17),
(71, 14, 20, 0.002),
(72, 14, 21, 0.003),
(73, 14, 22, 0.075),
(74, 14, 23, 0.04),
(75, 14, 24, 0.04),
(76, 15, 18, 0.26),
(77, 15, 19, 0.16),
(78, 15, 20, 0.004),
(79, 15, 21, 0.007),
(80, 15, 22, 0.1),
(81, 15, 23, 0.04),
(82, 15, 24, 0.04),
(83, 16, 18, 0.25),
(84, 16, 19, 0.15),
(85, 16, 20, 0.009),
(86, 16, 21, 0.009),
(87, 16, 22, 0.1),
(88, 16, 23, 0.03),
(89, 16, 24, 0.04),
(125, 17, 18, 0.24),
(126, 17, 19, 0.14),
(127, 17, 20, 0.011),
(128, 17, 21, 0.011),
(129, 17, 22, 0.2),
(130, 17, 23, 0.03),
(131, 17, 24, 0.04),
(139, 18, 18, 0.23),
(140, 18, 19, 0.13),
(141, 18, 20, 0.013),
(142, 18, 21, 0.013),
(143, 18, 22, 0.2),
(144, 18, 23, 0.03),
(145, 18, 24, 0.04),
(153, 19, 18, 0.22),
(154, 19, 19, 0.12),
(155, 19, 20, 0.015),
(156, 19, 21, 0.015),
(157, 19, 22, 0.3),
(158, 19, 23, 0.02),
(159, 19, 24, 0.04),
(174, 20, 18, 0.21),
(175, 20, 19, 0.11),
(176, 20, 20, 0.017),
(177, 20, 21, 0.017),
(178, 20, 22, 0.3),
(179, 20, 23, 0.02),
(180, 20, 24, 0.04),
(244, 21, 18, 0.2),
(245, 21, 19, 0.1),
(246, 21, 20, 0.019),
(247, 21, 21, 0.019),
(248, 21, 22, 0.4),
(249, 21, 23, 0.02),
(250, 21, 24, 0.04),
(251, 22, 18, 0.19),
(252, 22, 19, 0.09),
(253, 22, 20, 0.021),
(254, 22, 21, 0.021),
(255, 22, 22, 0.4),
(256, 22, 23, 0.01),
(257, 22, 24, 0.04);

-- --------------------------------------------------------

--
-- Table structure for table `pilihan_kriteria`
--

CREATE TABLE `pilihan_kriteria` (
  `id_pil_kriteria` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nilai` float NOT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `alamat`, `role`) VALUES
(8, 'badri', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'ahmad badri', '25.ahmadbadri@gmail.com', 'kp.sawah', '1'),
(9, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Admin', 'krisnasaputraraihanramadhi@gmail.com', 'Jl. Putra 2 No.25 Pondok Duta 1', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `air`
--
ALTER TABLE `air`
  ADD PRIMARY KEY (`id_air`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_air`
--
ALTER TABLE `nilai_air`
  ADD PRIMARY KEY (`id_nilai_air`),
  ADD UNIQUE KEY `id_kambing_2` (`id_air`,`id_kriteria`),
  ADD KEY `id_kambing` (`id_air`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD PRIMARY KEY (`id_pil_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `air`
--
ALTER TABLE `air`
  MODIFY `id_air` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `nilai_air`
--
ALTER TABLE `nilai_air`
  MODIFY `id_nilai_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  MODIFY `id_pil_kriteria` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai_air`
--
ALTER TABLE `nilai_air`
  ADD CONSTRAINT `nilai_air_ibfk_1` FOREIGN KEY (`id_air`) REFERENCES `air` (`id_air`),
  ADD CONSTRAINT `nilai_air_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD CONSTRAINT `pilihan_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
