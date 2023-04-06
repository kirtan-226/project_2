-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2023 at 07:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `ingre_category`
--

CREATE TABLE `ingre_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingre_category`
--

INSERT INTO `ingre_category` (`id`, `category`) VALUES
(1, 'anaj-kathod'),
(2, 'masala'),
(3, 'vegetables'),
(4, 'liquid'),
(5, 'dryfruits'),
(6, 'dairy'),
(7, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `ingre_list`
--

CREATE TABLE `ingre_list` (
  `id` int(11) NOT NULL,
  `ingre_category` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL,
  `qty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingre_list`
--

INSERT INTO `ingre_list` (`id`, `ingre_category`, `ingredient`, `cost`, `qty`) VALUES
(1, 6, 'milk', 50, '200L'),
(2, 6, 'butter', 250, '500g'),
(3, 5, 'kaju', 300, '1kg'),
(4, 2, 'salt', 300, '2kg'),
(5, 2, 'sugar', 200, '2kg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingre_category`
--
ALTER TABLE `ingre_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingre_list`
--
ALTER TABLE `ingre_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingre_category_foriegn_key` (`ingre_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingre_category`
--
ALTER TABLE `ingre_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingre_list`
--
ALTER TABLE `ingre_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingre_list`
--
ALTER TABLE `ingre_list`
  ADD CONSTRAINT `ingre_category_foriegn_key` FOREIGN KEY (`ingre_category`) REFERENCES `ingre_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
