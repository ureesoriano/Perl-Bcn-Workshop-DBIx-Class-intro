-- --------------------------------------------------------
-- Host:                         172.28.128.3
-- Server version:               5.5.37-0ubuntu0.12.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-11-07 18:49:44
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for my_music
CREATE DATABASE IF NOT EXISTS `my_music` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `my_music`;


-- Dumping structure for table my_music.albums
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artist` mediumint(8) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artist` (`artist`),
  CONSTRAINT `FK_albums_artists` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table my_music.albums: ~0 rows (approximately)
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;


-- Dumping structure for table my_music.artists
CREATE TABLE IF NOT EXISTS `artists` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table my_music.artists: ~0 rows (approximately)
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;


-- Dumping structure for table my_music.festivals
CREATE TABLE IF NOT EXISTS `festivals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_year_location` (`name`,`year`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table my_music.festivals: ~0 rows (approximately)
/*!40000 ALTER TABLE `festivals` DISABLE KEYS */;
/*!40000 ALTER TABLE `festivals` ENABLE KEYS */;


-- Dumping structure for table my_music.festivals_artists
CREATE TABLE IF NOT EXISTS `festivals_artists` (
  `festival` int(10) unsigned NOT NULL,
  `artist` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`festival`,`artist`),
  KEY `FK_festivals_artists_artists` (`artist`),
  CONSTRAINT `FK_festivals_artists_artists` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`),
  CONSTRAINT `FK_festivals_artists_festivals` FOREIGN KEY (`festival`) REFERENCES `festivals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table my_music.festivals_artists: ~0 rows (approximately)
/*!40000 ALTER TABLE `festivals_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `festivals_artists` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
