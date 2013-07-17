-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2013 at 05:06 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Shiva`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attachment_file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attachment_file` mediumblob NOT NULL,
  `attachment_file_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `spam_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spam_id` (`spam_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

-- --------------------------------------------------------

--
-- Table structure for table `inline`
--

CREATE TABLE IF NOT EXISTS `inline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `inline_file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `inline_file` mediumblob NOT NULL,
  `spam_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spam_id` (`spam_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `ip`
--

CREATE TABLE IF NOT EXISTS `ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sourceIP` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceIP` (`sourceIP`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2267362 ;

-- --------------------------------------------------------

--
-- Table structure for table `ip_spam`
--

CREATE TABLE IF NOT EXISTS `ip_spam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_id` int(11) NOT NULL,
  `spam_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_id` (`ip_id`),
  KEY `spam_id` (`spam_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2267362 ;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hyperLink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `spam_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spam_id` (`spam_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2083755 ;

-- --------------------------------------------------------

--
-- Table structure for table `relay`
--

CREATE TABLE IF NOT EXISTS `relay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `firstRelayed` datetime NOT NULL COMMENT 'date of first relay',
  `lastRelayed` datetime NOT NULL COMMENT 'date of last relay',
  `relayCounter` int(11) NOT NULL DEFAULT '0' COMMENT 'Mails Relayed Today',
  `totalRelayed` int(11) NOT NULL DEFAULT '0' COMMENT 'Total Mails Relayed Till Date',
  `spam_id` char(32) NOT NULL,
  `sensorID` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relayCounter` (`relayCounter`),
  KEY `spam_id` (`spam_id`),
  KEY `sensorID` (`sensorID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165881 ;

-- --------------------------------------------------------

--
-- Table structure for table `sdate`
--

CREATE TABLE IF NOT EXISTS `sdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `firstSeen` datetime NOT NULL COMMENT 'First Occurance of Spam',
  `lastSeen` datetime NOT NULL COMMENT 'Last Occurance of Spam',
  `todaysCounter` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `firstSeen` (`firstSeen`),
  KEY `lastSeen` (`lastSeen`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2187796 ;

-- --------------------------------------------------------

--
-- Table structure for table `sdate_spam`
--

CREATE TABLE IF NOT EXISTS `sdate_spam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spam_id` char(32) NOT NULL,
  `date_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spam_id` (`spam_id`),
  KEY `date_id` (`date_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2187796 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE IF NOT EXISTS `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sensorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Shiva sensor id',
  PRIMARY KEY (`id`),
  KEY `sensorID` (`sensorID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2166843 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_spam`
--

CREATE TABLE IF NOT EXISTS `sensor_spam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `spam_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  KEY `spam_id` (`spam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2166843 ;

-- --------------------------------------------------------

--
-- Table structure for table `spam`
--

CREATE TABLE IF NOT EXISTS `spam` (
  `from` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `textMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'body of spam in text format',
  `htmlMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'body of spam in html format',
  `totalCounter` int(11) NOT NULL COMMENT 'total count of spam till date',
  `id` char(32) NOT NULL COMMENT 'Md5 of combination of fields from + subject + date',
  `sphinxid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `totalCounter` (`totalCounter`),
  KEY `sphinxid` (`sphinxid`),
  FULLTEXT KEY `subject` (`subject`,`textMessage`,`htmlMessage`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2166842 ;

-- --------------------------------------------------------

--
-- Table structure for table `target_list`
--

CREATE TABLE IF NOT EXISTS `target_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
