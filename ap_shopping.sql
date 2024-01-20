-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2024 at 07:26 AM
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
-- Database: `ap_shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Bag', 'Gucci', NULL, '2024-01-15 12:35:12'),
(2, 'T-shirt', 'LV', NULL, '2024-01-15 12:35:22'),
(3, 'Shoe', 'Nike', NULL, '2024-01-15 13:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `quantity`, `price`, `image`, `created_at`, `updated_at`) VALUES
(7, 'LV T-shirt', 'Men-wear', 2, 49, 433400, 'louis-vuitton-signature-short-sleeved-t-shirt-ready-to-wear--HNN42WOY8900_PM2_Front view.jpg', NULL, '2024-01-15 16:49:11'),
(9, 'White LV Shirt', 'Unisex', 2, 6, 1200000, 'louis-vuitton-graphic-logo-t-shirt_21466524_46968332_2048.jpg', NULL, '2024-01-17 11:11:58'),
(10, 'Nike shoe', 'men-wear', 3, 0, 150000, 'revolution-6-road-running-shoes-NC0P7k.png', NULL, '2024-01-17 11:48:54'),
(11, 'adidas Women\'s Znchill Running Shoe', 'Women wear', 3, 2, 120000, 'allbirds-sneakers-review-tree-runnerjpg.jpg', NULL, '2024-01-17 11:51:25'),
(12, 'Beige / Ebony GG Supreme Ophidia Small Tote Bag', 'Gucci', 1, 4, 1220000, 'images.jpg', NULL, '2024-01-17 17:01:58'),
(13, 'LARGE LADY DIOR BAG', 'Bag', 1, 1497, 1450000, 'dior.jpg', NULL, '2024-01-18 14:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `sale_orders`
--

CREATE TABLE `sale_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_orders`
--

INSERT INTO `sale_orders` (`id`, `user_id`, `total_price`, `order_date`) VALUES
(1, 5, 433400, '2024-01-15 12:00:46'),
(3, 8, 1600000, '2024-01-19 06:24:44'),
(4, 8, 583400, '2024-01-19 06:29:14'),
(5, 8, 122000000, '2024-01-19 07:09:01'),
(6, 6, 2900000, '2024-01-19 07:11:58'),
(7, 6, 240000, '2024-01-19 07:15:50'),
(8, 4, 2400000, '2024-01-19 07:21:05'),
(9, 9, 2520000, '2024-01-20 05:44:52'),
(10, 6, 6100000, '2024-01-20 05:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `sale_order_details`
--

CREATE TABLE `sale_order_details` (
  `id` int(11) NOT NULL,
  `sale_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_order_details`
--

INSERT INTO `sale_order_details` (`id`, `sale_order_id`, `product_id`, `quantity`, `order_date`) VALUES
(1, 1, 7, 1, '2024-01-16 11:04:28'),
(2, 3, 13, 1, '2024-01-19 11:54:44'),
(3, 3, 10, 1, '2024-01-19 11:54:44'),
(4, 4, 7, 1, '2024-01-19 11:59:14'),
(5, 4, 10, 1, '2024-01-19 11:59:14'),
(6, 5, 12, 1, '2024-01-19 12:39:01'),
(7, 6, 13, 2, '2024-01-19 12:41:58'),
(8, 7, 11, 2, '2024-01-19 12:45:50'),
(9, 8, 9, 2, '2024-01-19 12:51:05'),
(10, 9, 9, 2, '2024-01-20 11:14:52'),
(11, 9, 11, 1, '2024-01-20 11:14:52'),
(12, 10, 12, 5, '2024-01-20 11:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `phone`, `role`, `created_at`, `updated_at`) VALUES
(4, 'mimi', 'mimi@gmail.com', '$2y$10$8aiBf7yOl4gnR3VBurnHGODkpSSBmprp9vvfrfoFSwEcCkjb6ossu', '', '', 0, '2024-01-15 06:06:59', '2024-01-15 06:06:59'),
(5, 'op', 'op@gmail.com', '$2y$10$WFja5JLhVHYZvQm9iORCBOagxkoCGWR2kiyEOJrZA2pKHcleM1Ej2', '', '', 1, '2024-01-16 03:51:32', '2024-01-16 03:51:32'),
(6, 'ei', 'ei@gmail.com', '$2y$10$.hzTAovZlwVEPEmrpdloKO7yGE7kR5i/rc.Q/j77Qx8vnh0JFJrHK', 'ygn', '09452664979', 0, '2024-01-16 09:46:20', '2024-01-16 09:46:20'),
(8, 'admin', 'admin@gmail.com', '$2y$10$z23CZ7H0g87El5bB9JKwUeTejUvSMLoPpRgL2WIXpsVSth7bYBPeq', '', '', 1, '2024-01-17 04:20:20', '2024-01-17 04:20:20'),
(9, 'wangwang', 'wangwang@gmail.com', '$2y$10$bNmsSvzCa39SViAzQFFEvurPsRGcmtE13/oakpQHoJKlB8dyhfbcu', 'Taipei', '09452664979', 0, '2024-01-20 04:41:18', '2024-01-20 04:41:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_orders`
--
ALTER TABLE `sale_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_order_details`
--
ALTER TABLE `sale_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sale_orders`
--
ALTER TABLE `sale_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sale_order_details`
--
ALTER TABLE `sale_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
