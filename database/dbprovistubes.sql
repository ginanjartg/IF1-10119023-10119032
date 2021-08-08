-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 09:11 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbprovistubes`
--

-- --------------------------------------------------------

--
-- Table structure for table `list_makanan`
--

CREATE TABLE `list_makanan` (
  `nama_makanan` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `tempat_lahir`, `tgl_lahir`, `alamat`) VALUES
(10110001, 'Wongsojoyo Hulin', 'Balikpapan', '1998-01-13', 'Jl Proklamasi No. 56'),
(10110002, 'Sudomo Iwan Lie', 'Bandung', '1998-06-17', 'Jl Gandaria VIII No.2'),
(10110003, 'Suryadi Purnama Setiawan', 'Bandung', '1998-10-12', 'Jl Sunan Kudus No.85'),
(10110004, 'Leony Yenny Sugiarto', 'Semarang', '1998-02-25', 'Jl Genuk Krajan III No.45'),
(10110005, 'Wira Eka Sumadi', 'Bandung', '1997-11-02', 'Jl Guntur Madu No.7');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `nomor_mk` int(10) NOT NULL,
  `nama_mk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_mhs`
--

CREATE TABLE `nilai_mhs` (
  `nim` int(10) NOT NULL,
  `nomor_mk` int(10) NOT NULL,
  `absensi` int(2) DEFAULT NULL,
  `tugas1` int(3) DEFAULT NULL,
  `tugas2` int(3) DEFAULT NULL,
  `tugas3` int(3) DEFAULT NULL,
  `uts` int(3) DEFAULT NULL,
  `uas` int(3) DEFAULT NULL,
  `nilai_akhir` int(3) DEFAULT NULL,
  `keterangan` enum('Lulus','Tidak Lulus') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `no_meja` int(5) NOT NULL,
  `daftar_pesanan` varchar(40) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `total_harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_makanan`
--
ALTER TABLE `list_makanan`
  ADD PRIMARY KEY (`nama_makanan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`nomor_mk`);

--
-- Indexes for table `nilai_mhs`
--
ALTER TABLE `nilai_mhs`
  ADD KEY `nim` (`nim`),
  ADD KEY `nomor_mk` (`nomor_mk`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`no_meja`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai_mhs`
--
ALTER TABLE `nilai_mhs`
  ADD CONSTRAINT `nilai_mhs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_mhs_ibfk_2` FOREIGN KEY (`nomor_mk`) REFERENCES `mata_kuliah` (`nomor_mk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
