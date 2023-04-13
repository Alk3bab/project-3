-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 01:50 PM
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
-- Database: `project3`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klachten`
--

CREATE TABLE `klachten` (
  `id` int(9) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `bericht` text NOT NULL,
  `datumtijd` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klachten`
--

INSERT INTO `klachten` (`id`, `naam`, `bericht`, `datumtijd`) VALUES
(4, 'piet', 'test\r\n', '2023-04-05 09:49:41'),
(5, 'ikram', 'test klacht\r\n', '2023-04-05 10:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('pending','completed','cancelled') NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'CASEIN - STRAWBERRY', NULL, '19.99', 'caseinshake.jpg'),
(2, 'Whey Eiwit Proteïne\r\n', NULL, '24.99', 'pureshake.jpg'),
(3, 'Vegan Fit Factors Protein\r\n', NULL, '29.99', 'veganshake.jpg'),
(4, 'Nutrition - Whey PROTEÏNE - Dieet Shake\r\n', NULL, '15.99', 'ftwshake.jpg'),
(5, 'BEAUTY & SKINNY PROTEÏNE SHAKE\r\n', NULL, '29.99', 'beatyshake.jpg'),
(6, 'Dieet shake whey proteine chocolade\r\n', NULL, '39.99', 'labertsshake.jpg'),
(7, 'DMK Whey Proteïne shake Aardbei\r\n', NULL, '19.99', 'dmkshake.jpg'),
(8, 'Slim Protein Shake (Afslank Shake)\r\n', NULL, '22.99', 'slimshake.jpg'),
(9, 'VEGAN PROTEÏNE SHAKE-1kg\r\n', NULL, '14.99', 'veganshakee.jpg'),
(10, 'OPTIMUM PROTEIN SHAKE\r\n', NULL, '27.99', 'optiumshake.jpg'),
(11, 'BodyLab Whey Protein\r\n', NULL, '23.99', 'bodylabshake.jpg'),
(12, 'Smoothie Aardbei\r\n', NULL, '18.99', 'aardbeishake.jpg'),
(13, 'ATP SCIENCE Creatine\r\n', NULL, '19.99', 'ATPshake.webp'),
(14, 'CREATINE - Perfect Nutrition\r\n', NULL, '24.99', 'perfectshake.jpg'),
(15, 'CREATINE ULTRA\r\n', NULL, '29.99', 'ultrashake.jpg'),
(17, 'Creatine Monohydrate 500g | Watermelon\r\n', NULL, '29.99', 'creashake.jpg'),
(18, 'Peak Peformance Creatine Monohydrate Natural, 500 gram\r\n', NULL, '39.99', 'peakshake.jpg'),
(19, 'Creatine Micronized 250G\r\n', NULL, '19.99', 'applieshake.jpg'),
(20, '100% Creatine Monohydrate\r\n', NULL, '22.99', 'slimshake.jpg'),
(21, 'Syntech Creatine Monohydrate\r\n', NULL, '14.99', 'synshake.jpg'),
(22, 'QNT Creatine Monohydrate\r\n', NULL, '24.99', 'qntshake.jpg'),
(23, 'Creatinemonohydraat Tabletten\r\n', NULL, '22.99', 'myproshake.jpg'),
(24, 'Creatine Monohydraat\r\n', NULL, '16.99', 'bioshake.jpg'),
(25, 'X-CITE\r\n', NULL, '29.99', 'xshake.jpg'),
(26, 'C9 Extreme Rock Pre Workout Supplement\r\n', NULL, '24.99', 'c9shake.webp'),
(27, 'Bulk Pre-Workout Supplements - Strawberry\r\n', NULL, '29.99', 'bulkshake.jpg'),
(28, 'Pre Workout Supplement\r\n', NULL, '15.99', 'nakedshake.webp'),
(29, 'Gold Standard Plant Pre Workout Strawberry\r\n', NULL, '39.99', 'plantshake.png'),
(30, 'Pre JYM High-Performance Pre-Workout\r\n', NULL, '19.99', 'preshake.webp'),
(31, 'Dutch Giant Nutrition - Pre Workout\r\n', NULL, '22.99', 'dutchshake.webp'),
(32, 'PRE-WORKOUT KOSSOINE Cola\r\n', NULL, '14.99', 'kossoshake.png'),
(33, 'Nitrosurge Pre-Workout Powder\r\n', NULL, '28.99', 'nitroshake.webp'),
(34, 'Blast! Pre Workout\r\n', NULL, '24.99', 'blastshake.webp'),
(35, 'C4 ORIGINAL PRE-WORKOUT\r\n', NULL, '18.99', 'c4shake.webp');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `Id` int(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`Id`, `name`, `review`, `datetime`) VALUES
(1, 'piet', 'test\r\n', '2023-04-05 10:55:34'),
(2, 'piet', 'test review\r\n', '2023-04-05 10:55:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `klachten`
--
ALTER TABLE `klachten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klachten`
--
ALTER TABLE `klachten`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `Id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
