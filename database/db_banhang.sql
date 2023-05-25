-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2021 at 03:44 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `BrandID` int(11) UNSIGNED NOT NULL,
  `BrandName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`BrandID`, `BrandName`) VALUES
(1, 'Philipper Auguste'),
(2, 'Epos Swiss'),
(3, 'Diamond D');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Đồng hồ nam'),
(2, 'Đồng hồ nữ'),
(3, 'Đồng hồ cặp');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `DetailID` int(11) UNSIGNED NOT NULL,
  `ProID` int(11) NOT NULL,
  `Duongkinhmat` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chongnuoc` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieumat` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Nangluongsudung` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Sizeday` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieuday` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieuvo` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Kieudang` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Xuatxu` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chedobaohanh` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`DetailID`, `ProID`, `Duongkinhmat`, `Chongnuoc`, `Chatlieumat`, `Nangluongsudung`, `Sizeday`, `Chatlieuday`, `Chatlieuvo`, `Kieudang`, `Xuatxu`, `Chedobaohanh`) VALUES
(41, 72, '28mm', '\r\n3ATM', '\r\nKính sapphire', 'Quartz/Pin', '\r\n12mm', '\r\nHợp kim mạ PVD', 'Hợp kim mạ PVD , đính đá swarovsky', '\r\nĐồng hồ Nữ', '\r\nChina', '\r\nBảo hành quốc tế 10 năm'),
(42, 73, '\r\n24mm', '\r\n3ATM', '\r\nKính sapphire', '\r\nQuartz/Pin', '12mm', '\r\nHợp kim mạ PVD', '\r\nHợp kim mạ PVD , đính đá swarovsky', '\r\nĐồng hồ Nữ', '\r\nChina', '\r\nBảo hành quốc tế 10 năm'),
(43, 62, '\r\n40 mm', '\r\n5 ATM', '\r\nSapphire', '\r\nAutomatic (Cơ tự động)', '', '\r\nStainless Steel', '\r\nStainless Steel', '\r\nĐồng hồ Nam', '\r\nÁo', '\r\nBảo hành quốc tế 02 năm'),
(44, 63, '40 mm', '\r\n5 ATM', '\r\nSapphire', '\r\nAutomatic ( cơ tự động )', '\r\n20 mm', '\r\nDây da', '\r\nStainless Steel', '\r\nĐồng hồ Nam', '\r\nÁo', '\r\nBảo hành quốc tế 02 năm'),
(45, 64, '\r\n42 mm', '\r\n5 ATM', '\r\nSapphire', '\r\nAutomatic (Cơ tự động)', '\r\n22 mm', '\r\nDây da chính hãng', '\r\nStainless Steel', '\r\nĐồng hồ Nam', '\r\nChina', '\r\nBảo hành quốc tế 02 năm'),
(46, 65, '\r\n40 mm', '\r\n5 ATM', '\r\nSapphire', '\r\nAutomatic (Cơ tự động)', '', '\r\nDây da chính hãng', 'Stainless Steel', '\r\nĐồng hồ Nam', '\r\nÁo', '\r\nBảo hành quốc tế 02 năm'),
(47, 66, '\r\n43.5 mm', '\r\n5 ATM', '\r\nSapphire', 'Máy cơ lên cót bằng tay\r\n\r\n', '\r\n20 mm', '\r\nDây da', '\r\nStainless Steel', '\r\nĐồng hồ Nam', '\r\nThụy Sỹ', '\r\nBảo hành quốc tế 02 năm'),
(48, 67, '\r\n43.5 mm', '\r\n5 ATM', '\r\nSapphire', 'Máy cơ lên cót bằng tay', '20 mm', '\r\nDây da', 'Stainless Steel', '\r\nĐồng hồ Nam', '\r\nThụy Sỹ', '\r\nBảo hành quốc tế 02 năm'),
(49, 61, '39 mm', '\r\n5 ATM', '\r\nSapphire', 'Quartz/Pin', '', 'Stainless Steel', '\r\nStainless Steel', '\r\nNam', 'Áo', '\r\nBảo hành quốc tế 02 năm'),
(50, 71, '\r\n26mm', '\r\n3ATM', '\r\nKính sapphire', '\r\nQuartz/Pin', '\r\n8mm', '\r\nHợp kim mạ PVD rose gold , đính đá swarovsky', '\r\nHợp kim mạ PVD , đính đá swarovsky', '\r\nĐồng hồ Nữ', '\r\nChina', '\r\nBảo hành quốc tế 10 năm'),
(51, 68, '\r\n34mm', '\r\n3ATM', '\r\nKính sapphire', '\r\nQuartz (Điện tử)', '\r\n16mm', '\r\nThép không gỉ mạ PVD', '\r\nThép không gỉ mạ PVD', '\r\nĐồng hồ Nữ', 'Thụy Sỹ', '\r\nBảo hành quốc tế 02 năm'),
(52, 69, '\r\n34mm', '\r\n3ATM', '\r\nKính sapphire', '\r\nQuartz (Điện tử)', '\r\n16mm', '\r\nThép không gỉ mạ PVD', '\r\nThép không gỉ mạ PVD', '\r\nĐồng hồ Nữ', '\r\nThụy Sỹ', '\r\nBảo hành quốc tế 02 năm'),
(56, 83, ' Nam 42 mm / nữ 34 mm', ' Nam 10 ATM / nữ 5 ATM', ' Sapphire', ' Quartz/Pin', '', ' Dây da chính hãng', ' Stainless Steel', ' Đồng hồ đôi', '', ' Bảo hành quốc tế 02 năm'),
(57, 84, ' Nam 42 mm / nữ 34 mm', ' Nam 10 ATM / nữ 5 ATM', ' Sapphire', ' Quartz/Pin', '', 'Dây da chính hãng', ' Stainless Steel', 'Đồng hồ đôi', '', ' Bảo hành quốc tế 02 năm');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `TenSanPham` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ID`, `OrderID`, `ProID`, `TenSanPham`, `Quantity`, `Price`, `Amount`) VALUES
(19, 96, 73, '                         Đồng hồ Diamond D DM36505IG - Nữ   ', 3, 4500000, 13500000),
(20, 96, 72, '                         Đồng hồ Diamond D DM38445IG - Nữ   ', 4, 4000000, 16000000),
(18, 96, 69, 'Đồng hồ Epos Swiss E-8000.700.22.88 - Nữ', 2, 60000000, 120000000),
(26, 99, 69, 'Đồng hồ Epos Swiss E-8000.700.22.88 - Nữ', 2, 60000000, 120000000),
(25, 99, 84, 'ĐỒNG HỒ PHILIPPE AUGUSTE + Diamond D', 1, 8000000, 8000000),
(23, 98, 72, '                         Đồng hồ Diamond D DM38445IG - Nữ   ', 1, 4000000, 4000000),
(24, 98, 83, 'Đồng hồ Philippe Auguste PA5006G + Diamond D', 1, 12000000, 12000000),
(27, 100, 72, '                         Đồng hồ Diamond D DM38445IG - Nữ   ', 1, 4000000, 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UserID` int(11) NOT NULL,
  `Tenkhachhang` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Total` bigint(20) NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Trangthai` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Đang chờ xử lý'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderDate`, `UserID`, `Tenkhachhang`, `Address`, `Total`, `Phone`, `Trangthai`) VALUES
(96, '2021-11-10 18:56:53', 23, 'Bùi Quang Huy', '111-Bùi Quang Huy', 149500000, '0868400973', 'Đang chờ xử lý'),
(99, '2021-11-11 09:36:07', 23, 'Bùi Quang Huy', 'Phú Thọ', 128000000, '0868400973', 'Đang chờ xử lý'),
(98, '2021-11-11 09:23:46', 3, 'Bùi Quang Huy', 'hn', 16000000, '0868400973', 'Đang chờ xử lý'),
(100, '2021-11-11 09:36:56', 23, 'Bùi Quang Huy', '', 4000000, '', 'Đang chờ xử lý');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Viewer` int(11) NOT NULL,
  `Sold` int(11) NOT NULL,
  `Date` datetime DEFAULT current_timestamp(),
  `CatID` int(11) NOT NULL,
  `BrandID` int(11) NOT NULL,
  `images` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `Description`, `Price`, `Quantity`, `Viewer`, `Sold`, `Date`, `CatID`, `BrandID`, `images`) VALUES
(83, 'Đồng hồ Philippe Auguste PA5006G + Diamond D', 'Thương hiệu:Đồng hồ cặp,Kiểu dáng: Đồng hồ nữ,nam,Năng lượng: Quartz,Chất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,Chất liệu dây:Hợp kim mạ PVD,Mặt kính: Sapphire ( Kính chống trầy ),Kích thước: 28 mm,Chống nước: 3 ATM,Bảo hành: 10 năm về máy và đá , 2 năm về pin,Thương hiệu: Anh ,Máy: Japan Myota citizen Quartz', 12000000, 20, 0, 0, '2021-10-26 11:28:10', 3, 1, 'anh32.jpg'),
(84, 'ĐỒNG HỒ PHILIPPE AUGUSTE + Diamond D', 'Thương hiệu:Đồng hồ cặp,Kiểu dáng: Đồng hồ nữ,nam,Năng lượng: Quartz,Chất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,Chất liệu dây:Hợp kim mạ PVD,Mặt kính: Sapphire ( Kính chống trầy ),Kích thước: 28 mm,Chống nước: 3 ATM,Bảo hành: 10 năm về máy và đá , 2 năm về pin,Thương hiệu: Anh ,Máy: Japan Myota citizen Quartz', 8000000, 14, 0, 0, '2021-10-26 12:12:09', 3, 1, 'anh31.jpg'),
(71, '                         Đồng hồ Diamond D DM38025IG - Nữ   ', 'Thương hiệu: Đồng hồ nữ Diamond D,\r\n\r\nKiểu dáng: Đồng hồ nữ,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 10000000, 10, 0, 0, '2021-10-22 19:10:38', 2, 3, 'anh21.jpg'),
(72, '                         Đồng hồ Diamond D DM38445IG - Nữ   ', 'Thương hiệu: Đồng hồ nữ Diamond D,\r\n\r\nKiểu dáng: Đồng hồ nữ,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 4000000, 30, 0, 0, '2021-10-22 19:12:12', 2, 3, 'anh22.jpg'),
(73, '                         Đồng hồ Diamond D DM36505IG - Nữ   ', 'Thương hiệu: Đồng hồ nữ Diamond D\r\n\r\nKiểu dáng: Đồng hồ nữ\r\n\r\nNăng lượng: Quartz\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky\r\n\r\nChất liệu dây: Hợp kim mạ PVD\r\n\r\nMặt kính: Sapphire ( Kính chống trầy )\r\n\r\nKích thước : 24mm\r\n\r\nChống nước : 3 ATM\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin\r\n\r\nThương hiệu: Anh \r\n\r\nMáy: Japan Myota citizen Quartz', 4500000, 5, 0, 0, '2021-10-22 19:14:05', 2, 3, 'anh23.jpg'),
(62, 'Đồng hồ Philippe Auguste PA5001D- Nam', 'Thương hiệu: Đồng hồ Philippe Auguste PA5001D,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 5000000, 6, 0, 0, '2021-10-22 16:44:41', 1, 1, 'anh2.jpg'),
(63, '  Đồng hồ Philippe Auguste PA5008A - Nam', 'Thương hiệu: Đồng hồ Philippe Auguste PA5001D,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 10000000, 9, 0, 0, '2021-10-22 16:47:39', 1, 1, 'anh3.jpg'),
(64, 'ĐỒNG HỒ PHILIPPE AUGUSTE PA-555.1 - Nam', 'Thương hiệu: Đồng hồ Philippe Auguste PA5001D,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 15000000, 18, 0, 0, '2021-10-22 16:49:23', 1, 1, 'anh4.jpg'),
(65, ' Đồng hồ Philippe Auguste PA5002B - Nam', 'Thương hiệu: Đồng hồ Philippe Auguste PA5002B,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 6000000, 22, 0, 0, '2021-10-22 16:53:17', 1, 1, 'anh5.jpg'),
(66, ' ĐỒNG HỒ EPOS SWISS E-3435.313.20.25.25 - Nam', 'Thương hiệu: Đồng hồ EPOS SWISS E-3435.313.20.25.25,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 10000000, 30, 0, 0, '2021-10-22 18:15:51', 1, 2, 'anh11.jpg'),
(67, ' ĐỒNG HỒ EPOS SWISS E-3435.313.24.26 - Nam', 'Thương hiệu: Đồng hồ EPOS SWISS E-3435.313.24.26,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 50000000, 40, 0, 0, '2021-10-22 18:21:32', 1, 2, 'anh12.jpg'),
(68, 'Đồng hồ Epos Swiss E-8000.700.28.85 - Nữ', 'Thương hiệu: Đồng hồ Epos Swiss E-8000.700.28.85,\r\n\r\nKiểu dáng: Đồng hồ nữ,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 40000000, 10, 0, 0, '2021-10-22 18:57:25', 2, 2, 'anh13.jpg'),
(69, 'Đồng hồ Epos Swiss E-8000.700.22.88 - Nữ', 'Thương hiệu: Đồng hồ Epos Swiss E-8000.700.22.88,\r\n\r\nKiểu dáng: Đồng hồ nữ,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 60000000, 10, 0, 0, '2021-10-22 18:59:38', 2, 2, 'anh14.jpg'),
(61, 'ĐỒNG HỒ PHILIPPE AUGUSTE PA5005L - Nam', 'Thương hiệu: Đồng hồ Philippe Auguste PA5005L,\r\n\r\nKiểu dáng: Đồng hồ nam,\r\n\r\nNăng lượng: Quartz,\r\n\r\nChất liệu vỏ: Hợp kim mạ PVD , đính đá swarovsky,\r\n\r\nChất liệu dây:Hợp kim mạ PVD,\r\n\r\nMặt kính: Sapphire ( Kính chống trầy ),\r\n\r\n\r\nKích thước: 28 mm,\r\n\r\nChống nước: 3 ATM,\r\n\r\nBảo hành: 10 năm về máy và đá , 2 năm về pin,\r\n\r\nThương hiệu: Anh ,\r\n\r\nMáy: Japan Myota citizen Quartz', 7000000, 10, 0, 0, '2021-10-22 16:39:58', 1, 1, 'anh1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('C8VXjlJYnnANmwha131eJt_30SIcvCdu', 1636636055, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":23,\"f_Username\":\"buihuy\",\"f_Password\":\"1\",\"f_Name\":\"Bùi Quang Huy\",\"f_Email\":\",buiquanghuy1011@gmail.com\",\"f_DOB\":\"2021-11-10T00:00\",\"f_Permission\":\"khachhang\"},\"cart\":[]}'),
('buUGDlqyWc2xk_UnKBoUSkxvhirARvrE', 1636684995, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"admin\",\"f_Password\":\"1\",\"f_Name\":\"Admin\",\"f_Email\":\"admin1011@gmail.com\",\"f_DOB\":\"2000-10-10\",\"f_Permission\":\"admin\"},\"cart\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `f_Permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'khachhang'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`f_ID`, `f_Username`, `f_Password`, `f_Name`, `f_Email`, `f_DOB`, `f_Permission`) VALUES
(1, 'admin', '1', 'Admin', 'admin1011@gmail.com', '2000-10-10', 'admin'),
(3, 'quanghuy', '1', 'Bùi Quang Huy', 'buiquanghuy1011@gmail.com', '10-11-2000', 'khachhang'),
(23, 'buihuy', '1', 'Bùi Quang Huy', ',buiquanghuy1011@gmail.com', '2021-11-10T00:00', 'khachhang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`f_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `BrandID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `DetailID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `f_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
