-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 22, 2025 at 04:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` varchar(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
('C001', 'Drinks', 'All drinks'),
('C002', 'Electronics', 'All electronic devices'),
('C003', 'Snacks', 'All snacks '),
('C004', 'Bakery', 'All breads and wheat products'),
('C005', 'Furnitures', 'All wooden and Glass furnitures');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `address`) VALUES
('CU001', 'Jinwoo', 'Korea'),
('CU002', 'Gojo', 'Japan'),
('CU003', 'Goku', 'China'),
('CU004', 'Dante', 'America'),
('CU005', 'kamado', 'Japan');

-- --------------------------------------------------------

--
-- Table structure for table `customers_contacts`
--

CREATE TABLE `customers_contacts` (
  `contact_id` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumbers` varchar(20) DEFAULT NULL,
  `customer_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_contacts`
--

INSERT INTO `customers_contacts` (`contact_id`, `email`, `phoneNumbers`, `customer_id`) VALUES
('CUS001', 'qwe@gmail.com', '0712345678', 'CU001'),
('CUS002', 'wer@gmail.com', '0712345678', 'CU002'),
('CUS003', 'ert@gmail.com', '0712345678', 'CU003'),
('CUS004', 'rty@gmail.com', '0712345678', 'CU004'),
('CUS005', 'tyu@gmail.com', '0712345678', 'CU005');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_id` varchar(11) NOT NULL,
  `order_created_by` datetime DEFAULT NULL,
  `order_updated_at` datetime DEFAULT NULL,
  `order_status` enum('NotDelivered','pending','Delivered','') DEFAULT NULL,
  `product_id` varchar(11) DEFAULT NULL,
  `customer_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_id`, `order_created_by`, `order_updated_at`, `order_status`, `product_id`, `customer_id`) VALUES
('OD001', '2025-07-17 17:12:50', '2025-07-18 17:12:50', 'NotDelivered', 'P001', 'CU001'),
('OD002', '2025-07-17 17:12:50', '2025-07-18 17:12:50', 'pending', 'P002', 'CU002'),
('OD003', '2025-07-17 17:12:50', '2025-07-18 17:12:50', 'Delivered', 'P003', 'CU003'),
('OD004', '2025-07-17 17:12:50', '2025-07-18 17:12:50', 'pending', 'P004', 'CU004'),
('OD005', '2025-07-17 17:12:50', '2025-07-18 17:12:50', 'Delivered', 'P005', 'CU005');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `picture` varchar(16000) NOT NULL,
  `category_id` varchar(11) DEFAULT NULL,
  `supplier_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `number`, `picture`, `category_id`, `supplier_id`) VALUES
('P001', 'juice', 0, '', 'C001', 'S001'),
('P002', 'Computer', 0, '', 'C002', 'S002'),
('P003', 'Biscuits', 0, '', 'C003', 'S003'),
('P004', 'Bread\r\n', 0, '', 'C004', 'S004'),
('P005', 'Chair', 0, '', 'C005', 'S005'),
('P006', 'Smartphones', 0, '', 'C002', 'S005'),
('P007', 'TV', 0, '', 'C002', 'S002'),
('P008', 'SODA', 0, '', 'C001', 'S004'),
('P009', 'BOOKS', 0, '', 'C001', 'S001');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchases_id` varchar(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `product_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchases_id`, `purchase_date`, `product_id`) VALUES
('PU001', '2025-07-17', 'P001'),
('PU002', '2025-07-17', 'P002'),
('PU003', '2025-07-17', 'P003'),
('PU004', '2025-07-17', 'P004'),
('PU005', '2025-07-17', 'P005');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` varchar(11) NOT NULL,
  `supplier_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`) VALUES
('S001', 'Cocacola.Co'),
('S002', 'Hp.ent'),
('S003', 'Warsame.co'),
('S004', 'Shishi.bk'),
('S005', 'Deus.corp');

-- --------------------------------------------------------

--
-- Table structure for table `supplierscontacts`
--

CREATE TABLE `supplierscontacts` (
  `contact_id` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `supplier_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplierscontacts`
--

INSERT INTO `supplierscontacts` (`contact_id`, `email`, `phoneNumber`, `supplier_id`) VALUES
('CS001', 'cocacola@gmail.com', '0712345678', 'S001'),
('CS002', 'hp@gmail.com', '0712345678', 'S002'),
('CS003', 'warsame@gmail.com', '0712345678', 'S003'),
('CS004', 'shishi@gmail.com', '0712345678', 'S004'),
('CS005', 'deus@gmail.com', '0712345678', 'S005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customers_contacts`
--
ALTER TABLE `customers_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchases_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplierscontacts`
--
ALTER TABLE `supplierscontacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `supplier_id` (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
