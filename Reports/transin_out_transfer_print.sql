/*
SQLyog Enterprise - MySQL GUI v5.15 Beta 4
Host - 5.0.45-community-nt : Database - salesinventory
*********************************************************************
Server version : 5.0.45-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `salesinventory`;

USE `salesinventory`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `sr_transin_print` */

DROP TABLE IF EXISTS `sr_transin_print`;

CREATE TABLE `sr_transin_print` (
  `docnum` int(11) NOT NULL,
  `audituser` varchar(10) NOT NULL,
  PRIMARY KEY  (`docnum`,`audituser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sr_transin_print` */

insert into `sr_transin_print` (`docnum`,`audituser`) values (22,'007'),(25,'007');

/*Table structure for table `sr_transout_print` */

DROP TABLE IF EXISTS `sr_transout_print`;

CREATE TABLE `sr_transout_print` (
  `docnum` int(11) NOT NULL,
  `audituser` varchar(10) NOT NULL,
  PRIMARY KEY  (`docnum`,`audituser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sr_transout_print` */

insert into `sr_transout_print` (`docnum`,`audituser`) values (26,'007'),(27,'007'),(28,'007'),(29,'007');

/*Table structure for table `sr_transtransfer_print` */

DROP TABLE IF EXISTS `sr_transtransfer_print`;

CREATE TABLE `sr_transtransfer_print` (
  `docnum` int(11) NOT NULL,
  `audituser` varchar(10) NOT NULL,
  PRIMARY KEY  (`docnum`,`audituser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sr_transtransfer_print` */

insert into `sr_transtransfer_print` (`docnum`,`audituser`) values (16,'007');

SET SQL_MODE=@OLD_SQL_MODE;