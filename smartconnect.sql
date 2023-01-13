-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 13, 2023 at 06:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `actor` varchar(255) NOT NULL,
  `value1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `value2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `value3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`actor`, `value1`, `value2`, `value3`) VALUES
('kME8LVGdYnsatQV9qaUx5aWpq5s7xwWKHujxSqLCfrfpJ4KEBVRn3pCnZHmTpEKx', '\n{\"cases\": [{\"value\": 1, \"sensors\":[{\"key\": \"UEmERdJGcVkgdn8s2mwXvWYyb2GzxM2vtFuR9vRKG2rV6wqW4nqnF7aSQAay4Exn\", \"value\": 1, \"min\": -1, \"max\": 600}]}]}', '{\"cases\": [{\"value\": 1, \"sensors\":[{\"key\": \"UEmERdJGcVkgdn8s2mwXvWYyb2GzxM2vtFuR9vRKG2rV6wqW4nqnF7aSQAay4Exn\", \"value\": 1, \"min\": -1, \"max\": 300}]}]}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `userid` varchar(255) NOT NULL,
  `deviceid` varchar(255) NOT NULL,
  `devicetype` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT 'My Device'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`userid`, `deviceid`, `devicetype`, `name`) VALUES
('01', 'kME8LVGdYnsatQV9qaUx5aWpq5s7xwWKHujxSqLCfrfpJ4KEBVRn3pCnZHmTpEKx', 2, 'My Device'),
('01', 'UEmERdJGcVkgdn8s2mwXvWYyb2GzxM2vtFuR9vRKG2rV6wqW4nqnF7aSQAay4Exn', 1, 'My Device');

-- --------------------------------------------------------

--
-- Table structure for table `devicetypes`
--

CREATE TABLE `devicetypes` (
  `deviceType` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `imageurl` varchar(1024) NOT NULL,
  `actiontype` varchar(50) NOT NULL COMMENT 'RX / TX',
  `specific` varchar(255) NOT NULL,
  `icon` varchar(4098) NOT NULL DEFAULT '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M272 384c9.6-31.9 29.5-59.1 49.2-86.2l0 0c5.2-7.1 10.4-14.2 15.4-21.4c19.8-28.5 31.4-63 31.4-100.3C368 78.8 289.2 0 192 0S16 78.8 16 176c0 37.3 11.6 71.9 31.4 100.3c5 7.2 10.2 14.3 15.4 21.4l0 0c19.8 27.1 39.7 54.4 49.2 86.2H272zM192 512c44.2 0 80-35.8 80-80V416H112v16c0 44.2 35.8 80 80 80zM112 176c0 8.8-7.2 16-16 16s-16-7.2-16-16c0-61.9 50.1-112 112-112c8.8 0 16 7.2 16 16s-7.2 16-16 16c-44.2 0-80 35.8-80 80z"/></svg>'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devicetypes`
--

INSERT INTO `devicetypes` (`deviceType`, `name`, `description`, `imageurl`, `actiontype`, `specific`, `icon`) VALUES
(1, 'photoresistor', 'The Light Intensity Sensor is the perfect tool to measure the intensity of light and automatically controll your lights.', 'https://arduinomodules.info/wp-content/uploads/Arduino_KY-018_Keyes_photoresistor_module_connection_diagram-1024x552.png', 'TX', 'sensor:brightness', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d=\"M0 96C0 60.7 28.7 32 64 32H448c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM48 368v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V368c0-8.8-7.2-16-16-16H416zM48 240v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm368-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V240c0-8.8-7.2-16-16-16H416zM48 112v32c0 8.8 7.2 16 16 16H96c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zM416 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H416zM160 128v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V128c0-17.7-14.3-32-32-32H192c-17.7 0-32 14.3-32 32zm32 160c-17.7 0-32 14.3-32 32v64c0 17.7 14.3 32 32 32H320c17.7 0 32-14.3 32-32V320c0-17.7-14.3-32-32-32H192z\"/></svg>'),
(2, '2led', 'This is just a demo. Later this will be replaced by the controller for WS2812b led stripes', 'https://www.zedfy.shop/media/image/product/9/lg/sp105e-ws2812b-ws2811-sk6812-apa102c-bluetooth-led-steuerung-strip-ios-android-app.jpg', 'RX', 'actor:2led', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 384 512\"><!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d=\"M272 384c9.6-31.9 29.5-59.1 49.2-86.2l0 0c5.2-7.1 10.4-14.2 15.4-21.4c19.8-28.5 31.4-63 31.4-100.3C368 78.8 289.2 0 192 0S16 78.8 16 176c0 37.3 11.6 71.9 31.4 100.3c5 7.2 10.2 14.3 15.4 21.4l0 0c19.8 27.1 39.7 54.4 49.2 86.2H272zM192 512c44.2 0 80-35.8 80-80V416H112v16c0 44.2 35.8 80 80 80zM112 176c0 8.8-7.2 16-16 16s-16-7.2-16-16c0-61.9 50.1-112 112-112c8.8 0 16 7.2 16 16s-7.2 16-16 16c-44.2 0-80 35.8-80 80z\"/></svg>');

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `deviceKey` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sensordata`
--

INSERT INTO `sensordata` (`deviceKey`, `type`, `value1`, `value2`) VALUES
('UEmERdJGcVkgdn8s2mwXvWYyb2GzxM2vtFuR9vRKG2rV6wqW4nqnF7aSQAay4Exn', 'sensor:brightness', '55', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD UNIQUE KEY `actor` (`actor`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`deviceid`),
  ADD KEY `devicetype` (`devicetype`);

--
-- Indexes for table `devicetypes`
--
ALTER TABLE `devicetypes`
  ADD PRIMARY KEY (`deviceType`),
  ADD UNIQUE KEY `specific` (`specific`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD UNIQUE KEY `deviceKey_2` (`deviceKey`),
  ADD KEY `deviceKey` (`deviceKey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devicetypes`
--
ALTER TABLE `devicetypes`
  MODIFY `deviceType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `connections`
--
ALTER TABLE `connections`
  ADD CONSTRAINT `actor` FOREIGN KEY (`actor`) REFERENCES `devices` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`devicetype`) REFERENCES `devicetypes` (`deviceType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD CONSTRAINT `deviceKey` FOREIGN KEY (`deviceKey`) REFERENCES `devices` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
