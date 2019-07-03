# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: laravel_agrmnt
# Generation Time: 2019-07-03 09:00:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table agreements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agreements`;

CREATE TABLE `agreements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `agreements` WRITE;
/*!40000 ALTER TABLE `agreements` DISABLE KEYS */;

INSERT INTO `agreements` (`id`, `title`, `created_at`, `updated_at`, `content`)
VALUES
	(1,'first title','2019-07-02 12:47:58','2019-07-02 12:47:58','Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n      '),
	(2,'test','2019-07-02 12:52:21','2019-07-02 12:52:21','Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n      '),
	(3,'abcd','2019-07-02 13:08:34','2019-07-02 13:08:34','Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n      '),
	(4,'qq','2019-07-02 13:08:55','2019-07-02 13:08:55','ccc'),
	(5,'ddd','2019-07-02 13:10:01','2019-07-02 13:10:01','vvvv'),
	(11,'ok123','2019-07-02 18:23:51','2019-07-02 18:24:04','desc 123');

/*!40000 ALTER TABLE `agreements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table userAgreements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userAgreements`;

CREATE TABLE `userAgreements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agreements` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `userAgreements` WRITE;
/*!40000 ALTER TABLE `userAgreements` DISABLE KEYS */;

INSERT INTO `userAgreements` (`id`, `agreements`, `userId`, `created_at`, `updated_at`)
VALUES
	(1,'9','2',NULL,NULL),
	(3,'8','2','2018-12-13 19:56:20','2018-12-13 19:56:20'),
	(4,'12','2','2018-12-13 21:30:45','2018-12-13 21:30:45'),
	(5,'12','2','2018-12-13 22:33:53','2018-12-13 22:33:53'),
	(6,'1,2,3','3','2019-07-02 15:57:16','2019-07-02 15:57:16'),
	(7,'11,5,4,3,2,1','13','2019-07-03 03:39:02','2019-07-03 03:39:02'),
	(8,'','14','2019-07-03 03:40:38','2019-07-03 03:40:38');

/*!40000 ALTER TABLE `userAgreements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAdmin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`)
VALUES
	(1,'Bismillah','admin@admin.com','$2y$10$zj.Q7bmq3YycNw6jhb7b4ObLjJsvvdG/qppAMI0cS/BLHw/qC9HOe','CTJn1Ybkx3hwXXxKfl4fRuwaehRkYF8fXOJIpfnGGkgEapNAH1Q8s0rz6ZYU','2018-12-11 20:47:29','2018-12-11 20:47:29',1),
	(2,'Bilal','bilal@bilal.com','$2y$10$wTtKDqWu3n7nhiJwBV5D.OcXAArG/DM4CzVnDuX.u3l4WoqzpuCXq','5tSCCLbFgN0vl8VIVQyGmwEv2lQPiTPkbdX2cr1pcsk4E1dL75fAacOMdkX2','2018-12-12 08:13:52','2018-12-12 08:13:52',0),
	(3,'abc','abc@abc.com','$2y$10$zj.Q7bmq3YycNw6jhb7b4ObLjJsvvdG/qppAMI0cS/BLHw/qC9HOe','JQDeFSuJN0aHNnvjsSa3wI4Z2r4lHYh9ZtnDFgGHhqaokfPjcMCwa80OFXoC','2019-07-01 15:32:04','2019-07-01 15:32:04',0),
	(4,'test111','ab1@abc.com','$2y$10$B3VI3ZGfCI6InqIJgldwJ.3Cq8rX/QWSZwxu4GfJuFSTGDkQQqM6S',NULL,'2019-07-02 21:57:49','2019-07-02 21:57:49',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
