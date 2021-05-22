-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2020 at 12:47 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gigo`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `street_id` varchar(40) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`street_id`, `street`, `city`) VALUES
('01S', 'St. Josephvaz lane', 'Rambaikulam'),
('02S', 'St. Mothertheresa lane', 'Rambaikulam'),
('03S', 'Horowapothana Road', 'Rambaikulam'),
('04S', 'Rani mill Road', 'Rambaikulam'),
('05S', 'Station Road', 'Vairavapuliyankulam'),
('06S', 'Mannar Road', 'Vairavapuliyankulam'),
('07S', 'Vairavar Kovil Road', 'Vairavapuliyankulam'),
('08S', 'Mill Road', 'Vavuniya Town'),
('09S', 'Kanthasamy kovil Road', 'Vavuniya Town'),
('10S', 'Kandy Road', 'Vavuniya Town'),
('11S', 'Jaffna Road', 'Vavuniya Town'),
('12S', 'Park Road', 'Vavuniya Town'),
('13S', 'Bazar street', 'Vavuniya Town'),
('14S', 'Goodshed', 'Thonikal'),
('15S', 'Station Road', 'Thonikal'),
('16S', 'Inner circular Road', 'Thonikal'),
('17S', 'Outer circular Road', 'Thonikal'),
('18S', 'Mannar Road', 'Kurmankaadu'),
('19S', 'Kurmankaadu junction', 'Kurmankaadu'),
('20S', 'Station Road', 'Kurmankaadu'),
('21S', '1st lane', 'Kurmankaadu'),
('22S', '2nd lane', 'Kurmankaadu');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(30) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `House_no` varchar(10) DEFAULT NULL,
  `street_id` varchar(10) DEFAULT NULL,
  `contact_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `Name`, `House_no`, `street_id`, `contact_no`) VALUES
(1, 'Patrick', '70h', '02S', '773736353'),
(2, 'Thanis', '71h', '03S', '767645347'),
(3, 'Mohan', '72h', '02S', '768956423'),
(4, 'Jeya kumar', '73h', '20S', '714589042'),
(5, 'Jeyakumar', '74h', '04S', '789056312'),
(6, 'Siva', '75h', '04S', '774532789'),
(7, 'Vijay', '76h', '06S', '768954326'),
(8, 'Kamal', '77h', '09S', '758906531'),
(9, 'Joy', '78h', '13S', '778953426');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(30) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  `decomposable` int(50) DEFAULT NULL,
  `nondecomposable` int(50) DEFAULT NULL,
  `capablecompost` int(50) DEFAULT NULL,
  `ecobrick` int(50) DEFAULT NULL,
  `amount` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `total`, `decomposable`, `nondecomposable`, `capablecompost`, `ecobrick`, `amount`) VALUES
(1, 10, 6, 4, 3, 7, 200),
(2, 6, 3, 3, 1, 4, 150),
(3, 10, 4, 6, 2, 5, 400),
(4, 8, 6, 2, 3, 4, 180),
(5, 7, 4, 3, 2, 2, 100),
(6, 9, 5, 4, 3, 3, 220),
(7, 5, 2, 3, 1, 2, 60),
(8, 11, 6, 5, 3, 7, 260),
(9, 7, 3, 4, 1, 3, 120);

-- --------------------------------------------------------

--
-- Table structure for table `lorry`
--

CREATE TABLE `lorry` (
  `lorry_id` varchar(30) NOT NULL,
  `Driver_id` varchar(30) DEFAULT NULL,
  `Driver_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lorry`
--

INSERT INTO `lorry` (`lorry_id`, `Driver_id`, `Driver_name`) VALUES
('AAD-7898', '04D', 'Kumaran'),
('ABC-3454', '01D', 'Ravi'),
('HA-1892', '05D', 'Visnu'),
('HD-2657', '02D', 'Raj'),
('PQ-9667', '03D', 'Navam');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `id` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `id`) VALUES
('patrick@gamil.com', '12345', 1),
('thanis17@gamil.com', 'p1234', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`street_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD KEY `fk_street_id` (`street_id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD KEY `details_ibfk_1` (`id`);

--
-- Indexes for table `lorry`
--
ALTER TABLE `lorry`
  ADD PRIMARY KEY (`lorry_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD KEY `fk_id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_street_id` FOREIGN KEY (`street_id`) REFERENCES `address` (`street_id`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
