-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2018 at 07:55 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menulicious`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl_groups`
--

CREATE TABLE `acl_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acl_menus`
--

CREATE TABLE `acl_menus` (
  `id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  `group` varchar(50) NOT NULL,
  `shorting` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent` enum('Y','N') NOT NULL,
  `child` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acl_routes`
--

CREATE TABLE `acl_routes` (
  `id` int(11) NOT NULL,
  `group` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acl_users`
--

CREATE TABLE `acl_users` (
  `id` int(11) NOT NULL,
  `idgroup` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nota code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_languages`
--

CREATE TABLE `lib_languages` (
  `id` int(11) NOT NULL,
  `indo_lan` varchar(100) NOT NULL,
  `eng_lan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `adminname` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `adminname`, `position`, `email`, `password`) VALUES
(1, 'admin', 'administrator', 'admin@menulicious.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_item`
--

CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `itemname` varchar(50) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `cost` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_item`
--

INSERT INTO `tb_item` (`id`, `date`, `itemname`, `photo`, `description`, `cost`) VALUES
(1, '2018-11-05', 'Roti Sobek', 'sobek.jpg', 'Roti Sobek adalah roti tawar yang dibuat dengan cita rasa khas sehingga cocok untuk dimakan apapun pendampingnya. bentuk yang menggelembung 6 buah cukup untuk mengenyangkan hanya dengan 1 buah bagiannya saja.', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE `tb_payment` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_request` int(11) NOT NULL,
  `cost` int(7) NOT NULL,
  `method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_request`
--

CREATE TABLE `tb_request` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `itemname` varchar(50) NOT NULL,
  `cost` int(7) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_request`
--

INSERT INTO `tb_request` (`id`, `date`, `id_user`, `id_item`, `username`, `itemname`, `cost`, `qty`, `status`) VALUES
(1, '2018-11-05', 1, 1, 'madani', 'Roti Sobek', 20000, 10, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `purchases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `email`, `password`, `purchases`) VALUES
(1, 'madani', 'madani@menulicious.com', 'madani', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_admin`
-- (See below for the actual view)
--
CREATE TABLE `v_admin` (
`id` int(11)
,`name` varchar(50)
,`email` varchar(50)
,`password` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_item`
-- (See below for the actual view)
--
CREATE TABLE `v_item` (
`id` int(11)
,`date` date
,`name` varchar(50)
,`photo` varchar(50)
,`description` text
,`cost` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_payment` (
`id` int(11)
,`date` date
,`id_request` int(11)
,`cost` int(7)
,`method` varchar(50)
,`status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_request`
-- (See below for the actual view)
--
CREATE TABLE `v_request` (
`id` int(11)
,`date` date
,`itemname` varchar(50)
,`username` varchar(50)
,`cost` int(7)
,`qty` int(11)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user`
-- (See below for the actual view)
--
CREATE TABLE `v_user` (
`id` int(11)
,`name` varchar(50)
,`email` varchar(50)
,`password` varchar(50)
,`purchases` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_admin`
--
DROP TABLE IF EXISTS `v_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_admin`  AS  select `tb_admin`.`id` AS `id`,`tb_admin`.`adminname` AS `name`,`tb_admin`.`email` AS `email`,`tb_admin`.`password` AS `password` from `tb_admin` ;

-- --------------------------------------------------------

--
-- Structure for view `v_item`
--
DROP TABLE IF EXISTS `v_item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_item`  AS  select `tb_item`.`id` AS `id`,`tb_item`.`date` AS `date`,`tb_item`.`itemname` AS `name`,`tb_item`.`photo` AS `photo`,`tb_item`.`description` AS `description`,`tb_item`.`cost` AS `cost` from `tb_item` ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment`
--
DROP TABLE IF EXISTS `v_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_payment`  AS  select `tb_payment`.`id` AS `id`,`tb_payment`.`date` AS `date`,`tb_request`.`id` AS `id_request`,`tb_request`.`cost` AS `cost`,`tb_payment`.`method` AS `method`,`tb_payment`.`status` AS `status` from (`tb_payment` join `tb_request` on((`tb_request`.`id` = `tb_payment`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_request`
--
DROP TABLE IF EXISTS `v_request`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_request`  AS  select `tb_request`.`id` AS `id`,`tb_request`.`date` AS `date`,`tb_item`.`itemname` AS `itemname`,`tb_user`.`username` AS `username`,`tb_request`.`cost` AS `cost`,`tb_request`.`qty` AS `qty`,`tb_request`.`status` AS `status` from ((`tb_request` join `tb_user` on((`tb_user`.`id` = `tb_request`.`id_user`))) join `tb_item` on((`tb_item`.`id` = `tb_request`.`id_item`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_user`
--
DROP TABLE IF EXISTS `v_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user`  AS  select `tb_user`.`id` AS `id`,`tb_user`.`username` AS `name`,`tb_user`.`email` AS `email`,`tb_user`.`password` AS `password`,`tb_user`.`purchases` AS `purchases` from `tb_user` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl_groups`
--
ALTER TABLE `acl_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acl_menus`
--
ALTER TABLE `acl_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acl_routes`
--
ALTER TABLE `acl_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acl_users`
--
ALTER TABLE `acl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_languages`
--
ALTER TABLE `lib_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_request`
--
ALTER TABLE `tb_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl_groups`
--
ALTER TABLE `acl_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_menus`
--
ALTER TABLE `acl_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_routes`
--
ALTER TABLE `acl_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_users`
--
ALTER TABLE `acl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_languages`
--
ALTER TABLE `lib_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_request`
--
ALTER TABLE `tb_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
