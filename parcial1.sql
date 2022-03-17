/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - parcial1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parcial1`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(11) NOT NULL,
  `journeyId` int(11) DEFAULT NULL,
  `degreeId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journeyId` (`journeyId`),
  KEY `degreeId` (`degreeId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `levelId` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  `abbreviation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelId`),
  CONSTRAINT `degrees_ibfk_1` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `abbreviation` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `abbreviation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`createdAt`,`updatedAt`,`name`,`abbreviation`) values (0,NULL,NULL,NULL,NULL),(16,'2021-11-19 19:42:18',NULL,'Matutina\r\n','Mat.\r\n');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  `abbreviation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academicPeriodGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
