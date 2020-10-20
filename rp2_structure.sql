-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: 5.blaauwgeers.se:3306
-- Gegenereerd op: 20 okt 2020 om 15:19
-- Serverversie: 8.0.21-0ubuntu0.20.04.4
-- PHP-versie: 7.4.3
-- Author: B.A. Blaauwgeers

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rp2`
--

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `check3`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `check3` (
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LabelLameMX`
--

CREATE TABLE `LabelLameMX` (
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `removed` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LabelLameNS`
--

CREATE TABLE `LabelLameNS` (
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `removed` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `LameMX`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `LameMX` (
);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `LameNS`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `LameNS` (
`COUNT(*)` bigint
,`label` text
,`NAMESERVER` longtext
,`soa` text
,`whois` text
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mxdata`
--

CREATE TABLE `mxdata` (
  `id` int UNSIGNED NOT NULL,
  `zonelink` int UNSIGNED NOT NULL,
  `rcode` int DEFAULT NULL,
  `PREFERENCE` int UNSIGNED DEFAULT NULL,
  `EXCHANGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mxdata_check`
--

CREATE TABLE `mxdata_check` (
  `id` int UNSIGNED NOT NULL,
  `mxdata` int UNSIGNED DEFAULT NULL,
  `zonelink` int UNSIGNED DEFAULT NULL,
  `ping` int UNSIGNED DEFAULT NULL,
  `pingdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `soa` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `whois` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `mxdata_check_progress`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `mxdata_check_progress` (
`0_first` bigint
,`0_s_t` decimal(27,4)
,`0_share` decimal(27,4)
,`0_total` bigint
,`0_updated` bigint
,`1_first` bigint
,`1_s_t` decimal(27,4)
,`1_total` bigint
,`1_updated` bigint
,`2_s_t` decimal(27,4)
,`4_first` bigint
,`4_s_t` decimal(27,4)
,`4_share` decimal(27,4)
,`4_total` bigint
,`4_updated` bigint
,`CHECKPOINT` decimal(27,4)
,`CURRENT_TIMESTAMP` datetime
,`N1_first` bigint
,`N1_share` decimal(27,4)
,`N1_total` bigint
,`N1_updated` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `mxdata_soacheck_progress`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `mxdata_soacheck_progress` (
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `nsadata`
--

CREATE TABLE `nsadata` (
  `id` int UNSIGNED NOT NULL,
  `zonelink` int UNSIGNED DEFAULT NULL,
  `rcode` int DEFAULT NULL,
  `label` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `nsdata_check`
--

CREATE TABLE `nsdata_check` (
  `id` int UNSIGNED NOT NULL,
  `nsdata` int UNSIGNED DEFAULT NULL COMMENT 'legacy use zoneline',
  `zonelink` int UNSIGNED DEFAULT NULL,
  `ping` int UNSIGNED DEFAULT NULL,
  `pingdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `soa` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `whois` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `public_suffix_list`
--

CREATE TABLE `public_suffix_list` (
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rcode`
--

CREATE TABLE `rcode` (
  `Value` int NOT NULL,
  `Mneumonic` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `results`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `results` (
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `se_zone`
--

CREATE TABLE `se_zone` (
  `id` int UNSIGNED NOT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ttl` int DEFAULT NULL,
  `class` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `soadata`
--

CREATE TABLE `soadata` (
  `id` int UNSIGNED NOT NULL,
  `zonelink` int UNSIGNED NOT NULL,
  `rcode` int DEFAULT NULL,
  `MNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERIAL` int UNSIGNED DEFAULT NULL,
  `REFRESH` int UNSIGNED DEFAULT NULL,
  `RETRY` int UNSIGNED DEFAULT NULL,
  `EXPIRE` int UNSIGNED DEFAULT NULL,
  `TTL` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `version`
--

CREATE TABLE `version` (
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `ztable_check_progress`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `ztable_check_progress` (
);

-- --------------------------------------------------------

--
-- Structuur voor de view `check3`
--
DROP TABLE IF EXISTS `check3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `check3`  AS  select now() AS `CURRENT_TIMESTAMP`,(select `mxdata3`.`zonelink` from `mxdata3` order by `mxdata3`.`zonelink` desc limit 1) AS `Zmxdata3`,(select `soadata2`.`zonelink` from `soadata2` order by `soadata2`.`zonelink` desc limit 1) AS `Zsoadata2`,(select `mxdata_check3`.`zonelink` from `mxdata_check3` order by `mxdata_check3`.`zonelink` desc limit 1) AS `Zmxdc3`,(select `nsdata_check`.`zonelink` from `nsdata_check` order by `nsdata_check`.`zonelink` desc limit 1) AS `Znsdc3`,(select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1) AS `Zse_zone`,((select `mxdata3`.`zonelink` from `mxdata3` order by `mxdata3`.`zonelink` desc limit 1) / (select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1)) AS `Pmxdata3`,((select `soadata2`.`zonelink` from `soadata2` order by `soadata2`.`zonelink` desc limit 1) / (select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1)) AS `Psoadata2`,((select `mxdata_check3`.`zonelink` from `mxdata_check3` order by `mxdata_check3`.`zonelink` desc limit 1) / (select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1)) AS `Pmxdc3`,((select `nsdata_check`.`zonelink` from `nsdata_check` order by `nsdata_check`.`zonelink` desc limit 1) / (select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1)) AS `Pnsdc3`,((select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1) / (select `se_zone`.`id` from `se_zone` order by `se_zone`.`id` desc limit 1)) AS `Pse_zone` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `LameMX`
--
DROP TABLE IF EXISTS `LameMX`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `LameMX`  AS  select `mxdata3`.`EXCHANGE` AS `EXCHANGE`,group_concat(distinct `mxdata_check3`.`soa` separator ',') AS `soa`,group_concat(distinct `mxdata_check3`.`whois` separator ',') AS `whois`,count(0) AS `COUNT(*)`,group_concat(distinct `se_zone`.`label` separator ',') AS `label` from (`se_zone` left join (`mxdata_check3` left join `mxdata3` on((`mxdata_check3`.`mxdata` = `mxdata3`.`id`))) on((`mxdata_check3`.`zonelink` = `se_zone`.`id`))) where `mxdata_check3`.`soa` in (select `public_suffix_list`.`prefix` from `public_suffix_list`) group by `mxdata3`.`EXCHANGE` order by count(`mxdata3`.`EXCHANGE`) desc ;

-- --------------------------------------------------------

--
-- Structuur voor de view `LameNS`
--
DROP TABLE IF EXISTS `LameNS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `LameNS`  AS  select `se_zone`.`data` AS `NAMESERVER`,group_concat(distinct `nsdata_check`.`soa` separator ',') AS `soa`,group_concat(distinct `nsdata_check`.`whois` separator ',') AS `whois`,count(0) AS `COUNT(*)`,group_concat(distinct `se_zone`.`label` separator ',') AS `label` from (`nsdata_check` left join `se_zone` on((`nsdata_check`.`zonelink` = `se_zone`.`id`))) where (`nsdata_check`.`soa` in (select `public_suffix_list`.`prefix` from `public_suffix_list`) and (`se_zone`.`rtype` = 'NS')) group by `se_zone`.`data` order by count(`se_zone`.`data`) desc ;

-- --------------------------------------------------------

--
-- Structuur voor de view `mxdata_check_progress`
--
DROP TABLE IF EXISTS `mxdata_check_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `mxdata_check_progress`  AS  select now() AS `CURRENT_TIMESTAMP`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 0) and (`mxdata_check`.`soa` is not null))) AS `0_first`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 0) and (`mxdata_check`.`soa` is null))) AS `0_updated`,(select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 0)) AS `0_total`,(((select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 0) and (`mxdata_check`.`soa` is not null))) / (select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 0))) * 100) AS `0_share`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` <> 1) and (`mxdata_check`.`soa` is not null))) AS `N1_first`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` <> 1) and (`mxdata_check`.`soa` is null))) AS `N1_updated`,(select count(0) from `mxdata_check` where (`mxdata_check`.`ping` <> 1)) AS `N1_total`,(((select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` <> 1) and (`mxdata_check`.`soa` is not null))) / (select count(0) from `mxdata_check` where (`mxdata_check`.`ping` <> 1))) * 100) AS `N1_share`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 1) and (`mxdata_check`.`soa` is not null))) AS `1_first`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 1) and (`mxdata_check`.`soa` is null))) AS `1_updated`,(select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 1)) AS `1_total`,(((select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 0)) / (select count(0) from `mxdata_check`)) * 100) AS `0_s_t`,(((select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 1)) / (select count(0) from `mxdata_check`)) * 100) AS `1_s_t`,(((select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 2)) / (select count(0) from `mxdata_check`)) * 100) AS `2_s_t`,(((select count(0) from `mxdata_check`) / (select count(0) from `mxdata`)) * 100) AS `CHECKPOINT`,(((select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 4)) / (select count(0) from `mxdata_check`)) * 100) AS `4_s_t`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 4) and (`mxdata_check`.`soa` is not null))) AS `4_first`,(select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 4) and (`mxdata_check`.`soa` is null))) AS `4_updated`,(select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 4)) AS `4_total`,(((select count(0) from `mxdata_check` where ((`mxdata_check`.`ping` = 4) and (`mxdata_check`.`soa` is not null))) / (select count(0) from `mxdata_check` where (`mxdata_check`.`ping` = 4))) * 100) AS `4_share` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `mxdata_soacheck_progress`
--
DROP TABLE IF EXISTS `mxdata_soacheck_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `mxdata_soacheck_progress`  AS  select now() AS `CURRENT_TIMESTAMP`,(select count(0) from `mxdata_check2`) AS `mxdata_check2`,(select count(0) from `mxdata`) AS `mxdata`,(select (((select count(0) from `mxdata_check2`) / (select count(0) from `mxdata`)) * 100)) AS `share` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `results`
--
DROP TABLE IF EXISTS `results`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `results`  AS  select (select count(0) from `se_zone`) AS `m1`,(select count(0) from `se_zone` where (`se_zone`.`rtype` = 'NS')) AS `m2`,(select count(distinct `se_zone`.`label`) from `se_zone` where (`se_zone`.`rtype` like 'NS')) AS `m3`,'1530949' AS `m4`,('C3' / 'C4') AS `m5`,('C5' - 'C4') AS `m6`,(select count(distinct `se_zone`.`data`) from `se_zone` where (`se_zone`.`rtype` like 'NS')) AS `m7`,(select count(0) from `soadata2` where (`soadata2`.`rcode` = 0)) AS `m8`,(select count(0) from `mxdata3` where (`mxdata3`.`rcode` = 0)) AS `m9`,(select count(distinct `mxdata3`.`EXCHANGE`) from `mxdata3` where (`mxdata3`.`rcode` = 0)) AS `m10`,(select count(0) from `soadata2` where (`soadata2`.`rcode` <> 0)) AS `m11`,(select count(0) from `mxdata3` where (`mxdata3`.`rcode` <> 0)) AS `m12`,(select count(distinct `LameNS`.`label`) from `LameNS`) AS `m13`,(select count(distinct `LameMX`.`label`) from `LameMX`) AS `m14` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `ztable_check_progress`
--
DROP TABLE IF EXISTS `ztable_check_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ablaauwgeers`@`%` SQL SECURITY DEFINER VIEW `ztable_check_progress`  AS  select now() AS `CURRENT_TIMESTAMP`,(select count(0) from `mxdata`) AS `mxdata`,(select count(0) from `mxdata_check`) AS `mxdata_check`,(select count(0) from `mxdata_check2`) AS `mxdata_check2`,(select count(0) from `nsadata`) AS `nsadata`,(select count(0) from `nsadataw`) AS `nsadataw`,(select count(0) from `rcode`) AS `rcode`,(select count(0) from `se_zone`) AS `se_zone`,(select count(0) from `se_zone_20200814`) AS `se_zone_20200814`,(select count(0) from `soadata`) AS `soadata`,(select count(0) from `soadata2`) AS `soadata2`,(select count(0) from `version`) AS `version` ;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `LabelLameMX`
--
ALTER TABLE `LabelLameMX`
  ADD PRIMARY KEY (`label`);

--
-- Indexen voor tabel `LabelLameNS`
--
ALTER TABLE `LabelLameNS`
  ADD PRIMARY KEY (`label`);

--
-- Indexen voor tabel `mxdata`
--
ALTER TABLE `mxdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zonelink` (`zonelink`),
  ADD KEY `rcode` (`rcode`);

--
-- Indexen voor tabel `mxdata_check`
--
ALTER TABLE `mxdata_check`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mxdata_2` (`mxdata`),
  ADD KEY `mxdata` (`mxdata`),
  ADD KEY `zonelink` (`zonelink`);

--
-- Indexen voor tabel `nsadata`
--
ALTER TABLE `nsadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zonelink` (`zonelink`),
  ADD KEY `rcode` (`rcode`);

--
-- Indexen voor tabel `nsdata_check`
--
ALTER TABLE `nsdata_check`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mxdata_2` (`nsdata`),
  ADD KEY `mxdata` (`nsdata`),
  ADD KEY `zonelink` (`zonelink`);

--
-- Indexen voor tabel `public_suffix_list`
--
ALTER TABLE `public_suffix_list`
  ADD PRIMARY KEY (`prefix`);

--
-- Indexen voor tabel `rcode`
--
ALTER TABLE `rcode`
  ADD PRIMARY KEY (`Value`),
  ADD KEY `Mneumonic` (`Mneumonic`);

--
-- Indexen voor tabel `se_zone`
--
ALTER TABLE `se_zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label` (`label`);

--
-- Indexen voor tabel `soadata`
--
ALTER TABLE `soadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zonelink` (`zonelink`),
  ADD KEY `rcode` (`rcode`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `mxdata`
--
ALTER TABLE `mxdata`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `mxdata_check`
--
ALTER TABLE `mxdata_check`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `nsadata`
--
ALTER TABLE `nsadata`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `nsdata_check`
--
ALTER TABLE `nsdata_check`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `se_zone`
--
ALTER TABLE `se_zone`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `soadata`
--
ALTER TABLE `soadata`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `mxdata`
--
ALTER TABLE `mxdata`
  ADD CONSTRAINT `mxdata_link` FOREIGN KEY (`rcode`) REFERENCES `rcode` (`Value`),
  ADD CONSTRAINT `mxdata_zonelink` FOREIGN KEY (`zonelink`) REFERENCES `se_zone` (`id`);

--
-- Beperkingen voor tabel `mxdata_check`
--
ALTER TABLE `mxdata_check`
  ADD CONSTRAINT `mxdata_check_datalink` FOREIGN KEY (`mxdata`) REFERENCES `mxdata` (`id`),
  ADD CONSTRAINT `mxdata_check_zonelink` FOREIGN KEY (`zonelink`) REFERENCES `mxdata` (`zonelink`);

--
-- Beperkingen voor tabel `nsadata`
--
ALTER TABLE `nsadata`
  ADD CONSTRAINT `rcodeNSA` FOREIGN KEY (`rcode`) REFERENCES `rcode` (`Value`),
  ADD CONSTRAINT `zonelinkNSA` FOREIGN KEY (`zonelink`) REFERENCES `se_zone` (`id`);

--
-- Beperkingen voor tabel `soadata`
--
ALTER TABLE `soadata`
  ADD CONSTRAINT `soadata_rcode` FOREIGN KEY (`rcode`) REFERENCES `rcode` (`Value`),
  ADD CONSTRAINT `soadata_zonelink` FOREIGN KEY (`zonelink`) REFERENCES `se_zone` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
