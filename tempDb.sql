
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+05:30";


-- Spam fields = headers, to, from, subject, date, firstSeen, lastSeen, firstRelayed, lastRelayed, sourceIP, sensorID, text, html, inlineFileName, inlineFile, inlineFileMd5, attachmentFileName, attachmentFile, attachmentFileMd5, links, spam_id, spamMd5, len

-- ###### New Structure of Spam table

create table if not exists `spam` (
  `id` varchar(32) NOT NULL COMMENT 'MD5 of the spam',
  `ssdeep` varchar(120) COMMENT 'SSDeep hash of the mail',
  `to` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `textMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'body of spam in text format',
  `htmlMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'body of spam in html format',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `headers` text NOT NULL COMMENT 'Header of Spam',
  `sourceIP` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'IPs from where mail has been received',
  `sensorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Shiva sensor id',
  `firstSeen` datetime NOT NULL COMMENT 'First Occurance of Spam',
  `relayCounter` int(11) NOT NULL DEFAULT '0' COMMENT 'Mails Relayed in an hour',
  `relayTime` datetime NOT NULL COMMENT 'date of first relay',
  `totalCounter` int(11) NOT NULL COMMENT 'total count of spam till date',
  `length` int(11) NOT NULL COMMENT 'Length of the spam',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=33256;


-- ###### New Structure of Attachments table

create table if not exists `attachments` (
  `id` integer(255) NOT NULL AUTO_INCREMENT,
  `spam_id` varchar(32) NOT NULL COMMENT 'MD5 of spam from spam table, foreign key'  REFERENCES spam(id),
  `file_name` varchar(100) COMMENT 'Name of the attachment file',
  `attach_type` varchar(12) COMMENT 'Could be either inline/attachment',
  `attachmentFileMd5` varchar(32) COMMENT 'MD5 of the attachment',
  `date` date NOT NULL,
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ###### New Structure for Links table

create table if not exists `links` (
  `id` integer(255) NOT NULL AUTO_INCREMENT,
  `spam_id` varchar(32) NOT NULL COMMENT 'MD5 of spam from spam table, foreign key'  REFERENCES spam(id),
  `hyperlink` varchar(100) COMMENT 'Hyperlink from the spam',
  `date` date NOT NULL,
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ###### New Structure for Sensors table

create table if not exists `sensors` (
  `id` integer(255) NOT NULL AUTO_INCREMENT,
  `spam_id` varchar(32) NOT NULL COMMENT 'MD5 of spam from spam table, foreign key'  REFERENCES spam(id),
  `sensorID` varchar(100) COMMENT 'Sensor where spam was received',
  `date` date NOT NULL,
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ## Insert Query

/*

*/
