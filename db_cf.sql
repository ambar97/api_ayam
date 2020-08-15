-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2020 at 11:38 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cf`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `nama_gejala` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `nama_gejala`) VALUES
(1, 'Mata Berbusa'),
(2, 'Keluar Lendir Dari Hidung'),
(3, 'Muncul Kerak Pada Hidung'),
(4, 'Nafsu Makan Menurun'),
(5, 'Pertumbuhan Melambat'),
(6, 'Ngorok Basah'),
(7, 'Sayap Menggantung Lemas'),
(8, 'Kotoran Berwarna Putih'),
(9, 'Jengger Berwarna Keabu abuan'),
(10, 'Lumpuh Karena Artitis'),
(11, 'Ayam Tampak Lesu'),
(12, 'Badan Ayam Gemetar'),
(13, 'Ayam Menggap Menggap'),
(14, 'Sering Bersin bersin'),
(15, 'Ayam Batuk-batuk'),
(16, 'Menggeleng-gelengkan kepala'),
(17, 'Sering menjulurkan Leher');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(10) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `deskripsi`) VALUES
(1, 'Penyakit Snot (Coryza)', 'Penyakit Snot atau Coryza disebabkan oleh Bakteri Haemophilus Gallinarum. Penyakit Snot dapat menyerang ayam bangkok semua umur dan terutama menyerang anak ayam bangkok, biasanya penyakit muncul akibat perubahan musim dan banyak ditemukan di daerah tropis. \r\n\r\nPengobatan penyakit Snot atau Coryza pada ayam bangkok ini adalah dengan pemberian Preparat Sulfat seperti Sulfadimethoxine untuk mengobati Coryza dan dapat diberikan lewat air minum atau di suntikan secara Intramuskular.'),
(2, 'Penyakit Ngorok (CDR)', 'Penyakit Ngorok atau biasa disebut juga dengan Choronic Respiratory Disesaese (CDR)  atau Mikoplamosis atau Sinusitis atau Air Sac disebabkan oleh bakteri Microplasma Galisepticum. Biasanya menyerang ayam bangkok yang berusia 4-9 Minggu. Penularan terjadi melalui kontak langsung, peralatan kandang, makan dan minum. \r\n\r\nPengobatan CDR pada ayam bangkok yang sakit dapat diberikan Baytrit 10% Peroral, Mycomas dengan Dosis 0,5 ml/L air minum, Tetracolin secara oral atau Bacytracyn yang diberikan pada air minum.'),
(3, 'Penyakit Infectious Laryngotracheitis (ILT)', 'Infectius Laryngotracheitis atau (ILT) merupakan penyakit kontagius pada saluran pernafasan yang dirincikan dengan ayam bangkok kesulitan bernafas, Konjungtifitas, adanya inflamasi yang mengelilingi membrane mata, penyakit ini disebabkan oleh Herpes Virus yang mampu hidup 8-10 hari pada leleran, lebih dari 70 hari di dalam karkas, kemudian dapat hidup lebih dari 80 hari dalam Eksudat (Tracea atau saluran pernafasan) dalam kondisi alami, penyakit ini berlangsung selama 2-6 minggu dalam Flok dan lebih lama di banding penyakit Respirasi viral yang lainnya. \r\n\r\n Pencegahan pada penyakit ILT yaitu \r\n 1. Meminimalisir kotoran dan debu \r\n 2. Penggunaan Mild Expectatorants \r\n 3. Vaksinasi baik secara eye drop, spray maupun lewat air minum'),
(4, 'Penyakit Berak Kapur (Pullorum)', 'Penyakit Berak Kapur atau Pullorium merupakan penyakit menular pada ayam bangkok maupun ayam petelur pada umumnya yang sering ditemui, meskipun segala umur ayam bisa terserang Pullorium tapi angka kematian tertinggi terjadi pada anak ayam yang baru menetas.\r\n\r\nPengobatan Berak Kapur dilakukan dengan menyuntikkan antibiotik seperti furozolidon, coccilin, neo terramycin, tetra atau mycomas di dada ayam. Obat-obatan ini hanya efektif untuk pencegahan kematian anak ayam, tapi tidak dapat menghilangkan infeksi penyakit tersebut. Sebaiknya ayam yang terserang dimusnahkan untuk menghilangkan karier yang bersifat kronis. \r\n\r\nPencegahan Ayam yang dibeli dari distributor penetasan atau suplier harus memiliki sertifikat bebas salmonella pullorum. Melakukan desinfeksi pada kandang dengan formaldehyde 40%. Ayam yang terkena penyakit sebaiknya dipisahkan dari kelompoknya, sedangkan ayam yang parah dimusnahkan.'),
(5, 'Penyakit Gumoro', 'Penyakit Gumoro, penyakit ini menyerang kekebalan tubuh ayam, terutama bagian fibrikus dan thymus, kedua bagian ini merupakan pertahanan tubuh ayam. Pada kerusakan yang parah, antibody ayam bangkok terebut tidak terbentuk karena menyerang system kekebalan tubuh maka penyakit ini sering disebut sebagai AIDSnya ayam. Penyakit gumoro memang tidak menyebabkan kematian secara langsung pada ayam, tetapi infeski sekunder yang mengikutinya akan menyebabkan kematian dengan cepat karena kekebalan tubuhnya tidak bekerja. Penyakit Gumoro menyebar melalui kontak langsung, air minum, pakan, alat-alat yang sudah tercemar virus dan udara. yang sangat menarik adalah gumoro tidak menular dengan perantaraan telur dan ayam sudah sembuh tidak menjadi â€œcarrierâ€. Upaya penanggulangan gumoro ini dapat dilakukan dengan beberapa cara yaitu vaksinasi, menjaga kebersihan lingkungan kandang.'),
(6, 'Penyakit Tetelo', 'Penyakit Telelo atau Newcastle Disease (ND) biasa juga disebut dengan istilah penyakit Samper Ayam ataupun Pes Cekak. Dimana penyakit ini merupakan suatu infeksi viral yang menyebabkan gangguan pada saraf pernapasan, Penyakit ini disebabkan oleh virus Paramyxo. \r\n\r\nPencegahan yang harus dilakukan oleh para peternak mengingat penyakit ini sangat infeksius adalah sebagai berikut: \r\n\r\n 1. Memelihara kebersihan kandang dan sekitarnya. Kandang harus mendapat sinar matahari yang cukup dan ventilasi yang baik \r\n 2. Memisahkan ayam lain yang dicurigai dapat menularkan penyakit ini. \r\n 3. Memberikan ransum jamu yang baik, yang terbuat dari bahan-bahan tradisional yang dapat membantu meningkatkan kekuatan dan kekebalan tubuh ayam.');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id_rule` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `bobot_pakar` float(11,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id_rule`, `id_gejala`, `id_penyakit`, `bobot_pakar`) VALUES
(1, 4, 1, 0.6),
(2, 7, 1, 0.8),
(3, 8, 1, 0.6),
(4, 9, 1, 0.8),
(5, 10, 1, 0.4),
(6, 11, 1, 0.4),
(7, 4, 2, 0.4),
(8, 7, 2, 0.6),
(9, 11, 2, 0.6),
(10, 12, 2, 0.4),
(11, 1, 3, 0.6),
(12, 6, 3, 0.6),
(13, 17, 3, 0.6),
(14, 1, 4, 0.4),
(15, 2, 4, 0.6),
(16, 6, 4, 0.4),
(17, 16, 4, 0.6),
(18, 1, 5, 0.8),
(19, 2, 5, 0.6),
(20, 3, 5, 0.4),
(21, 4, 5, 0.8),
(22, 5, 5, 0.6),
(23, 6, 5, 0.8),
(24, 4, 6, 0.6),
(25, 6, 6, 0.6),
(26, 7, 6, 0.6),
(27, 9, 6, 0.8),
(28, 11, 6, 0.6),
(29, 12, 6, 0.6),
(30, 13, 6, 0.8),
(31, 14, 6, 0.4),
(32, 15, 6, 0.4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
