
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 07:24 PM
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
-- Database: `rat2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`) VALUES
(2, 'tahmidhasanrafi9@gmail.com', '$2b$12$g0XfsVQez/pnL4YwW0yV2uxLsCW13DC4FC/6U3qmFvZILeXnjPS5i');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transactions` text NOT NULL,
  `previous_hash` varchar(255) NOT NULL,
  `nonce` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `index`, `timestamp`, `transactions`, `previous_hash`, `nonce`, `hash`) VALUES
(1, 1, '0000-00-00 00:00:00', '[]', '52283b44bf578290451398db886d447418e0d1e0fa0764cb4628949158aac782', 556, '00003aeda1cfcac5f42a778b02300d0b01fff1bcae408aa217b8515a5d57e2c1'),
(2, 2, '0000-00-00 00:00:00', '[{\'sender\': None, \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1}]', '00003aeda1cfcac5f42a778b02300d0b01fff1bcae408aa217b8515a5d57e2c1', 165089, '0000d509a2ed948b663c6b25bf8dc246f5d58a8af4d291e2b46acb4eff13a8d6'),
(3, 3, '0000-00-00 00:00:00', '[{\'sender\': None, \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1}]', '0000d509a2ed948b663c6b25bf8dc246f5d58a8af4d291e2b46acb4eff13a8d6', 136887, '00004ab2fe13896b78e24c3c16b763ac3f2e8b6515f78ac36a056fbdae411850'),
(4, 4, '0000-00-00 00:00:00', '[{\'sender\': None, \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 1}]', '00004ab2fe13896b78e24c3c16b763ac3f2e8b6515f78ac36a056fbdae411850', 37833, '000083b7370a0baafd555617c4cec399c718deae24891891b8a3a02dc721aea2'),
(5, 5, '0000-00-00 00:00:00', '[{\'sender\': None, \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 1}]', '000083b7370a0baafd555617c4cec399c718deae24891891b8a3a02dc721aea2', 55429, '00002f3c98c4cf6ce57b7960c051bc2d80cb89e3e5cb8f8510635cf4d10c68ae'),
(6, 6, '0000-00-00 00:00:00', '[{\'sender\': None, \'recipient\': \'be1702f5-1e95-4d69-b0ab-e997273afdb2\', \'amount\': 1}]', '00002f3c98c4cf6ce57b7960c051bc2d80cb89e3e5cb8f8510635cf4d10c68ae', 2382, '0000581bf4268585c8cf14c1546452d61023d1b180871f489f59c6f325e36efa'),
(7, 1, '0000-00-00 00:00:00', '[]', 'cb0dbc97cbf80b15e70b9308a2066c1c894e32d6bcef08b5b284cc1f2fa563de', 190365, '0000d955ce9af660dd1ebd574ea5ad2446780c09323f7af7078ba367061f5db8'),
(8, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.07}]', '1036f7dd9f03b75993372a603bcaa68846cff8491af32729a967e8d604d126f1', 46, '003d6db337cd8e2d8119fc1722304065bfda2e9e0cb1bda67e676cad3a0c59eb'),
(9, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.11}]', '003d6db337cd8e2d8119fc1722304065bfda2e9e0cb1bda67e676cad3a0c59eb', 160, '00660045dfabbc80e62c5732872736a5994f0d826fda613e0966855f394641ba'),
(10, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.08}]', '00660045dfabbc80e62c5732872736a5994f0d826fda613e0966855f394641ba', 342, '00255ea2ec53a638831a29e0f3c40fe540eb0a794fa1b0358a3a6bbfe7a3a7e2'),
(11, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.12}]', '06ec70a9fbc32ee5e7af17d47e18dae5226daf55fe05e4fec3e0305ed3501af4', 607, '004297bdf3d7173b7e09396da612b2f5bea9b18f0cb783de402f7c9be051fa0d'),
(12, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.03}]', '004297bdf3d7173b7e09396da612b2f5bea9b18f0cb783de402f7c9be051fa0d', 349, '00551c21c1717e1e2fa3c3904bbb81bc67aa59166c4dbb9b616d9eae02a0d88a'),
(13, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.08}]', 'cf7950b0f3a3362aaffe4559c0ab711019b0cde54e42c2f162a3bee0957afb23', 75, '0049ecee1450846826f8d0d8e593a99021be0a29b0c76f374181115c7ae931ba'),
(14, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.01}]', '0049ecee1450846826f8d0d8e593a99021be0a29b0c76f374181115c7ae931ba', 329, '00077b02f13d1228f32fbf8b5d31635bd6b116112345cba6a2208e2522682bfb'),
(15, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.03}]', '00077b02f13d1228f32fbf8b5d31635bd6b116112345cba6a2208e2522682bfb', 570, '00d78d17b1b6fe33d81925edf4de65069c299209cd6dd9a8cc515d422d1ebc94'),
(16, 4, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.07}]', '00d78d17b1b6fe33d81925edf4de65069c299209cd6dd9a8cc515d422d1ebc94', 150, '00db54d109e6ee90c7ec2a96a5904fb01f5d07993542d5621bd18cf3994f6ab5'),
(17, 5, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', '00db54d109e6ee90c7ec2a96a5904fb01f5d07993542d5621bd18cf3994f6ab5', 194, '004656e0e5eb03c2220a2f0d32d980e9f69e60163bdd62c56e35065c07a29970'),
(18, 6, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.01}]', '004656e0e5eb03c2220a2f0d32d980e9f69e60163bdd62c56e35065c07a29970', 255, '003db9231aecf9ff2c7de4b933f21298015972d9b6667c35e89d6af9ccf40d6d'),
(19, 7, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 1.0}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', '003db9231aecf9ff2c7de4b933f21298015972d9b6667c35e89d6af9ccf40d6d', 128, '005fd35ec18f0cb78bbebfefc8ab245dd48c28caa07548c2cf8e9c95f81bd516'),
(20, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.11}]', '202f03d12dba577bed2a46871e6cc445c214967b8ec7c1b2a1ea614cf2a61106', 2147483647, '4899229effcd198258712e6fe75a13ce31d19fdb91141db218637650d2318ca8'),
(25, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.05}]', '76054d40cb1ce4a294eb9a94a8e145ad33a2055399218d69b31e7f23983df34d', 2147483647, '2bc9d0c2adb742cbcc9edf005dc2b1ccc4de6c744d00fdbb82924b34b559802e'),
(30, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', 'd0397a5394c2c5afbb7cfe2fe59dcee35ec57766d57a52ad3cb8f7dce5c3c43d', 2147483647, '4a96065357d04c8131c527841ab25e13b6b16b555b100325b5e372b2ec0678aa'),
(39, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.1}]', '06943736798107269108a53202bf12e5ebca51ea54316a1dae9dc9c0b877081d', 2147483647, 'd11d0e036072bf8a01c29b0a9f11a67983a2b20cac898e0606a356b3a0ed7c36'),
(42, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.08}]', 'c3a772179ec5d977cbcbfa8680736e161e61b855fa76d2701cbec80106b26372', 2147483647, 'c5e86de6dca328f7fd2029f7393ae3db805d001116bf7a04e853a2673b14b34c'),
(44, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', '4b13d14469bfc8db4e1415f5290fdab3f6dbd3b6aeffbcb291d4c475b3aa7e01', 2147483647, '1186ccc7383dde7c0a310eb355484907c3b13172fd12baf3d077bd8172d6b751'),
(49, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.05}]', '78fbf5fd64fd25b46451b487932ef8ec33e0b87e3356f1848928d63ee3c0198a', 2147483647, 'e957e2e0e0291828d801ab2173fee0b134cc3a055d26e8514861f652b118b3a1'),
(54, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.01}]', '98e1be003a5017fb26d2632421c0c1f5cfc128ac70ed76868eb8b69106ff0531', 2147483647, 'd5dbc26e63fa221b40007aec5a52ca9f8e75d89e62117632fa5b724c35743655'),
(57, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', '14edeba4f67db96fd523cce69ce7ad3c1817c3c5293e4e67d151842613a04f0e', 2147483647, '7786ffe76aeaa7ee2addc7e316fdc19b07382ff267d4ce427bca973208a7f100'),
(60, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.12}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.1}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.08}]', '7786ffe76aeaa7ee2addc7e316fdc19b07382ff267d4ce427bca973208a7f100', 2147483647, '7c2453cef02490cfe55748332e3f6c4ae7876f7b08a018f98a2968b8196a943d'),
(61, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.08}]', '7c2453cef02490cfe55748332e3f6c4ae7876f7b08a018f98a2968b8196a943d', 2147483647, '04e8fc86936c38782cfed9c090c10879268a4ec85177d92ebd906f11dc748bdf'),
(66, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.06}]', 'c57a316469ec6d19b50386b20317e243edce15cc8c03726708b836543cd1049c', 2147483647, '78d46c53c54c6983758d25340411f2a2d76dd76b5758b40d9074f7eee0924664'),
(67, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.05}]', '78d46c53c54c6983758d25340411f2a2d76dd76b5758b40d9074f7eee0924664', 2147483647, '844bccb3f87743c2be000543150fb088b20db8b5e22d2842e8b1f0056b83babc'),
(68, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.02}]', '844bccb3f87743c2be000543150fb088b20db8b5e22d2842e8b1f0056b83babc', 2147483647, 'e41295a14217084124eeaf92db604b1d9e34b5a53839479a5ea7401dc808d349'),
(74, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.05}]', 'e754f835b1b688b830f0b3aae143aef54c9a67430175f3d5a1ce57113fbcdb60', 2147483647, '6c54d2d679ef6310f85bba7661c0deaf6b3c543e07ef3bf1ddcfd8fc0c6c7ccf'),
(75, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.11}]', '6c54d2d679ef6310f85bba7661c0deaf6b3c543e07ef3bf1ddcfd8fc0c6c7ccf', 2147483647, 'acc321acdb5ab6e4f1cd50dbe407a570962ace25adc7360088f29a66c2807fdc'),
(76, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.03}]', 'acc321acdb5ab6e4f1cd50dbe407a570962ace25adc7360088f29a66c2807fdc', 2147483647, '79bc29f16a135e5b8ec880da62ed82222885f7014125b91fa20c7c5016000010'),
(78, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.1}]', 'b97469f060b628186cfca99740c0fb4e93094e4b22cbd4d727f0c2f815605909', 2147483647, '9d469f8d989f5962cb6bedf6d4f316f3a46f87d5d8dcf16e73920f8a68611f54'),
(79, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.07}]', '9d469f8d989f5962cb6bedf6d4f316f3a46f87d5d8dcf16e73920f8a68611f54', 2147483647, '71e29405c6b903f6ec470e7f6f6007ae2239615ddb78a8dd494d394e51911ed7'),
(80, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.07}]', '71e29405c6b903f6ec470e7f6f6007ae2239615ddb78a8dd494d394e51911ed7', 2147483647, 'c114793ab3d916089e76337441dc356e4ba9114a155f74fabb4c559bcd535f28'),
(86, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.09}]', 'f2e7f91555b005f3525b6de0ca89a7b15e988d8a7c6ccd33fd2892e03a3e7909', 2147483647, 'c57ec0c96ee2a1fa3f690462aaf5d106265a8d57a4578f12723f84c41a63e523'),
(87, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', 'c57ec0c96ee2a1fa3f690462aaf5d106265a8d57a4578f12723f84c41a63e523', 2147483647, 'd9d92f4f71b6443fc7654a7cb0bfc57f02d3950fea6b3032961be027fc4dbca2'),
(88, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', 'd9d92f4f71b6443fc7654a7cb0bfc57f02d3950fea6b3032961be027fc4dbca2', 2147483647, '844c2945d7990b87fd68dbe03d9c7bd0c02626fa5c7b63d6be22949933e93a14'),
(102, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.1}]', '4482b20413f27ac248824066d7819c516b6b570845bcf650893683062d606b4f', 2147483647, '4dbc1da09a0750624901b28fb57dd7ea4088b09cc5b97c3af711d9e95512c5b9'),
(103, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.08}]', '4dbc1da09a0750624901b28fb57dd7ea4088b09cc5b97c3af711d9e95512c5b9', 2147483647, 'f762cc32fa33c430599df7c0b01584db0bb57c33981b62d06f10eb4f7b9b5d72'),
(104, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.09}]', 'f762cc32fa33c430599df7c0b01584db0bb57c33981b62d06f10eb4f7b9b5d72', 2147483647, '537a89e4aec8d19bd905c6d53c4a3fb6727b4f673694c13ed45a9c50f604ce80'),
(111, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.04}]', 'ea2f76c8a70e8049e71922171491594a61570a11e1d4369fb03781c9c9d51266', 2147483647, 'cc51568ae9e7579c42c27cd799b0289caa5cef5126a35f3fb93fd049fad57b6e'),
(112, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', 'cc51568ae9e7579c42c27cd799b0289caa5cef5126a35f3fb93fd049fad57b6e', 2147483647, '63bb480f17e3461c057b12b036597d9028118687b4b265082e4e8e80239ae55e'),
(113, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.1}]', '63bb480f17e3461c057b12b036597d9028118687b4b265082e4e8e80239ae55e', 2147483647, 'a5c708139c60893c08440b1f19bdf274031b4ee0f7831065829dc72957512593'),
(117, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.05}]', 'b2a7f393600eaf6d1245d798d1c3b70fa94b9780297a44e7230609e2dbb942b5', 2147483647, 'b3ff0746ade54e4688c88bd705576980f3b0998092a6fb61f09291e0a7499b67'),
(118, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.1}]', 'b3ff0746ade54e4688c88bd705576980f3b0998092a6fb61f09291e0a7499b67', 2147483647, '4978b8e197cb64778bc28126d465890837bf52160ce3db98aa810b80311318e1'),
(119, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', '4978b8e197cb64778bc28126d465890837bf52160ce3db98aa810b80311318e1', 2147483647, 'b87a4706bf9c88063226e865625cffb60496619d8fdfc100870ede63d90dbb87'),
(143, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', 'a2ec437f42560a57b7c0b2fff0772e69255d348ae939b723914a5702dbe62505', 2147483647, 'ca70ff3904f1863acfc361325da17500ccdd1696f44ca5b77c816754a79eb6e9'),
(144, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.07}]', 'ca70ff3904f1863acfc361325da17500ccdd1696f44ca5b77c816754a79eb6e9', 2147483647, 'fd75374ec7421e2c6c8b0cc4f9f9b9ff12899bcdf87ab5d4dd505dcbb444be97'),
(145, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', 'fd75374ec7421e2c6c8b0cc4f9f9b9ff12899bcdf87ab5d4dd505dcbb444be97', 2147483647, '772ff292c41795cc3b074058db3ad28dc7937adf69d79f549945a3cb8c569e47'),
(175, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.03}]', '79c30fdb1e3f69ac99ef7e1c622f234f757cccdaecc0b3df881df52b459775e6', 2147483647, '9eb69e8bf18a1fc0f5667947e2bb550b1c2b288291771d513408aa10551447e8'),
(193, 1, '0000-00-00 00:00:00', '[{\'sender\': \'rafi@gmail.com\', \'recipient\': \'0ddd503c-a8f5-4cdf-893e-1e4f5e74471d\', \'amount\': 0.93}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.1}]', '3ceb3e69e0b07929d8d9ce3146d4afb9b131d19caef2c37e2441e4c66699bced', 2147483647, '27112db77c12c4d275a1d6fb2c37708672933a90e629a8d1a2a3d23db6e3ad79'),
(194, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.06}]', '27112db77c12c4d275a1d6fb2c37708672933a90e629a8d1a2a3d23db6e3ad79', 2147483647, '6f830b2816999e407a8685da9888fbc340e6a1a1fc3bbeb0852bee59b9bf2442'),
(195, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.06}]', '6f830b2816999e407a8685da9888fbc340e6a1a1fc3bbeb0852bee59b9bf2442', 2147483647, '256949dcf8084c413af459ecc81aa3334093a5b09878a3291c62f207d0018ec1'),
(196, 4, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.05}]', '256949dcf8084c413af459ecc81aa3334093a5b09878a3291c62f207d0018ec1', 2147483647, '7d6a0834b9ec0d77222a69244f15e1c4d108702e5ef86e1b2b0d15a10fd0bc07'),
(215, 5, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.04}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.12}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.07}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.06}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.09}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.09}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.09}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.01}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.02}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.02}, {\'sender\': \'System\', \'recipient\': \'337aa385-1404-485e-bd30-37a9efb59a62\', \'amount\': 0.04}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.09}]', '7d6a0834b9ec0d77222a69244f15e1c4d108702e5ef86e1b2b0d15a10fd0bc07', 2147483647, '49f5f3658e2ab06056e13429fbf1166b5522397d445e0a347b862263abb04bd1'),
(232, 6, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.03}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.01}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.01}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.03}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.05}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.01}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.09}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.08}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.1}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.11}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.09}, {\'sender\': \'System\', \'recipient\': \'d2238d5b-457f-4f55-a119-f662918651c9\', \'amount\': 0.08}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.11}]', '49f5f3658e2ab06056e13429fbf1166b5522397d445e0a347b862263abb04bd1', 2147483647, '3954930c1dc0a069db902aa7271f3797bd9e91f4021410f1245c00b343b222d8'),
(238, 7, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.04}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.06}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.04}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.08}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.1}, {\'sender\': \'System\', \'recipient\': \'99068eca-4bfe-47df-a658-2f02a98a414b\', \'amount\': 0.09}]', '3954930c1dc0a069db902aa7271f3797bd9e91f4021410f1245c00b343b222d8', 2147483647, '0433048d6ad3280fb234e57cd80702f40ec0371505fe676659558c0bdfeb67dd'),
(244, 1, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.02}]', '7afde26eb4d0e6fab0fe82775ab5e8a897404ac5ef66be8cb096d607f8d0f399', 2147483647, '071a3879f20adc253cd0b4f92c062f38e13a6133062a0cc251b555cdac23a65e'),
(245, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.08}]', '071a3879f20adc253cd0b4f92c062f38e13a6133062a0cc251b555cdac23a65e', 2147483647, 'c4112b1cb77d591139148cd66d292d318e7f262d8565103ed5dd6c4cd7dde551'),
(246, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.07}]', 'c4112b1cb77d591139148cd66d292d318e7f262d8565103ed5dd6c4cd7dde551', 2147483647, '4d381d09faa811dd631b87dc9e2acc00e764da75d8905e10f09788675216d0a0'),
(247, 4, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.05}]', '4d381d09faa811dd631b87dc9e2acc00e764da75d8905e10f09788675216d0a0', 2147483647, '6c4a1ef0c1fe7d7677e4a7fb8ea564e755c87b7f6983a5f11eda5c1c9846d69c'),
(248, 5, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.06}]', '6c4a1ef0c1fe7d7677e4a7fb8ea564e755c87b7f6983a5f11eda5c1c9846d69c', 2147483647, '0753e75607fe2246639571739ca62806c92bc306175d8c8975f71ee0ae7f0fa5'),
(249, 6, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.12}]', '0753e75607fe2246639571739ca62806c92bc306175d8c8975f71ee0ae7f0fa5', 2147483647, '334b5e6835ba28ff1db48d1d86859b1d5106bbfb74cb108104a67e357aa4b99c'),
(250, 7, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'b30346e2-797d-4cb1-bf5e-c319ea20b408\', \'amount\': 0.02}]', '334b5e6835ba28ff1db48d1d86859b1d5106bbfb74cb108104a67e357aa4b99c', 2147483647, '5d31f7a2799cc29f4f7bcd662fb44f760feba82da7783d8707a17220a7412a64'),
(259, 1, '0000-00-00 00:00:00', '[{\'sender\': \'tanha@gmail.com\', \'recipient\': \'029a830d-2cde-43dc-867f-e737f07cac78\', \'amount\': 0.03}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.07}]', '074b3798e2aa7e0fce36441944b4c4977102bc62495e31001c0dba96de3f1f27', 2147483647, '09cf1ccda89e7b254aac46eb6b8de920c8ee9ebc2002ac418eb90619ad98f110'),
(260, 2, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.08}]', '09cf1ccda89e7b254aac46eb6b8de920c8ee9ebc2002ac418eb90619ad98f110', 2147483647, '14b4b0d4dbacc852fda2e5e4e444491b8021f231c20429f6decb4ff6a532fd03'),
(261, 3, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.12}]', '14b4b0d4dbacc852fda2e5e4e444491b8021f231c20429f6decb4ff6a532fd03', 2147483647, 'f8f8e4595de31271fdd6158b49b97d42664b705b5d1d03e9a8cd3aa3cbd576b9'),
(262, 4, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.02}]', 'f8f8e4595de31271fdd6158b49b97d42664b705b5d1d03e9a8cd3aa3cbd576b9', 2147483647, 'ad9585d80012bd4ec02ee220382d2a91e2a3c81049238e5d73813a031dc6ef5f'),
(263, 5, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.12}]', 'ad9585d80012bd4ec02ee220382d2a91e2a3c81049238e5d73813a031dc6ef5f', 2147483647, '45649f76bd99cab262cd50a83782b287d426a609e58b10fd2021624f19262561'),
(264, 6, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.01}]', '45649f76bd99cab262cd50a83782b287d426a609e58b10fd2021624f19262561', 2147483647, '2cc33c81be208b69c7c197e4962995150ff82351f3bd66cac2d9667bb04fbe72'),
(265, 7, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.09}]', '2cc33c81be208b69c7c197e4962995150ff82351f3bd66cac2d9667bb04fbe72', 2147483647, 'd4ff092bb55fe3465a0b891ea8e7a64a8c6fdd996d7bf692f40006ecfccf08ae'),
(266, 8, '0000-00-00 00:00:00', '[{\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 50}, {\'sender\': \'System\', \'recipient\': \'12a5bfbf-912e-4ef3-8c02-d95feec06214\', \'amount\': 0.06}]', 'd4ff092bb55fe3465a0b891ea8e7a64a8c6fdd996d7bf692f40006ecfccf08ae', 2147483647, 'c478ce870be818d77098ebcb849acd7d25f267458dc912a615b55af5263061c1');

-- --------------------------------------------------------

--
-- Table structure for table `help_queries`
--

CREATE TABLE `help_queries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `category` enum('technical','billing','general') NOT NULL,
  `message` text NOT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `status` enum('open','in-progress','resolved') DEFAULT 'open',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `help_queries`
--

INSERT INTO `help_queries` (`id`, `name`, `email`, `category`, `message`, `file_path`, `status`, `timestamp`) VALUES
(7, 'rafi', 'tahmidhasanrafi@gmail.com', 'general', 'please help me. ', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:24:15'),
(8, 'fds', 'af@gmail.com', 'technical', 'rewrffdfd', 'static/uploads/1677608259737.jpg', 'open', '2025-01-17 17:31:47'),
(9, 'fsdfsd', 'af@gmail.com', 'general', 'grggfdg', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:31:59'),
(10, 'fsf', 'af@gmail.com', 'general', 'asfsdfsd', 'static/uploads/school-supplies-accessories-blackboardback-school-background_670008-3531_1.jpg', 'open', '2025-01-17 17:32:08'),
(11, 'fsdf', 'af@gmail.com', 'billing', 'ferg', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:32:16'),
(12, 'fsdfsdf', 'fsdfaf@gmail.com', 'technical', 'fggfg', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:32:25'),
(13, 'gfdgdfgfd', 'gfdgfdgaf@gmail.com', 'billing', 'sgfdgfdg', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:32:36'),
(14, 'werf', 'af@gmail.com', 'billing', 'afsdff', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:33:26'),
(15, 'fsdfsdf', 'af@gmail.com', 'technical', 'sfsfv', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:33:35'),
(16, 'kfdskjf', 'hasdfhsd@gmail.com', 'billing', 'fshdf fhsdfsd fksdf fsdf f sdkf', 'static/uploads/1677608260800.jpg', 'open', '2025-01-17 17:41:12'),
(17, 'santo ', 'santo@gmail.com', 'general', 'please help me', 'static/uploads/meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg', 'open', '2025-01-17 17:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `receive_addresses`
--

CREATE TABLE `receive_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receive_addresses`
--

INSERT INTO `receive_addresses` (`id`, `user_id`, `address`, `used`) VALUES
(1, 1, '12a5bfbf-912e-4ef3-8c02-d95feec06214', 0),
(2, 1, 'a751866c-5807-4b1f-b0c3-b36f049e39c2', 0),
(3, 1, '029a830d-2cde-43dc-867f-e737f07cac78', 0),
(4, 1, '5548db28-c11b-4bcc-ab04-5e8070169a5b', 0),
(5, 1, '3204ed89-566e-4cd3-870a-acaeac559ee8', 0),
(6, 2, '0ddd503c-a8f5-4cdf-893e-1e4f5e74471d', 0),
(7, 2, '7318a6f4-464d-4733-a002-ef0eb0983dfe', 0),
(8, 2, '7d906473-5f4d-4ffe-9755-4fb68f196b8b', 0),
(9, 2, 'ce996869-9583-4ba1-861c-0124724ac8d3', 0),
(10, 2, '3cf8714f-2165-4361-8479-0654287037ca', 0),
(11, 3, 'be1702f5-1e95-4d69-b0ab-e997273afdb2', 0),
(12, 3, '146ee432-24d7-403d-87d4-87dbac05f811', 0),
(13, 3, '759dcd51-558e-4792-beb5-ddcfe79b10a0', 0),
(14, 3, '57e3a7c6-bb17-47a6-88cd-20a3b1100b79', 0),
(15, 3, '2dd37085-8d63-4679-9d81-4ccc5920fb10', 0),
(16, 4, '337aa385-1404-485e-bd30-37a9efb59a62', 0),
(17, 4, '61511bf4-6897-4c08-9c80-c358200ac7b1', 0),
(18, 4, '0b7d6a1d-43b6-4649-81bb-a48997eaa132', 0),
(19, 4, 'bb0e8c72-c9d2-4017-9fb0-841be1384037', 0),
(20, 4, '409496a5-d8ed-41e0-9bf5-b2c9b3be8c96', 0),
(21, 5, 'd2238d5b-457f-4f55-a119-f662918651c9', 0),
(22, 5, '3b5f2be3-61a3-420e-b990-e704efb14227', 0),
(23, 5, 'b7fb5217-647d-4547-bf15-20459659ae31', 0),
(24, 5, '1c194184-90ad-41f0-8b2c-2518d68cd0e0', 0),
(25, 5, '053d726b-f847-481e-ba46-809ad6fb7bbb', 0),
(26, 6, 'b30346e2-797d-4cb1-bf5e-c319ea20b408', 0),
(27, 6, '0da45473-2dcb-441f-ab5c-84fc477c802e', 0),
(28, 6, 'fe64e7ca-3d22-42bc-9ba4-34f9e45e7d61', 0),
(29, 6, '71696eff-f960-47a8-ba87-3bba7843e547', 0),
(30, 6, '010e5b8d-4892-4a9a-8a9f-ddaef95febff', 0),
(31, 7, '99068eca-4bfe-47df-a658-2f02a98a414b', 0),
(32, 7, '634def8f-b071-405d-a680-b9d43156f80f', 0),
(33, 7, 'e06550fc-24c4-4099-8a91-0c82dac7b659', 0),
(34, 7, 'd71717e6-ab7b-4324-bf9e-ea82c5bb6ff4', 0),
(35, 7, '4a77074c-88c9-4e8a-a26d-fd112b7d669d', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `sender_id`, `recipient_id`, `amount`, `timestamp`) VALUES
(15, 1, 2, 0.1, '2025-01-17 13:18:33'),
(16, 1, 2, 0.93, '2025-01-17 15:06:41'),
(17, 6, 1, 0.03, '2025-01-17 17:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `seed` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `seed`, `profile_picture`) VALUES
(1, 'Tahmid Hasan Rafi', 'rafi@gmail.com', '$2b$12$s1.CKEW4i00VFcUmZV7gy.30GqcY4FhKYE8RpXG0wTGVyTt/3eeH2', 'DKppuVI6xnT1yxwm', 'static/uploads/user_1_Picsart_24-08-16_12-42-48-050.jpg'),
(2, 'hasan', 'hasan@gmail.com', '$2b$12$nSW5I2sMn9JQ/nAjP6KEX.GSk09CEIPrMHqrj1ZzAtKSALdXV6eAW', '5A1K0AgVltji85I7', 'static/uploads/user_2_meticulous-photorealistic-still-life-rat-dressed-as-male-carrying-basket-fruit_899449-215667.jpg'),
(3, 'tahmid', 'tahmid@gmail.com', '$2b$12$6IcTmsY.nRe4fQSli98vTucWNZXV3laGd.aqnFusVGvLjbzAf4nza', 'FifPStTnx1IGh7yd', 'static/uploads/user_3_images_2.jpeg'),
(4, 'al amin', 'alaminratul0810@gmail.com', '$2b$12$YK6WMnHAbpiKkbFIg7VZ9OsYHvCSh3HhxD15ZGgxVf7nOTJSlmR0e', 'L0i0XLi8p1uyEsCh', 'static/uploads/user_4_PXL_20240719_094516111.jpg'),
(5, 'Alvi Hasan Emon', 'alvihasan179@gmail.com', '$2b$12$MMCslrNf62cChns7.i8vDu.Q2lN34rOqrRLaOBCMxtzda2XxXebdG', 'm9aFMRK25sTRqpp7', 'static/uploads/user_5_Screenshot_20240920-200723.png'),
(6, 'Tanha Zaman ', 'tanha@gmail.com', '$2b$12$lcwbbXVX9NBv1oGp8tMNneVUUp7UrAKJFwb9ip58XwTdglV5CDVxS', 'IP1L0bDzT4Neut5c', 'static/uploads/user_6_modern_tno_fanon__soviet_union_map_by_kouseifan_dfrvp28-fullview.jpg'),
(7, 'Abida Shrabonti ', 'abida@gmail.com', '$2b$12$GmszOINSCQvdh/TCP0XFZuCEZC/ilsa/2FyMrY/1zsRrYWL4PzQyy', '28Y8OViVNXmKcWxO', 'static/uploads/user_7_images.jpeg'),
(8, 'tahmid', 'tahmidhasanrafi@gmail.com', '$2b$12$SjfVjZfqZLzzRgHf3DjTzemZRR8ZJqQnS13olk1aHnUCksPon8fuO', 'JPv3N2cQbHdk5MNq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `user_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`user_id`, `balance`) VALUES
(1, 1.60),
(2, 1.50),
(3, 0.00),
(4, 0.27),
(5, 0.09),
(6, 0.50),
(7, 0.09),
(8, 0.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Indexes for table `help_queries`
--
ALTER TABLE `help_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_addresses`
--
ALTER TABLE `receive_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `help_queries`
--
ALTER TABLE `help_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `receive_addresses`
--
ALTER TABLE `receive_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `receive_addresses`
--
ALTER TABLE `receive_addresses`
  ADD CONSTRAINT `receive_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
