/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - gangsar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gangsar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `gangsar`;

/*Table structure for table `sma_addresses` */

DROP TABLE IF EXISTS `sma_addresses`;

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_addresses` */

/*Table structure for table `sma_adjustment_items` */

DROP TABLE IF EXISTS `sma_adjustment_items`;

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_adjustment_items` */

/*Table structure for table `sma_adjustments` */

DROP TABLE IF EXISTS `sma_adjustments`;

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_adjustments` */

/*Table structure for table `sma_api_keys` */

DROP TABLE IF EXISTS `sma_api_keys`;

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_api_keys` */

/*Table structure for table `sma_api_limits` */

DROP TABLE IF EXISTS `sma_api_limits`;

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_api_limits` */

/*Table structure for table `sma_api_logs` */

DROP TABLE IF EXISTS `sma_api_logs`;

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_api_logs` */

/*Table structure for table `sma_attachments` */

DROP TABLE IF EXISTS `sma_attachments`;

CREATE TABLE `sma_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_attachments` */

/*Table structure for table `sma_brands` */

DROP TABLE IF EXISTS `sma_brands`;

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_brands` */

/*Table structure for table `sma_business_location` */

DROP TABLE IF EXISTS `sma_business_location`;

CREATE TABLE `sma_business_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_business_location` */

insert  into `sma_business_location`(`id`,`code`,`name`,`address`,`map`,`phone`,`email`,`price_group_id`) values 
(1,'GJ','Gangsar Jaya','<p>Alamat GJ</p>',NULL,'12345','gj@gmail.com',NULL),
(2,'GMJ','Gangsar Makmur Jaya','<p>Alamat GMJ</p>',NULL,'12345','gmj@gmail.com',NULL),
(3,'GM','Gangsar Makmur','<p>Alamat GM</p>',NULL,'12345','gm@gmail.com',NULL);

/*Table structure for table `sma_business_location_products` */

DROP TABLE IF EXISTS `sma_business_location_products`;

CREATE TABLE `sma_business_location_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `business_location_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`business_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_business_location_products` */

/*Table structure for table `sma_calendar` */

DROP TABLE IF EXISTS `sma_calendar`;

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_calendar` */

insert  into `sma_calendar`(`id`,`title`,`description`,`start`,`end`,`color`,`user_id`) values 
(1,'Supply','Supply','2024-05-01 00:00:00','2024-05-02 00:00:00','#3a87ad',2);

/*Table structure for table `sma_captcha` */

DROP TABLE IF EXISTS `sma_captcha`;

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_captcha` */

/*Table structure for table `sma_cart` */

DROP TABLE IF EXISTS `sma_cart`;

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_cart` */

/*Table structure for table `sma_categories` */

DROP TABLE IF EXISTS `sma_categories`;

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_categories` */

insert  into `sma_categories`(`id`,`code`,`name`,`image`,`parent_id`,`slug`,`description`) values 
(1,'C1','ACCESSORIES','',0,'',''),
(2,'C2','REELS','',NULL,'',''),
(3,'C3','ROD 2 SECTION','',NULL,'',''),
(4,'C4','ROD ANTENE','',NULL,'',''),
(5,'SC13','ROD 2 SECTION CARBON','',3,'',''),
(6,'SC14','ROD 2 SECTION FIBER','',3,'',''),
(7,'SC15','ROD ANTENE CARBON','',4,'',''),
(8,'SC16','ROD ANTENE FIBER','',4,'',''),
(9,'SC17','SAMBUNGAN','',4,'',''),
(10,'SC18','SENAR','',4,'',''),
(11,'SC19','SNAP','',4,'',''),
(12,'SC20','SOLID CARBON','',4,'',''),
(13,'SC1','BLOMBONGAN',NULL,1,'blombongan','BLOMBONGAN'),
(14,'SC2','EVA',NULL,1,'eva','EVA'),
(15,'SC3','GOLF STICK',NULL,1,'golf-stick','GOLF STICK'),
(16,'SC4','GUIDE RING',NULL,1,'guide-ring','GUIDE RING'),
(17,'SC5','KATEG',NULL,1,'kateg','KATEG'),
(18,'SC6','KELINTINGAN',NULL,1,'kelintingan','KELINTINGAN'),
(19,'SC7','LIGHT STICK',NULL,1,'light-stick','MATA KAIL'),
(20,'SC10','POLE KLIP',NULL,1,'pole-klip','POLE KLIP'),
(21,'SC11','REEL HANDLE',NULL,1,'reel-handle','REEL HANDLE'),
(22,'SC12','REEL SEAT',NULL,1,'reel-seat','REEL SEAT');

/*Table structure for table `sma_combo_items` */

DROP TABLE IF EXISTS `sma_combo_items`;

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_combo_items` */

/*Table structure for table `sma_companies` */

DROP TABLE IF EXISTS `sma_companies`;

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_companies` */

insert  into `sma_companies`(`id`,`group_id`,`group_name`,`customer_group_id`,`customer_group_name`,`name`,`company`,`vat_no`,`address`,`city`,`state`,`postal_code`,`country`,`phone`,`email`,`cf1`,`cf2`,`cf3`,`cf4`,`cf5`,`cf6`,`invoice_footer`,`payment_term`,`logo`,`award_points`,`deposit_amount`,`price_group_id`,`price_group_name`,`gst_no`) values 
(1,3,'customer',1,'General','Walk-in Customer','Walk-in Customer','','Customer Address','Petaling Jaya','Selangor','46000','Malaysia','0123456789','customer@tecdiary.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,NULL),
(2,4,'supplier',NULL,NULL,'Test Supplier','Supplier Company Name',NULL,'Supplier Address','Petaling Jaya','Selangor','46050','Malaysia','0123456789','supplier@tecdiary.com','-','-','-','-','-','-',NULL,0,'logo.png',0,NULL,NULL,NULL,NULL),
(3,NULL,'biller',NULL,NULL,'Mian Saleem','Test Biller','5555','Biller adddress','City','','','Country','012345678','saleem@tecdiary.com','','','','','','',' Thank you for shopping with us. Please come again',0,'logo1.png',0,NULL,NULL,NULL,NULL),
(4,NULL,'biller',NULL,NULL,'Lilis','Gangsar Jaya','','alamat lilis','Batu','JAWA TIMUR','','Indonesia','12345','lilis@gmail.com','','','','','','','Invoice Lilis',0,'header_logo.png',0,NULL,NULL,NULL,''),
(5,4,'supplier',NULL,NULL,'China','China','','China','China','China','65146','China','12345','china@mail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(6,3,'customer',1,'General','Istana Pancing Denpasar','Istana Pancing Denpasar','','Taman Desa','Denpasar','Bali','','Indonesia','0823-3095-6888','istana_pancing_denpasar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(7,3,'customer',1,'General','Wijaya Srinit','Wijaya Srinit','','','Denpasar','Bali','','Indonesia','087812300098','wijaya_srinit@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(8,3,'customer',1,'General','Bali Fishing','Bali Fishing','','','Gianyar','Bali','','Indonesia','0813-3791-2496','bali_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(9,3,'customer',1,'General','Berkat Pancing','Berkat Pancing','','','Jembrana','Bali','','Indonesia','0877-5415-6174','berkat_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(10,3,'customer',1,'General','Halim','Halim','','','Jembrana','Bali','','Indonesia','0852-0511-0682','halim@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(11,3,'customer',1,'General','BATAL','BATAL','','','BATAL','BATAL','','Indonesia','087812300098','batal@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(12,3,'customer',1,'General','Iqfa','Iqfa','','','Jakarta Barat','DKI Jakarta','','Indonesia','081317917992','iqfa@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(13,3,'customer',1,'General','Lautan Luas Tuban','Lautan Luas Tuban','','','Tuban','Jawa Timur','','Indonesia','0852-5622-7307','lautan_luas_tuban@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(14,3,'customer',1,'General','Sumber Pancing (P. Hj Iwan)','Sumber Pancing (P. Hj Iwan)','','','Banjar','Jawa Barat','','Indonesia','0821-2995-9697','sumber_pancing_(p._hj_iwan)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(15,3,'customer',1,'General','Teras Pancing Banjar','Teras Pancing Banjar','','','Banjar','Jawa Barat','','Indonesia','0812-2249-7879','teras_pancing_banjar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(16,3,'customer',1,'General','Atlantic Fishing','Atlantic Fishing','','','Bekasi','Jawa Barat','','Indonesia','0819-4600-4014','atlantic_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(17,3,'customer',1,'General','DM Bogor','DM Bogor','','','Bogor','Jawa Barat','','Indonesia','0878-7854-0222','dm_bogor@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(18,3,'customer',1,'General','Fachril','Fachril','','','Ciamis','Jawa Barat','','Indonesia','0822-9742-6677','fachril@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(19,3,'customer',1,'General','Istiqomah','Istiqomah','','','Ciamis','Jawa Barat','','Indonesia','0813-1532-6953','istiqomah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(20,3,'customer',1,'General','Pak Sofyan','Pak Sofyan','','','Cimahi','Jawa Barat','','Indonesia','0821-1988-6641','pak_sofyan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(21,3,'customer',1,'General','Putri Jaya Abadi','Putri Jaya Abadi','','','Jatibarang','Jawa Barat','','Indonesia','0819-0140-8976','putri_jaya_abadi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(22,3,'customer',1,'General','Geger Pancing','Geger Pancing','','','Karawang','Jawa Barat','','Indonesia','0813-8424-4981','geger_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(23,3,'customer',1,'General','Deden','Deden','','','Sukabumi','Jawa Barat','','Indonesia','087812300098','deden@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(24,3,'customer',1,'General','Sumber pakan Jateng','Sumber pakan Jateng','','','-','Kota belum terdaftar','','Indonesia','087812300098','sumber_pakan_jateng@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(25,3,'customer',1,'General','Anta','Anta','','','Banjarnegara','Jawa Tengah','','Indonesia','087812300098','anta@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(26,3,'customer',1,'General','Kembar Pancing','Kembar Pancing','','','Bantul','DIY','','Indonesia','087739777455 / 0878-','kembar_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(27,3,'customer',1,'General','Bandar Pancing','Bandar Pancing','','','Batang','Jawa Tengah','','Indonesia','0858-8311-0036','bandar_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(28,3,'customer',1,'General','Limpung','Limpung','','','Batang','Jawa Tengah','','Indonesia','0823-2576-9288','limpung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(29,3,'customer',1,'General','Pancing Jaya 99','Pancing Jaya 99','','','Batang','Jawa Tengah','','Indonesia','0878-3063-6368','pancing_jaya_99@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(30,3,'customer',1,'General','Sun Pancing','Sun Pancing','','','Batang','Jawa Tengah','','Indonesia','087812300098','sun_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(31,3,'customer',1,'General','Allief','Allief','','','Blora','Jawa Tengah','','Indonesia','0815-7512-7919','allief@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(32,3,'customer',1,'General','Aris','Aris','','','Blora','Jawa Tengah','','Indonesia','087812300098','aris@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(33,3,'customer',1,'General','Asia','Asia','','','Blora','Jawa Tengah','','Indonesia','087812300098','asia@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(34,3,'customer',1,'General','DM Pancing Cepu','DM Pancing Cepu','','','Blora','Jawa Tengah','','Indonesia','0823-2453-5755','dm_pancing_cepu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(35,3,'customer',1,'General','Luwes','Luwes','','','Blora','Jawa Tengah','','Indonesia','087812300098','luwes@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(36,3,'customer',1,'General','Sinar Jaya Pancing','Sinar Jaya Pancing','','','Blora','Jawa Tengah','','Indonesia','087812300098','sinar_jaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(37,3,'customer',1,'General','Ozy Pancing','Ozy Pancing','','','Brebes','Jawa Tengah','','Indonesia','087812300098','ozy_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(38,3,'customer',1,'General','Subur','Subur','','','Brebes','Jawa Tengah','','Indonesia','087812300098','subur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(39,3,'customer',1,'General','Vigo Barokah Pancing','Vigo Barokah Pancing','','','Brebes','Jawa Tengah','','Indonesia','0882-3309-2193','vigo_barokah_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(40,3,'customer',1,'General','Aura','Aura','','','Cilacap','Jawa Tengah','','Indonesia','087812300098','aura@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(41,3,'customer',1,'General','Biru Toko','Biru Toko','','','Cilacap','Jawa Tengah','','Indonesia','081-6424-0928','biru_toko@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(42,3,'customer',1,'General','Kali Sabuk','Kali Sabuk','','','Cilacap','Jawa Tengah','','Indonesia','0815-4885-1281','kali_sabuk@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(43,3,'customer',1,'General','Raja','Raja','','','Cilacap','Jawa Tengah','','Indonesia','087812300098','raja@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(44,3,'customer',1,'General','Tirta Bahari','Tirta Bahari','','','Cilacap','Jawa Tengah','','Indonesia','0857-1330-5083','tirta_bahari@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(45,3,'customer',1,'General','Aneka Berkah','Aneka Berkah','','','Gunungkidul','Jawa Tengah','','Indonesia','081804347332','aneka_berkah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(46,3,'customer',1,'General','6 Saudara','6 Saudara','','','Jepara','Jawa Tengah','','Indonesia','087812300098','6_saudara@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(47,3,'customer',1,'General','Berkah Pancing','Berkah Pancing','','','Kebumen','Jawa Tengah','','Indonesia','087812300098','berkah_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(48,3,'customer',1,'General','Flow Sport','Flow Sport','','','Kebumen','Jawa Tengah','','Indonesia','0878-3738-4777','flow_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(49,3,'customer',1,'General','GG','GG','','','Kebumen','Jawa Tengah','','Indonesia','087812300098','gg@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(50,3,'customer',1,'General','Raharjo','Raharjo','','','Kebumen','Jawa Tengah','','Indonesia','0812-1261-2568','raharjo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(51,3,'customer',1,'General','Salma','Salma','','','Kebumen','Jawa Tengah','','Indonesia','0895-0609-3863','salma@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(52,3,'customer',1,'General','Yan','Yan','','','Kebumen','Jawa Tengah','','Indonesia','087812300098','yan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(53,3,'customer',1,'General','17-Pancing','17-Pancing','','','Kabupaten Kendal','Jawa Tengah','','Indonesia','0812-2871-1144','17-pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(54,3,'customer',1,'General','72-Pancing','72-Pancing','','','Kabupaten Kendal','Jawa Tengah','','Indonesia','0813-2577-4846','72-pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(55,3,'customer',1,'General','Fredy Pancing','Fredy Pancing','','','Kabupaten Kendal','Jawa Tengah','','Indonesia','0815-9222-870','fredy_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(56,3,'customer',1,'General','Nompo Dong','Nompo Dong','','','Kabupaten Kendal','Jawa Tengah','','Indonesia','0895-3924-06633','nompo_dong@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(57,3,'customer',1,'General','Liberty Pancing','Liberty Pancing','','','Klaten','Jawa Tengah','','Indonesia','0812-3271-7383','liberty_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(58,3,'customer',1,'General','Mulyadi','Mulyadi','','','Klaten','Jawa Tengah','','Indonesia','087812300098','mulyadi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(59,3,'customer',1,'General','Surya Pancing - Klaten','Surya Pancing - Klaten','','','Klaten','Jawa Tengah','','Indonesia','0896-5450-2046','surya_pancing_-_klaten@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(60,3,'customer',1,'General','Umi Pancing','Umi Pancing','','','Klaten','Jawa Tengah','','Indonesia','0858-0322-6992','umi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(61,3,'customer',1,'General','Zozo Pancing','Zozo Pancing','','','Klaten','Jawa Tengah','','Indonesia','0815-6781-3064','zozo_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(62,3,'customer',1,'General','Angga Pancing','Angga Pancing','','','Kudus','Jawa Tengah','','Indonesia','0812-7349-2270','angga_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(63,3,'customer',1,'General','Jati Pancing','Jati Pancing','','','Kudus','Jawa Tengah','','Indonesia','087812300098','jati_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(64,3,'customer',1,'General','Mbahe','Mbahe','','','Kudus','Jawa Tengah','','Indonesia','087812300098','mbahe@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(65,3,'customer',1,'General','Congot Pancing','Congot Pancing','','','Kulon Progo','DIY','','Indonesia','0856-4318-2222','congot_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(66,3,'customer',1,'General','Jumadill','Jumadill','','','Magelang','Jawa Tengah','','Indonesia','0818-0422-1142','jumadill@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(67,3,'customer',1,'General','Mustika Pancing','Mustika Pancing','','','Magelang','Jawa Tengah','','Indonesia','0822-4327-7743','mustika_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(68,3,'customer',1,'General','Terminal Pancing - Magelang','Terminal Pancing - Magelang','','','Magelang','Jawa Tengah','','Indonesia','081903975556','terminal_pancing_-_magelang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(69,3,'customer',1,'General','Berkat Cupang','Berkat Cupang','','','Pati','Jawa Tengah','','Indonesia','0896-3783-4929','berkat_cupang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(70,3,'customer',1,'General','Doel','Doel','','','Pati','Jawa Tengah','','Indonesia','0857-7523-6659','doel@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(71,3,'customer',1,'General','Gandika','Gandika','','','Pati','Jawa Tengah','','Indonesia','087812300098','gandika@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(72,3,'customer',1,'General','Kio','Kio','','','Pati','Jawa Tengah','','Indonesia','087812300098','kio@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(73,3,'customer',1,'General','Lautan Luas','Lautan Luas','','','Pati','Jawa Tengah','','Indonesia','0813-2815-4650','lautan_luas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(74,3,'customer',1,'General','Pancing & Ikan Hias','Pancing & Ikan Hias','','','Pati','Jawa Tengah','','Indonesia','0896-5425-3482','pancing_&_ikan_hias@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(75,3,'customer',1,'General','Penjawi Pancing','Penjawi Pancing','','','Pati','Jawa Tengah','','Indonesia','087812300098','penjawi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(76,3,'customer',1,'General','Arromi Pancing','Arromi Pancing','','','Pekalongan','Jawa Tengah','','Indonesia','0856-2651-222','arromi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(77,3,'customer',1,'General','Berhasil (Sinyo)','Berhasil (Sinyo)','','','Pekalongan','Jawa Tengah','','Indonesia','0823-2862-6647','berhasil_(sinyo)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(78,3,'customer',1,'General','Hobi Abadi','Hobi Abadi','','','Pekalongan','Jawa Tengah','','Indonesia','0858-7019-9562','hobi_abadi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(79,3,'customer',1,'General','Jaya Raya Pancing','Jaya Raya Pancing','','','Pekalongan','Jawa Tengah','','Indonesia','0878-7979-7171','jaya_raya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(80,3,'customer',1,'General','Layang-layang - Pancing','Layang-layang - Pancing','','','Pekalongan','Jawa Tengah','','Indonesia','087812300098','layang-layang_-_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(81,3,'customer',1,'General','Rizky Pancing','Rizky Pancing','','','Pekalongan','Jawa Tengah','','Indonesia','0823-2569-9261','rizky_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(82,3,'customer',1,'General','Sinar Bahagia','Sinar Bahagia','','','Pekalongan','Jawa Tengah','','Indonesia','0823-2569-9261','sinar_bahagia@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(83,3,'customer',1,'General','Arnam','Arnam','','','Pemalang','Jawa Tengah','','Indonesia','0859-4203-8708','arnam@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(84,3,'customer',1,'General','Budi Pancing','Budi Pancing','','','Pemalang','Jawa Tengah','','Indonesia','087812300098','budi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(85,3,'customer',1,'General','Dunia Aquarium','Dunia Aquarium','','','Pemalang','Jawa Tengah','','Indonesia','0878-3031-0032','dunia_aquarium@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(86,3,'customer',1,'General','Jangkar','Jangkar','','','Pemalang','Jawa Tengah','','Indonesia','0895-3617-20692','jangkar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(87,3,'customer',1,'General','Mas Udin Pancing','Mas Udin Pancing','','','Pemalang','Jawa Tengah','','Indonesia','0852-8000-5548','mas_udin_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(88,3,'customer',1,'General','Pangestu','Pangestu','','','Pemalang','Jawa Tengah','','Indonesia','0877-9874-2706','pangestu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(89,3,'customer',1,'General','Selera Sport','Selera Sport','','','Pemalang','Jawa Tengah','','Indonesia','0853-2663-9536','selera_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(90,3,'customer',1,'General','AS\'A Fishing','AS\'A Fishing','','','Purbalingga','Jawa Tengah','','Indonesia','0821-3474-3721','as\'a_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(91,3,'customer',1,'General','Dua Putra','Dua Putra','','','Purbalingga','Jawa Tengah','','Indonesia','087812300098','dua_putra@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(92,3,'customer',1,'General','Paris','Paris','','','Purbalingga','Jawa Tengah','','Indonesia','087812300098','paris@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(93,3,'customer',1,'General','Bambang','Bambang','','','Rembang','Jawa Tengah','','Indonesia','0812-2914-6285','bambang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(94,3,'customer',1,'General','Cahaya Pancing','Cahaya Pancing','','','Rembang','Jawa Tengah','','Indonesia','087812300098','cahaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(95,3,'customer',1,'General','Dian Pancing Lasem','Dian Pancing Lasem','','','Rembang','Jawa Tengah','','Indonesia','0852-3504-7722','dian_pancing_lasem@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(96,3,'customer',1,'General','Kencana Fishing & Pet Shop','Kencana Fishing & Pet Shop','','','Rembang','Jawa Tengah','','Indonesia','(0295) 532404','kencana_fishing_&_pet_shop@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(97,3,'customer',1,'General','Rembang.','Rembang.','','','Rembang','Jawa Tengah','','Indonesia','087812300098','rembang.@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(98,3,'customer',1,'General','Ye Fishing','Ye Fishing','','','Rembang','Jawa Tengah','','Indonesia','087812300098','ye_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(99,3,'customer',1,'General','ASPS Eddy','ASPS Eddy','','','Semarang','Jawa Tengah','','Indonesia','087812300098','asps_eddy@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(100,3,'customer',1,'General','Mitra Nelayan','Mitra Nelayan','','','Ambarawa','Jawa Tengah','','Indonesia','0856-2705-334','mitra_nelayan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(101,3,'customer',1,'General','Sumber Rezeki SMG','Sumber Rezeki SMG','','','Semarang','Jawa Tengah','','Indonesia','0896-6500-2586','sumber_rezeki_smg@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(102,3,'customer',1,'General','Raja Pancing - Sragen','Raja Pancing - Sragen','','','Sragen','Jawa Tengah','','Indonesia','085713004487','raja_pancing_-_sragen@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(103,3,'customer',1,'General','Rajawali Sport/ Fishing','Rajawali Sport/ Fishing','','','Sragen','Jawa Tengah','','Indonesia','0858-6715-5775','rajawali_sport/_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(104,3,'customer',1,'General','Satria Pancing - Sragen','Satria Pancing - Sragen','','','Sragen','Jawa Tengah','','Indonesia','085642314995','satria_pancing_-_sragen@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(105,3,'customer',1,'General','Makmur Pancing - Sukoharjo','Makmur Pancing - Sukoharjo','','','Sukoharjo','Jawa Tengah','','Indonesia','089505122233','makmur_pancing_-_sukoharjo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(106,3,'customer',1,'General','Yuli Pancing','Yuli Pancing','','','Sukoharjo','Jawa Tengah','','Indonesia','0812-2544-6432','yuli_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(107,3,'customer',1,'General','JVN','JVN','','','Surakarta','Jawa Tengah','','Indonesia','0812-8898-8511','jvn@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(108,3,'customer',1,'General','Pak Agustian','Pak Agustian','','','Surakarta','Jawa Tengah','','Indonesia','087812300098','pak_agustian@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(109,3,'customer',1,'General','Permai Pancing','Permai Pancing','','','Surakarta','Jawa Tengah','','Indonesia','0851-0002-6383','permai_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(110,3,'customer',1,'General','Dewi Pancing','Dewi Pancing','','','Tegal','Jawa Tengah','','Indonesia','0897-6760-489','dewi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(111,3,'customer',1,'General','Dian Pancing (Tegal)','Dian Pancing (Tegal)','','','Tegal','Jawa Tengah','','Indonesia','0852-2917-1677','dian_pancing_(tegal)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(112,3,'customer',1,'General','Eni','Eni','','','Tegal','Jawa Tengah','','Indonesia','087812300098','eni@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(113,3,'customer',1,'General','Isul Pancing','Isul Pancing','','','Tegal','Jawa Tengah','','Indonesia','0838-0965-5472','isul_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(114,3,'customer',1,'General','Kembang','Kembang','','','Tegal','Jawa Tengah','','Indonesia','087812300098','kembang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(115,3,'customer',1,'General','Pakan Hewan Ingon PS','Pakan Hewan Ingon PS','','','Tegal','Jawa Tengah','','Indonesia','0823-2444-2227','pakan_hewan_ingon_ps@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(116,3,'customer',1,'General','Untung Pancing','Untung Pancing','','','Tegal','Jawa Tengah','','Indonesia','0823-2211-1642','untung_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(117,3,'customer',1,'General','Wahana Pancing','Wahana Pancing','','','Temanggung','Jawa Tengah','','Indonesia','0856-2576-757','wahana_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(118,3,'customer',1,'General','Prima Jaya','Prima Jaya','','','Wonogiri','Jawa Tengah','','Indonesia','0821-3529-2484','prima_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(119,3,'customer',1,'General','Bandar Agung Pancing','Bandar Agung Pancing','','','Wonosobo','Jawa Tengah','','Indonesia','0852-2742-5262','bandar_agung_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(120,3,'customer',1,'General','Suka-suka Pancing','Suka-suka Pancing','','','Yogyakarta','DIY','','Indonesia','0859-7401-5126','suka-suka_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(121,3,'customer',1,'General','Tholex\'s Pancing','Tholex\'s Pancing','','','Yogyakarta','DIY','','Indonesia','087-700-313-008','tholex\'s_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(122,3,'customer',1,'General','FFM','FFM','','','-','Kota belum terdaftar','','Indonesia','087812300098','ffm@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(123,3,'customer',1,'General','Al Barokah','Al Barokah','','','Bangkalan','Jawa Timur','','Indonesia','087812300098','al_barokah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(124,3,'customer',1,'General','Dewi Sri','Dewi Sri','','','Bangkalan','Jawa Timur','','Indonesia','087812300098','dewi_sri@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(125,3,'customer',1,'General','Sentra Pancing Kamal','Sentra Pancing Kamal','','','Bangkalan','Jawa Timur','','Indonesia','085266668967','sentra_pancing_kamal@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(126,3,'customer',1,'General','31 Fishing','31 Fishing','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','31_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(127,3,'customer',1,'General','Asia Pancing','Asia Pancing','','','Banyuwangi','Jawa Timur','','Indonesia','0822-3404-1944','asia_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(128,3,'customer',1,'General','Baluran Indah','Baluran Indah','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','baluran_indah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(129,3,'customer',1,'General','Barokah Banyuwangi','Barokah Banyuwangi','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','barokah_banyuwangi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(130,3,'customer',1,'General','Fix Fishing','Fix Fishing','','','Banyuwangi','Jawa Timur','','Indonesia','0888-0565-1778','fix_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(131,3,'customer',1,'General','H&H Fishing','H&H Fishing','','','Banyuwangi','Jawa Timur','','Indonesia','081228360896','h&h_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(132,3,'customer',1,'General','Hoki','Hoki','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','hoki@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(133,3,'customer',1,'General','Jogo Samudro','Jogo Samudro','','','Banyuwangi','Jawa Timur','','Indonesia','0812-3284-867','jogo_samudro@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(134,3,'customer',1,'General','Karsun Hadi','Karsun Hadi','','','Banyuwangi','Jawa Timur','','Indonesia','0821-3928-6188','karsun_hadi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(135,3,'customer',1,'General','Khozim','Khozim','','','Banyuwangi','Jawa Timur','','Indonesia','0812-2524-7457','khozim@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(136,3,'customer',1,'General','Krisna','Krisna','','','Banyuwangi','Jawa Timur','','Indonesia','0812-1715-5642','krisna@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(137,3,'customer',1,'General','Mas Andik','Mas Andik','','','Banyuwangi','Jawa Timur','','Indonesia','0813-3881-5784','mas_andik@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(138,3,'customer',1,'General','Omah Ndelik','Omah Ndelik','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','omah_ndelik@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(139,3,'customer',1,'General','Pancing Mas','Pancing Mas','','','Banyuwangi','Jawa Timur','','Indonesia','0821-4378-3700','pancing_mas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(140,3,'customer',1,'General','PK Fishing','PK Fishing','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','pk_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(141,3,'customer',1,'General','Rony Pendowo','Rony Pendowo','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','rony_pendowo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(142,3,'customer',1,'General','Sumber Rejeki Banyuwangi','Sumber Rejeki Banyuwangi','','','Banyuwangi','Jawa Timur','','Indonesia','0822-3429-7648','sumber_rejeki_banyuwangi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(143,3,'customer',1,'General','Wijaya','Wijaya','','','Banyuwangi','Jawa Timur','','Indonesia','087812300098','wijaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(144,3,'customer',1,'General','Cipto','Cipto','','','Batu','Jawa Timur','','Indonesia','(0341) 593772','cipto@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(145,3,'customer',1,'General','Gelora Batu','Gelora Batu','','','Batu','Jawa Timur','','Indonesia','0878-3668-4645','gelora_batu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(146,3,'customer',1,'General','Kawi Pancing','Kawi Pancing','','','Batu','Jawa Timur','','Indonesia','087812300098','kawi_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(147,3,'customer',1,'General','Mobil Pak Anton','Mobil Pak Anton','','','Batu','Jawa Timur','','Indonesia','087812300098','mobil_pak_anton@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(148,3,'customer',1,'General','Mobil Pak Chris','Mobil Pak Chris','','','Batu','Jawa Timur','','Indonesia','087812300098','mobil_pak_chris@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(149,3,'customer',1,'General','Mobil Pak Peterson','Mobil Pak Peterson','','','Batu','Jawa Timur','','Indonesia','087812300098','mobil_pak_peterson@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(150,3,'customer',1,'General','Mobil Pak Yoga','Mobil Pak Yoga','','','Batu','Jawa Timur','','Indonesia','087812300098','mobil_pak_yoga@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(151,3,'customer',1,'General','P. BINTAR','P. BINTAR','','','Batu','Jawa Timur','','Indonesia','087812300098','p._bintar_@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(152,3,'customer',1,'General','Pak Paham','Pak Paham','','','Batu','Jawa Timur','','Indonesia','087812300098','pak_paham@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(153,3,'customer',1,'General','Pak Yahya','Pak Yahya','','','Batu','Jawa Timur','','Indonesia','087812300098','pak_yahya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(154,3,'customer',1,'General','Rudijanto','Rudijanto','','','Batu','Jawa Timur','','Indonesia','087812300098','rudijanto@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(155,3,'customer',1,'General','TNT','TNT','','','Batu','Jawa Timur','','Indonesia','0856-0440-6192','tnt@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(156,3,'customer',1,'General','Asri Raya Pancing','Asri Raya Pancing','','','Blitar','Jawa Timur','','Indonesia','0856-4888-8768','asri_raya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(157,3,'customer',1,'General','Brantas Blitar','Brantas Blitar','','','Blitar','Jawa Timur','','Indonesia','081233575575','brantas_blitar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(158,3,'customer',1,'General','Dhika Pancing','Dhika Pancing','','','Blitar','Jawa Timur','','Indonesia','0815-5590-8808','dhika_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(159,3,'customer',1,'General','Dua Nusa','Dua Nusa','','','Blitar','Jawa Timur','','Indonesia','0857-3679-8770','dua_nusa@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(160,3,'customer',1,'General','Hero','Hero','','','Blitar','Jawa Timur','','Indonesia','081333221022','hero@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(161,3,'customer',1,'General','Hobiis Fishing','Hobiis Fishing','','','Blitar','Jawa Timur','','Indonesia','0877-5698-8008','hobiis_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(162,3,'customer',1,'General','Indo Indah Fishing','Indo Indah Fishing','','','Blitar','Jawa Timur','','Indonesia','087812300098','indo_indah_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(163,3,'customer',1,'General','Jatinom Pancing','Jatinom Pancing','','','Blitar','Jawa Timur','','Indonesia','0815-1510-3770','jatinom_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(164,3,'customer',1,'General','Mata Pancing Blitar','Mata Pancing Blitar','','','Blitar','Jawa Timur','','Indonesia','087812300098','mata_pancing_blitar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(165,3,'customer',1,'General','Maxis Pancing','Maxis Pancing','','','Blitar','Jawa Timur','','Indonesia','0815-5420-9391','maxis_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(166,3,'customer',1,'General','Niko','Niko','','','Blitar','Jawa Timur','','Indonesia','0856-4847-8655','niko@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(167,3,'customer',1,'General','Purnama Pancing','Purnama Pancing','','','Blitar','Jawa Timur','','Indonesia','087812300098','purnama_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(168,3,'customer',1,'General','Randuagung','Randuagung','','','Blitar','Jawa Timur','','Indonesia','0813-3459-1389','randuagung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(169,3,'customer',1,'General','Rimba Naga','Rimba Naga','','','Blitar','Jawa Timur','','Indonesia','087812300098','rimba_naga@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(170,3,'customer',1,'General','Rio','Rio','','','Blitar','Jawa Timur','','Indonesia','087812300098','rio@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(171,3,'customer',1,'General','Sauli Matun','Sauli Matun','','','Blitar','Jawa Timur','','Indonesia','087812300098','sauli_matun@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(172,3,'customer',1,'General','Aneka Mainan dan Pancing','Aneka Mainan dan Pancing','','','Bojonegoro','Jawa Timur','','Indonesia','0812-4606-2051','aneka_mainan_dan_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(173,3,'customer',1,'General','Mayangkoro Pancing','Mayangkoro Pancing','','','Bojonegoro','Jawa Timur','','Indonesia','0823-3386-1555','mayangkoro_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(174,3,'customer',1,'General','Putra Jaya','Putra Jaya','','','Bojonegoro','Jawa Timur','','Indonesia','0821-4009-2921','putra_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(175,3,'customer',1,'General','Santoso','Santoso','','','Bojonegoro','Jawa Timur','','Indonesia','0812-3084-6071','santoso@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(176,3,'customer',1,'General','Hobby Bondowoso','Hobby Bondowoso','','','Bondowoso','Jawa Timur','','Indonesia','0813-3678-2568','hobby_bondowoso@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(177,3,'customer',1,'General','Ipank Fishing','Ipank Fishing','','','Bondowoso','Jawa Timur','','Indonesia','0831-1150-9327','ipank_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(178,3,'customer',1,'General','Pro Fishing','Pro Fishing','','','Bondowoso','Jawa Timur','','Indonesia','087812300098','pro_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(179,3,'customer',1,'General','Trendy One (Hardy)','Trendy One (Hardy)','','','Bondowoso','Jawa Timur','','Indonesia','0852-3260-6369','trendy_one_(hardy)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(180,3,'customer',1,'General','Anugerah','Anugerah','','','Gresik','Jawa Timur','','Indonesia','0857-8441-9828','anugerah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(181,3,'customer',1,'General','Boss Se7en','Boss Se7en','','','Gresik','Jawa Timur','','Indonesia','087812300098','boss_se7en@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(182,3,'customer',1,'General','Dio','Dio','','','Gresik','Jawa Timur','','Indonesia','087812300098','dio@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(183,3,'customer',1,'General','Gogon','Gogon','','','Gresik','Jawa Timur','','Indonesia','0816-4504-572','gogon@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(184,3,'customer',1,'General','Harmoni','Harmoni','','','Gresik','Jawa Timur','','Indonesia','0878-5373-7282','harmoni@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(185,3,'customer',1,'General','KIG','KIG','','','Gresik','Jawa Timur','','Indonesia','0811-343-772','kig@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(186,3,'customer',1,'General','Permata','Permata','','','Gresik','Jawa Timur','','Indonesia','0811-328-305','permata@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(187,3,'customer',1,'General','Ulam Jaya Pancing','Ulam Jaya Pancing','','','Gresik','Jawa Timur','','Indonesia','0813-3215-9099','ulam_jaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(188,3,'customer',1,'General','24','24','','','Jember','Jawa Timur','','Indonesia','0823-3070-9124','24@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(189,3,'customer',1,'General','Alam (P. Bakar)','Alam (P. Bakar)','','','Jember','Jawa Timur','','Indonesia','0852-3553-5445','alam_(p._bakar)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(190,3,'customer',1,'General','Alam Samudera','Alam Samudera','','','Jember','Jawa Timur','','Indonesia','0852-3553-5445','alam_samudera@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(191,3,'customer',1,'General','Aneka Jaya','Aneka Jaya','','','Jember','Jawa Timur','','Indonesia','0852-3655-9153','aneka_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(192,3,'customer',1,'General','Arwana Jember','Arwana Jember','','','Jember','Jawa Timur','','Indonesia','0823-3062-6908','arwana_jember@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(193,3,'customer',1,'General','ASPS Anggun','ASPS Anggun','','','Jember','Jawa Timur','','Indonesia','087812300098','asps_anggun@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(194,3,'customer',1,'General','Barokah','Barokah','','','Jember','Jawa Timur','','Indonesia','0857-3130-3873','barokah@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(195,3,'customer',1,'General','Bu. Toro/Baratan Antirogo','Bu. Toro/Baratan Antirogo','','','Jember','Jawa Timur','','Indonesia','087812300098','bu._toro/baratan_antirogo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(196,3,'customer',1,'General','Central Pancing','Central Pancing','','','Jember','Jawa Timur','','Indonesia','0821-4135-3950','central_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(197,3,'customer',1,'General','Daim','Daim','','','Jember','Jawa Timur','','Indonesia','087812300098','daim@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(198,3,'customer',1,'General','Deny','Deny','','','Jember','Jawa Timur','','Indonesia','0822-3296-1801 / 033','deny@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(199,3,'customer',1,'General','Duta Pancing','Duta Pancing','','','Jember','Jawa Timur','','Indonesia','0852-5886-2063','duta_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(200,3,'customer',1,'General','Elisa','Elisa','','','Jember','Jawa Timur','','Indonesia','087812300098','elisa@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(201,3,'customer',1,'General','Febri','Febri','','','Jember','Jawa Timur','','Indonesia','0812-3198-0255','febri@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(202,3,'customer',1,'General','Gebang Teckle','Gebang Teckle','','','Jember','Jawa Timur','','Indonesia','0813-3999-9509','gebang_teckle@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(203,3,'customer',1,'General','Kuning','Kuning','','','Jember','Jawa Timur','','Indonesia','0851-0184-5907','kuning@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(204,3,'customer',1,'General','Kurnia','Kurnia','','','Jember','Jawa Timur','','Indonesia','087812300098','kurnia@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(205,3,'customer',1,'General','Leo Fishing','Leo Fishing','','','Jember','Jawa Timur','','Indonesia','0823-1326-0941','leo_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(206,3,'customer',1,'General','Maharani','Maharani','','','Jember','Jawa Timur','','Indonesia','0819-0600-1675','maharani@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(207,3,'customer',1,'General','Mas Briyan','Mas Briyan','','','Jember','Jawa Timur','','Indonesia','087812300098','mas_briyan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(208,3,'customer',1,'General','Mira Jember','Mira Jember','','','Jember','Jawa Timur','','Indonesia','082140374310','mira_jember@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(209,3,'customer',1,'General','Mobil Pak Budi','Mobil Pak Budi','','','Jember','Jawa Timur','','Indonesia','0821-4375-7649','mobil_pak_budi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(210,3,'customer',1,'General','Nirwana','Nirwana','','','Jember','Jawa Timur','','Indonesia','087812300098','nirwana@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(211,3,'customer',1,'General','Nosel','Nosel','','','Jember','Jawa Timur','','Indonesia','087812300098','nosel@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(212,3,'customer',1,'General','O\'ocong','O\'ocong','','','Jember','Jawa Timur','','Indonesia','087812300098','o\'ocong@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(213,3,'customer',1,'General','Pak Eko','Pak Eko','','','Jember','Jawa Timur','','Indonesia','082231259599/ 822140','pak_eko@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(214,3,'customer',1,'General','Pendik','Pendik','','','Jember','Jawa Timur','','Indonesia','087812300098','pendik@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(215,3,'customer',1,'General','Planet Pancing','Planet Pancing','','','Jember','Jawa Timur','','Indonesia','0822-3330-7080','planet_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(216,3,'customer',1,'General','Radista Jember','Radista Jember','','','Jember','Jawa Timur','','Indonesia','0853-9394-4045','radista_jember@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(217,3,'customer',1,'General','Rumah Pancing','Rumah Pancing','','','Jember','Jawa Timur','','Indonesia','0812-1312-3443','rumah_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(218,3,'customer',1,'General','Serasi','Serasi','','','Jember','Jawa Timur','','Indonesia','0853-3880-0533','serasi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(219,3,'customer',1,'General','Soponyono','Soponyono','','','Probolinggo','Jawa Timur','','Indonesia','0823-3054-2255','soponyono@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(220,3,'customer',1,'General','Vegas Sport','Vegas Sport','','','Jember','Jawa Timur','','Indonesia','0823-3716-5757','vegas_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(221,3,'customer',1,'General','Wahyu Sport','Wahyu Sport','','','Jember','Jawa Timur','','Indonesia','0812-1792-0436','wahyu_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(222,3,'customer',1,'General','Zyannur','Zyannur','','','Jember','Jawa Timur','','Indonesia','0823-3103-1330','zyannur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(223,3,'customer',1,'General','Arwana Pancing','Arwana Pancing','','','Jombang','Jawa Timur','','Indonesia','081330176731','arwana_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(224,3,'customer',1,'General','Brantas','Brantas','','','Jombang','Jawa Timur','','Indonesia','0857-9467-7659','brantas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(225,3,'customer',1,'General','Idola','Idola','','','Jombang','Jawa Timur','','Indonesia','0858-5191-8998','idola@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(226,3,'customer',1,'General','Niaga','Niaga','','','Jombang','Jawa Timur','','Indonesia','0815-5125-076','niaga@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(227,3,'customer',1,'General','Pujangga','Pujangga','','','Jombang','Jawa Timur','','Indonesia','0822-4448-8844','pujangga@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(228,3,'customer',1,'General','Tiara','Tiara','','','Jombang','Jawa Timur','','Indonesia','082146221918','tiara@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(229,3,'customer',1,'General','Agus Mujianto/ Munadji','Agus Mujianto/ Munadji','','','Kediri','Jawa Timur','','Indonesia','0821-4160-8488','agus_mujianto/_munadji@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(230,3,'customer',1,'General','Arkilap Pancing','Arkilap Pancing','','','Kediri','Jawa Timur','','Indonesia','0881-9091-098','arkilap_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(231,3,'customer',1,'General','Garuda Fishing','Garuda Fishing','','','Kediri','Jawa Timur','','Indonesia','0812-3234-4333','garuda_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(232,3,'customer',1,'General','Hanna Pancing','Hanna Pancing','','','Kediri','Jawa Timur','','Indonesia','0857-3198-8357','hanna_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(233,3,'customer',1,'General','Jabon','Jabon','','','Kediri','Jawa Timur','','Indonesia','0812-3022-4780','jabon@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(234,3,'customer',1,'General','Kenzo Pancing','Kenzo Pancing','','','Kediri','Jawa Timur','','Indonesia','087812300098','kenzo_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(235,3,'customer',1,'General','Mira Fishing','Mira Fishing','','','Kediri','Jawa Timur','','Indonesia','0812-3256-008','mira_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(236,3,'customer',1,'General','Q-Rom Pancing','Q-Rom Pancing','','','Kediri','Jawa Timur','','Indonesia','087812300098','q-rom_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(237,3,'customer',1,'General','Sinar Terang','Sinar Terang','','','Kediri','Jawa Timur','','Indonesia','0812-5245-3744','sinar_terang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(238,3,'customer',1,'General','Wahyu','Wahyu','','','Kediri','Jawa Timur','','Indonesia','0822-6660-7499','wahyu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(239,3,'customer',1,'General','AJM','AJM','','','Lamongan','Jawa Timur','','Indonesia','0813-3151-4121','ajm@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(240,3,'customer',1,'General','Alwi','Alwi','','','Lamongan','Jawa Timur','','Indonesia','087812300098','alwi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(241,3,'customer',1,'General','Anugrah Lamongan','Anugrah Lamongan','','','Lamongan','Jawa Timur','','Indonesia','0812-1494-6996','anugrah_lamongan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(242,3,'customer',1,'General','Dipo','Dipo','','','Lamongan','Jawa Timur','','Indonesia','085730007846','dipo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(243,3,'customer',1,'General','Family','Family','','','Lamongan','Jawa Timur','','Indonesia','0856-3311-543','family@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(244,3,'customer',1,'General','Istana Pancing Lamongan','Istana Pancing Lamongan','','','Lamongan','Jawa Timur','','Indonesia','0857-3138-2121','istana_pancing_lamongan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(245,3,'customer',1,'General','Karunia Putra Fishing','Karunia Putra Fishing','','','Lamongan','Jawa Timur','','Indonesia','085733703751','karunia_putra_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(246,3,'customer',1,'General','Sumber Pancing Lamongan','Sumber Pancing Lamongan','','','Lamongan','Jawa Timur','','Indonesia','0813-1544-0014','sumber_pancing_lamongan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(247,3,'customer',1,'General','Sumber Rejeki Lamongan','Sumber Rejeki Lamongan','','','Lamongan','Jawa Timur','','Indonesia','0822-3151-3399','sumber_rejeki_lamongan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(248,3,'customer',1,'General','Buang - Lumajang','Buang - Lumajang','','','Lumajang','Jawa Timur','','Indonesia','0858-5010-2796','buang_-_lumajang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(249,3,'customer',1,'General','Fajar Pancing','Fajar Pancing','','','Lumajang','Jawa Timur','','Indonesia','085215589057','fajar_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(250,3,'customer',1,'General','Graha Sport','Graha Sport','','','Lumajang','Jawa Timur','','Indonesia','0821-4044-6361','graha_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(251,3,'customer',1,'General','Laskar Pancing','Laskar Pancing','','','Lumajang','Jawa Timur','','Indonesia','082330220488','laskar_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(252,3,'customer',1,'General','Morojoyo','Morojoyo','','','Lumajang','Jawa Timur','','Indonesia','0812-3188-2834','morojoyo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(253,3,'customer',1,'General','New Trio','New Trio','','','Lumajang','Jawa Timur','','Indonesia','087812300098','new_trio@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(254,3,'customer',1,'General','Rejeki Pancing','Rejeki Pancing','','','Lumajang','Jawa Timur','','Indonesia','0852-5871-2456','rejeki_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(255,3,'customer',1,'General','Rio Fishing','Rio Fishing','','','Lumajang','Jawa Timur','','Indonesia','087812300098','rio_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(256,3,'customer',1,'General','Sinar Pancing Lumajang','Sinar Pancing Lumajang','','','Lumajang','Jawa Timur','','Indonesia','0852-3344-2099','sinar_pancing_lumajang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(257,3,'customer',1,'General','Trio','Trio','','','Lumajang','Jawa Timur','','Indonesia','0852-3085-0888','trio@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(258,3,'customer',1,'General','Bantaran','Bantaran','','','Madiun','Jawa Timur','','Indonesia','0812-5907-9909','bantaran@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(259,3,'customer',1,'General','Dambo','Dambo','','','Madiun','Jawa Timur','','Indonesia','0813-1474-8548/ 0857','dambo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(260,3,'customer',1,'General','Gelora Madiun','Gelora Madiun','','','Madiun','Jawa Timur','','Indonesia','0877-3975-7000','gelora_madiun@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(261,3,'customer',1,'General','Lala Sport','Lala Sport','','','Madiun','Jawa Timur','','Indonesia','0813-3522-2466','lala_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(262,3,'customer',1,'General','Orchid Fishing Shop','Orchid Fishing Shop','','','Madiun','Jawa Timur','','Indonesia','0812-3426-2909','orchid_fishing_shop@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(263,3,'customer',1,'General','Pokoke Mancing','Pokoke Mancing','','','Madiun','Jawa Timur','','Indonesia','0812-5963-181','pokoke_mancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(264,3,'customer',1,'General','Srikandi Fishing','Srikandi Fishing','','','Madiun','Jawa Timur','','Indonesia','0821-3231-2935','srikandi_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(265,3,'customer',1,'General','Sumber Rejeki Madiun','Sumber Rejeki Madiun','','','Madiun','Jawa Timur','','Indonesia','087812300098','sumber_rejeki_madiun@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(266,3,'customer',1,'General','Toyiba','Toyiba','','','Madiun','Jawa Timur','','Indonesia','081-2170-88599','toyiba@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(267,3,'customer',1,'General','Borneo Jaya','Borneo Jaya','','','Magetan','Jawa Timur','','Indonesia','0878-6343-7500','borneo_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(268,3,'customer',1,'General','Dodik','Dodik','','','Magetan','Jawa Timur','','Indonesia','087812300098','dodik@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(269,3,'customer',1,'General','Garuda Mas','Garuda Mas','','','Magetan','Jawa Timur','','Indonesia','(0351) 4360407','garuda_mas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(270,3,'customer',1,'General','Sugeng','Sugeng','','','Magetan','Jawa Timur','','Indonesia','08123425973','sugeng@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(271,3,'customer',1,'General','288 Sumbersari','288 Sumbersari','','','Malang','Jawa Timur','','Indonesia','0819-9830-7594','288_sumbersari@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(272,3,'customer',1,'General','Alfa Pancing','Alfa Pancing','','','Malang','Jawa Timur','','Indonesia','0821-9889-8868','alfa_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(273,3,'customer',1,'General','Anora Fishing','Anora Fishing','','','Malang','Jawa Timur','','Indonesia','0852-3426-4777','anora_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(274,3,'customer',1,'General','ASPS Alvan','ASPS Alvan','','','Malang','Jawa Timur','','Indonesia','0821-3263-3004','asps_alvan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(275,3,'customer',1,'General','Asri Ps','Asri Ps','','','Malang','Jawa Timur','','Indonesia','0896-5267-6733','asri_ps@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(276,3,'customer',1,'General','Barokah Bululawang','Barokah Bululawang','','','Malang','Jawa Timur','','Indonesia','0811-3444-042','barokah_bululawang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(277,3,'customer',1,'General','Binatara','Binatara','','','Malang','Jawa Timur','','Indonesia','0822-9853-8669','binatara@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(278,3,'customer',1,'General','Bolo Pancing','Bolo Pancing','','','Malang','Jawa Timur','','Indonesia','0857-9185-3331','bolo_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(279,3,'customer',1,'General','Dewata','Dewata','','','Malang','Jawa Timur','','Indonesia','087812300098','dewata@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(280,3,'customer',1,'General','Dian Pancing 1','Dian Pancing 1','','','Malang','Jawa Timur','','Indonesia','0878-5979-2958','dian_pancing_1@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(281,3,'customer',1,'General','Dian Pancing 2','Dian Pancing 2','','','Malang','Jawa Timur','','Indonesia','0878-5979-2958','dian_pancing_2@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(282,3,'customer',1,'General','DK Fishing','DK Fishing','','','Malang','Jawa Timur','','Indonesia','087812300098','dk_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(283,3,'customer',1,'General','Dunia Pancing','Dunia Pancing','','','Malang','Jawa Timur','','Indonesia','0813-3433-0564','dunia_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(284,3,'customer',1,'General','Ega Jaya Malang','Ega Jaya Malang','','','Malang','Jawa Timur','','Indonesia','085790338955','ega_jaya_malang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(285,3,'customer',1,'General','Gober','Gober','','','Malang','Jawa Timur','','Indonesia','0851-0248-4680','gober@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(286,3,'customer',1,'General','GT Pancing','GT Pancing','','','Malang','Jawa Timur','','Indonesia','0878-5904-3264','gt_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(287,3,'customer',1,'General','Gulamo','Gulamo','','','Malang','Jawa Timur','','Indonesia','0819-3799-3515','gulamo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(288,3,'customer',1,'General','Hoki Malang','Hoki Malang','','','Malang','Jawa Timur','','Indonesia','087812300098','hoki_malang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(289,3,'customer',1,'General','Irexz','Irexz','','','Malang','Jawa Timur','','Indonesia','0896-9420-2546','irexz@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(290,3,'customer',1,'General','Irma Pancing','Irma Pancing','','','Malang','Jawa Timur','','Indonesia','081233622267','irma_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(291,3,'customer',1,'General','Iwak\'E Pancing','Iwak\'E Pancing','','','Malang','Jawa Timur','','Indonesia','0815-5544-4808','iwak\'e_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(292,3,'customer',1,'General','Jago','Jago','','','Malang','Jawa Timur','','Indonesia','087812300098','jago@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(293,3,'customer',1,'General','Karunia Pancing','Karunia Pancing','','','Malang','Jawa Timur','','Indonesia','(0341) 422968','karunia_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(294,3,'customer',1,'General','Kendalsari Fishing','Kendalsari Fishing','','','Malang','Jawa Timur','','Indonesia','087812300098','kendalsari_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(295,3,'customer',1,'General','LM 69','LM 69','','','Malang','Jawa Timur','','Indonesia','0821-3972-6809/0812-','lm_69@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(296,3,'customer',1,'General','Mandiri 2 Turen','Mandiri 2 Turen','','','Malang','Jawa Timur','','Indonesia','0813-5814-4443','mandiri_2_turen@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(297,3,'customer',1,'General','MAS YK','MAS YK','','','Malang','Jawa Timur','','Indonesia','087812300098','mas_yk@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(298,3,'customer',1,'General','Mentari','Mentari','','','Malang','Jawa Timur','','Indonesia','0851-0030-9997','mentari@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(299,3,'customer',1,'General','Mobil Pak Avied','Mobil Pak Avied','','','Malang','Jawa Timur','','Indonesia','087812300098','mobil_pak_avied@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(300,3,'customer',1,'General','Muara Pancing','Muara Pancing','','','Malang','Jawa Timur','','Indonesia','0856-4594-5115','muara_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(301,3,'customer',1,'General','Mulyorejo','Mulyorejo','','','Malang','Jawa Timur','','Indonesia','0852-2250-0065','mulyorejo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(302,3,'customer',1,'General','Oky Pancing','Oky Pancing','','','Malang','Jawa Timur','','Indonesia','0851-0270-7743','oky_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(303,3,'customer',1,'General','Pancing Jaya','Pancing Jaya','','','Malang','Jawa Timur','','Indonesia','087759749029','pancing_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(304,3,'customer',1,'General','Pancing NAS','Pancing NAS','','','Malang','Jawa Timur','','Indonesia','087812300098','pancing_nas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(305,3,'customer',1,'General','Pancing Samudra','Pancing Samudra','','','Malang','Jawa Timur','','Indonesia','0821-4357-8068','pancing_samudra@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(306,3,'customer',1,'General','Platinum','Platinum','','','Malang','Jawa Timur','','Indonesia','(0341) 556665','platinum@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(307,3,'customer',1,'General','Purnama','Purnama','','','Malang','Jawa Timur','','Indonesia','0815-5573-0293','purnama@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(308,3,'customer',1,'General','Rizky Pancing Malang','Rizky Pancing Malang','','','Malang','Jawa Timur','','Indonesia','0856-0780-3980','rizky_pancing_malang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(309,3,'customer',1,'General','Salim','Salim','','','Malang','Jawa Timur','','Indonesia','087812300098','salim@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(310,3,'customer',1,'General','Sangkar Jaya','Sangkar Jaya','','','Malang','Jawa Timur','','Indonesia','0812-3323-8585','sangkar_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(311,3,'customer',1,'General','Sobo Kali','Sobo Kali','','','Malang','Jawa Timur','','Indonesia','0852-3534-8249','sobo_kali@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(312,3,'customer',1,'General','Sumber Pancing Bululawang','Sumber Pancing Bululawang','','','Malang','Jawa Timur','','Indonesia','0815-5599-6231/08585','sumber_pancing_bululawang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(313,3,'customer',1,'General','Sumber Pancing Sawahan','Sumber Pancing Sawahan','','','Malang','Jawa Timur','','Indonesia','(0341) 364003','sumber_pancing_sawahan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(314,3,'customer',1,'General','Teras Pancing','Teras Pancing','','','Malang','Jawa Timur','','Indonesia','0819-3777-0419','teras_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(315,3,'customer',1,'General','TJ Pancing','TJ Pancing','','','Malang','Jawa Timur','','Indonesia','0812-1788-5654','tj_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(316,3,'customer',1,'General','TKP','TKP','','','Malang','Jawa Timur','','Indonesia','0813-1988-0887','tkp@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(317,3,'customer',1,'General','Toko 2 Prima','Toko 2 Prima','','','Malang','Jawa Timur','','Indonesia','0852-5932-4978','toko_2_prima@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(318,3,'customer',1,'General','Trijaya Pancing','Trijaya Pancing','','','Malang','Jawa Timur','','Indonesia','082337671000','trijaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(319,3,'customer',1,'General','Warung Pancing Citra','Warung Pancing Citra','','','Malang','Jawa Timur','','Indonesia','0898-4358-919','warung_pancing_citra@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(320,3,'customer',1,'General','Yasin','Yasin','','','Malang','Jawa Timur','','Indonesia','0857-9134-5187','yasin@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(321,3,'customer',1,'General','Amirah Pancing','Amirah Pancing','','','Mojokerto','Jawa Timur','','Indonesia','089509535203','amirah_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(322,3,'customer',1,'General','AP Fishing','AP Fishing','','','Mojokerto','Jawa Timur','','Indonesia','0852-3255-8501','ap_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(323,3,'customer',1,'General','Mugen','Mugen','','','Mojokerto','Jawa Timur','','Indonesia','0857-0707-0827','mugen@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(324,3,'customer',1,'General','Pandawa Pancing','Pandawa Pancing','','','Mojokerto','Jawa Timur','','Indonesia','081230152089','pandawa_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(325,3,'customer',1,'General','Record','Record','','','Mojokerto','Jawa Timur','','Indonesia','0813-5896-0005','record@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(326,3,'customer',1,'General','Sido Makmur Mojokerto','Sido Makmur Mojokerto','','','Mojokerto','Jawa Timur','','Indonesia','0857-9055-6199','sido_makmur_mojokerto@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(327,3,'customer',1,'General','Superior','Superior','','','Mojokerto','Jawa Timur','','Indonesia','0857-3519-0717 / 087','superior@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(328,3,'customer',1,'General','Winner','Winner','','','Mojokerto','Jawa Timur','','Indonesia','0813-3290-5662','winner@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(329,3,'customer',1,'General','3 Saudara','3 Saudara','','','Nganjuk','Jawa Timur','','Indonesia','0857-4820-4411','3_saudara@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(330,3,'customer',1,'General','Affan Pancing','Affan Pancing','','','Nganjuk','Jawa Timur','','Indonesia','0852-3135-6669','affan_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(331,3,'customer',1,'General','Charisma','Charisma','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','charisma@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(332,3,'customer',1,'General','Dolpin','Dolpin','','','Nganjuk','Jawa Timur','','Indonesia','0852-3100-8650','dolpin@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(333,3,'customer',1,'General','Gelora Nganjuk','Gelora Nganjuk','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','gelora_nganjuk@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(334,3,'customer',1,'General','Jawara Fishing','Jawara Fishing','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','jawara_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(335,3,'customer',1,'General','Mulur','Mulur','','','Nganjuk','Jawa Timur','','Indonesia','0813-3148-3098','mulur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(336,3,'customer',1,'General','Rayden','Rayden','','','Nganjuk','Jawa Timur','','Indonesia','085235567501','rayden@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(337,3,'customer',1,'General','Surya Abadi','Surya Abadi','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','surya_abadi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(338,3,'customer',1,'General','Sutra Pancing','Sutra Pancing','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','sutra_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(339,3,'customer',1,'General','Terminal Pancing','Terminal Pancing','','','Nganjuk','Jawa Timur','','Indonesia','087812300098','terminal_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(340,3,'customer',1,'General','Pondok Bringin','Pondok Bringin','','','Ngawi','Jawa Timur','','Indonesia','087812300098','pondok_bringin@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(341,3,'customer',1,'General','Prima Jaya Sport','Prima Jaya Sport','','','Ngawi','Jawa Timur','','Indonesia','087812300098','prima_jaya_sport@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(342,3,'customer',1,'General','Roda Jaya Pro Fishing','Roda Jaya Pro Fishing','','','Ngawi','Jawa Timur','','Indonesia','082331612519','roda_jaya_pro_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(343,3,'customer',1,'General','Didik Pancing','Didik Pancing','','','Pacitan','Jawa Timur','','Indonesia','087812300098','didik_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(344,3,'customer',1,'General','DTK Pancing','DTK Pancing','','','Pacitan','Jawa Timur','','Indonesia','087812300098','dtk_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(345,3,'customer',1,'General','Iqfa Pacitan','Iqfa Pacitan','','','Pacitan','Jawa Timur','','Indonesia','081317917992','iqfa_pacitan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(346,3,'customer',1,'General','Jaring Mas','Jaring Mas','','','Pacitan','Jawa Timur','','Indonesia','087812300098','jaring_mas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(347,3,'customer',1,'General','Maestro','Maestro','','','Pacitan','Jawa Timur','','Indonesia','082132941949','maestro@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(348,3,'customer',1,'General','Sinar Laut','Sinar Laut','','','Pacitan','Jawa Timur','','Indonesia','087758168660','sinar_laut@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(349,3,'customer',1,'General','Friend Pancing','Friend Pancing','','','Pamekasan','Jawa Timur','','Indonesia','087812300098','friend_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(350,3,'customer',1,'General','HR Pancing','HR Pancing','','','Pamekasan','Jawa Timur','','Indonesia','087812300098','hr_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(351,3,'customer',1,'General','Agung Pancing','Agung Pancing','','','Pasuruan','Jawa Timur','','Indonesia','0813-3167-5443','agung_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(352,3,'customer',1,'General','Makmur','Makmur','','','Pasuruan','Jawa Timur','','Indonesia','087812300098','makmur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(353,3,'customer',1,'General','Raya Pancing','Raya Pancing','','','Pasuruan','Jawa Timur','','Indonesia','0812-5900-7117','raya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(354,3,'customer',1,'General','Sumber Rejeki Pandaan','Sumber Rejeki Pandaan','','','Pasuruan','Jawa Timur','','Indonesia','0812-1655-8370','sumber_rejeki_pandaan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(355,3,'customer',1,'General','Sun','Sun','','','Pasuruan','Jawa Timur','','Indonesia','087812300098','sun@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(356,3,'customer',1,'General','Totok','Totok','','','Pasuruan','Jawa Timur','','Indonesia','081937099583','totok@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(357,3,'customer',1,'General','Al Fatihah Fishing','Al Fatihah Fishing','','','Ponorogo','Jawa Timur','','Indonesia','0821-4322-3022','al_fatihah_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(358,3,'customer',1,'General','Bruno Pancing','Bruno Pancing','','','Ponorogo','Jawa Timur','','Indonesia','0812-3599-9935','bruno_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(359,3,'customer',1,'General','Lentho','Lentho','','','Ponorogo','Jawa Timur','','Indonesia','0812-3874-4988','lentho@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(360,3,'customer',1,'General','Sumber Pancing Ponorogo','Sumber Pancing Ponorogo','','','Ponorogo','Jawa Timur','','Indonesia','0896-8287-1111','sumber_pancing_ponorogo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(361,3,'customer',1,'General','Sumber Rejeki Ponorogo','Sumber Rejeki Ponorogo','','','Ponorogo','Jawa Timur','','Indonesia','0812-3874-4988','sumber_rejeki_ponorogo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(362,3,'customer',1,'General','Hobby Probolinggo','Hobby Probolinggo','','','Probolinggo','Jawa Timur','','Indonesia','0821-4256-7279','hobby_probolinggo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(363,3,'customer',1,'General','Pancing Qu','Pancing Qu','','','Probolinggo','Jawa Timur','','Indonesia','0823-3879-6571','pancing_qu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(364,3,'customer',1,'General','Seger Fishing','Seger Fishing','','','Probolinggo','Jawa Timur','','Indonesia','087812300098','seger_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(365,3,'customer',1,'General','Tiga Dara','Tiga Dara','','','Pasuruan','Jawa Timur','','Indonesia','087812300098','tiga_dara@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(366,3,'customer',1,'General','Perdana Fishing','Perdana Fishing','','','Sampang','Jawa Timur','','Indonesia','0852-0377-1955','perdana_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(367,3,'customer',1,'General','Sentosa','Sentosa','','','Sampang','Jawa Timur','','Indonesia','087812300098','sentosa@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(368,3,'customer',1,'General','Adi Jaya','Adi Jaya','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','adi_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(369,3,'customer',1,'General','Alvin Strike Fishing','Alvin Strike Fishing','','','Sidoarjo','Jawa Timur','','Indonesia','0857-3664-5888','alvin_strike_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(370,3,'customer',1,'General','Annas','Annas','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','annas@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(371,3,'customer',1,'General','Bagus - Sales BSF','Bagus - Sales BSF','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','bagus_-_sales_bsf@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(372,3,'customer',1,'General','Bambang Rejo','Bambang Rejo','','','Sidoarjo','Jawa Timur','','Indonesia','0851-0883-3371','bambang_rejo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(373,3,'customer',1,'General','Barokah Sidoarjo','Barokah Sidoarjo','','','Sidoarjo','Jawa Timur','','Indonesia','0858-0697-7733','barokah_sidoarjo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(374,3,'customer',1,'General','Berkah Jaya','Berkah Jaya','','','Sidoarjo','Jawa Timur','','Indonesia','0838-3235-9168','berkah_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(375,3,'customer',1,'General','Bintang Rejo','Bintang Rejo','','','Sidoarjo','Jawa Timur','','Indonesia','(031) 8053637','bintang_rejo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(376,3,'customer',1,'General','Bsf Pancing','Bsf Pancing','','','Sidoarjo','Jawa Timur','','Indonesia','(031) 8911930','bsf_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(377,3,'customer',1,'General','DARJO PANCING','DARJO PANCING','','','Sidoarjo','Jawa Timur','','Indonesia','085857O68627','darjo_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(378,3,'customer',1,'General','Delta Pancing','Delta Pancing','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','delta_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(379,3,'customer',1,'General','Delta Tama','Delta Tama','','','Sidoarjo','Jawa Timur','','Indonesia','0819-9798-9996','delta_tama@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(380,3,'customer',1,'General','Happy Fishing','Happy Fishing','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','happy_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(381,3,'customer',1,'General','Irwan Hermana','Irwan Hermana','','','Sidoarjo','Jawa Timur','','Indonesia','0813-1434-9007','irwan_hermana@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(382,3,'customer',1,'General','Krembangan','Krembangan','','','Sidoarjo','Jawa Timur','','Indonesia','0813-1383-5629','krembangan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(383,3,'customer',1,'General','Pradana','Pradana','','','Sidoarjo','Jawa Timur','','Indonesia','0813-2968-9766','pradana@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(384,3,'customer',1,'General','RC Fishing','RC Fishing','','','Sidoarjo','Jawa Timur','','Indonesia','087812300098','rc_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(385,3,'customer',1,'General','Sahabat Pancing','Sahabat Pancing','','','Sidoarjo','Jawa Timur','','Indonesia','0857-4872-1489','sahabat_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(386,3,'customer',1,'General','Solo Pancing','Solo Pancing','','','Sidoarjo','Jawa Timur','','Indonesia','0822-2883-2898','solo_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(387,3,'customer',1,'General','Ases Gace\'an','Ases Gace\'an','','','Situbondo','Jawa Timur','','Indonesia','087812300098','ases_gace\'an@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(388,3,'customer',1,'General','Edison','Edison','','','Situbondo','Jawa Timur','','Indonesia','0899-0553-262','edison@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(389,3,'customer',1,'General','Istana Pancing Situbondo','Istana Pancing Situbondo','','','Situbondo','Jawa Timur','','Indonesia','0823-3095-6888','istana_pancing_situbondo@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(390,3,'customer',1,'General','Pak Siswanto','Pak Siswanto','','','Situbondo','Jawa Timur','','Indonesia','087812300098','pak_siswanto@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(391,3,'customer',1,'General','TNT FISHING','TNT FISHING','','','Situbondo','Jawa Timur','','Indonesia','0813-9199-9944','tnt_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(392,3,'customer',1,'General','Hikmah Fishing','Hikmah Fishing','','','Sumenep','Jawa Timur','','Indonesia','0823-3020-0053','hikmah_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(393,3,'customer',1,'General','Popeye Fishing','Popeye Fishing','','','Sumenep','Jawa Timur','','Indonesia','0812-3327-8995','popeye_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(394,3,'customer',1,'General','Pak Poen','Pak Poen','','','Surabaya','Jawa Timur','','Indonesia','081938083717','pak_poen@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(395,3,'customer',1,'General','Pondok Pancing','Pondok Pancing','','','Surabaya','Jawa Timur','','Indonesia','(031) 71512191','pondok_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(396,3,'customer',1,'General','Sauri Jaya','Sauri Jaya','','','Surabaya','Jawa Timur','','Indonesia','0896-4482-6092','sauri_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(397,3,'customer',1,'General','Alif','Alif','','','Trenggalek','Jawa Timur','','Indonesia','0823-3162-5823','alif@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(398,3,'customer',1,'General','Eka Fishing','Eka Fishing','','','Trenggalek','Jawa Timur','','Indonesia','087812300098','eka_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(399,3,'customer',1,'General','Gandusari','Gandusari','','','Trenggalek','Jawa Timur','','Indonesia','087812300098','gandusari@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(400,3,'customer',1,'General','Kawitan','Kawitan','','','Trenggalek','Jawa Timur','','Indonesia','0812-1675-8871','kawitan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(401,3,'customer',1,'General','Lina Jaya','Lina Jaya','','','Trenggalek','Jawa Timur','','Indonesia','087812300098','lina_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(402,3,'customer',1,'General','ML Pancing','ML Pancing','','','Trenggalek','Jawa Timur','','Indonesia','087812300098','ml_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(403,3,'customer',1,'General','Monica Pancing','Monica Pancing','','','Trenggalek','Jawa Timur','','Indonesia','0822-4550-5969','monica_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(404,3,'customer',1,'General','Sepur','Sepur','','','Trenggalek','Jawa Timur','','Indonesia','0813-3366-6223','sepur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(405,3,'customer',1,'General','Star Sea','Star Sea','','','Trenggalek','Jawa Timur','','Indonesia','087812300098','star_sea@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(406,3,'customer',1,'General','Anang Pancing','Anang Pancing','','','Tuban','Jawa Timur','','Indonesia','0856-4867-8885','anang_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(407,3,'customer',1,'General','Indo Fishing','Indo Fishing','','','Tuban','Jawa Timur','','Indonesia','0852-5622-7307','indo_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(408,3,'customer',1,'General','Laksana Jaya','Laksana Jaya','','','Tuban','Jawa Timur','','Indonesia','0856-3213-368','laksana_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(409,3,'customer',1,'General','Mahkota Laut','Mahkota Laut','','','Tuban','Jawa Timur','','Indonesia','0896-4766-3226','mahkota_laut@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(410,3,'customer',1,'General','Nur Pancing','Nur Pancing','','','Tuban','Jawa Timur','','Indonesia','087812300098','nur_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(411,3,'customer',1,'General','ACC Pancing','ACC Pancing','','','Tulungagung','Jawa Timur','','Indonesia','0858-5070-1442','acc_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(412,3,'customer',1,'General','Bendil','Bendil','','','Tulungagung','Jawa Timur','','Indonesia','0852-3017-9410','bendil@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(413,3,'customer',1,'General','Dory Strike','Dory Strike','','','Tulungagung','Jawa Timur','','Indonesia','0812-1607-2243','dory_strike@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(414,3,'customer',1,'General','Gomoh Fishing','Gomoh Fishing','','','Tulungagung','Jawa Timur','','Indonesia','0812-5962-8619','gomoh_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(415,3,'customer',1,'General','Hobi Tulungagung','Hobi Tulungagung','','','Tulungagung','Jawa Timur','','Indonesia','0812-3432-353','hobi_tulungagung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(416,3,'customer',1,'General','Kusnan','Kusnan','','','Tulungagung','Jawa Timur','','Indonesia','0857-5536-2077','kusnan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(417,3,'customer',1,'General','Mbah Jenggot','Mbah Jenggot','','','Tulungagung','Jawa Timur','','Indonesia','087812300098','mbah_jenggot@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(418,3,'customer',1,'General','Mekarsari Haub','Mekarsari Haub','','','Tulungagung','Jawa Timur','','Indonesia','087812300098','mekarsari_haub@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(419,3,'customer',1,'General','Mitra Pancing','Mitra Pancing','','','Tulungagung','Jawa Timur','','Indonesia','0812-5128-6473','mitra_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(420,3,'customer',1,'General','Nikimura Pancing','Nikimura Pancing','','','Tulungagung','Jawa Timur','','Indonesia','0821-3231-7398','nikimura_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(421,3,'customer',1,'General','Rahmat Tulungagung','Rahmat Tulungagung','','','Tulungagung','Jawa Timur','','Indonesia','081335361992','rahmat_tulungagung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(422,3,'customer',1,'General','Rio Tulungagung','Rio Tulungagung','','','Tulungagung','Jawa Timur','','Indonesia','087812300098','rio_tulungagung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(423,3,'customer',1,'General','Salon Endri','Salon Endri','','','Tulungagung','Jawa Timur','','Indonesia','0859-1717-18601','salon_endri@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(424,3,'customer',1,'General','Sembung','Sembung','','','Tulungagung','Jawa Timur','','Indonesia','0812-5286-5959','sembung@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(425,3,'customer',1,'General','Sumber Makmur','Sumber Makmur','','','Tulungagung','Jawa Timur','','Indonesia','0857-0857-0857','sumber_makmur@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(426,3,'customer',1,'General','Makmur Pancing','Makmur Pancing','','','Palangkaraya','Kalimantan Tengah','','Indonesia','081346258723','makmur_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(427,3,'customer',1,'General','Naga Fishing','Naga Fishing','','','-','Kota belum terdaftar','','Indonesia','087812300098','naga_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(428,3,'customer',1,'General','Dedy Pancing','Dedy Pancing','','','Jember','Jawa Timur','','Indonesia','087812300098','dedy_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(429,3,'customer',1,'General','Sunyo Hanter','Sunyo Hanter','','','Jember','Jawa Timur','','Indonesia','087812300098','sunyo_hanter@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(430,3,'customer',1,'General','Delta Jaya','Delta Jaya','','','Lombok','NTB','','Indonesia','0813-3955-9455','delta_jaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(431,3,'customer',1,'General','Pusaka Pancing','Pusaka Pancing','','','Lombok Timur','NTB','','Indonesia','0818-0577-4777','pusaka_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(432,3,'customer',1,'General','Sejahtera Pancing','Sejahtera Pancing','','','Sumbawa','NTB','','Indonesia','0823-3967-7677','sejahtera_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(433,3,'customer',1,'General','Galeri Pancing (Mak Endah)','Galeri Pancing (Mak Endah)','','','Bukittinggi','Sumatera Barat','','Indonesia','0813-6304-2604','galeri_pancing_(mak_endah)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(434,3,'customer',1,'General','Dunia Pancing - Bantul','Dunia Pancing - Bantul','','','Bantul','DIY','','Indonesia','0878-3880-0537','dunia_pancing_-_bantul@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(435,3,'customer',1,'General','Mamat Pajangan','Mamat Pajangan','','','Bantul','DIY','','Indonesia','081326019078','mamat_pajangan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(436,3,'customer',1,'General','Muara Selatan','Muara Selatan','','','Bantul','DIY','','Indonesia','0813-9208-7160','muara_selatan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(437,3,'customer',1,'General','Surya Fishing - Bantul','Surya Fishing - Bantul','','','Bantul','DIY','','Indonesia','0896-4874-3093','surya_fishing_-_bantul@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(438,3,'customer',1,'General','Serang Pancing','Serang Pancing','','','Kulon Progo','DIY','','Indonesia','081228601475','serang_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(439,3,'customer',1,'General','ASPS Heri','ASPS Heri','','','Sleman','DIY','','Indonesia','0899-4138-557','asps_heri@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(440,3,'customer',1,'General','Hemlock Fishing','Hemlock Fishing','','','Sleman','DIY','','Indonesia','0811-285-768','hemlock_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(441,3,'customer',1,'General','Jaya Fishing','Jaya Fishing','','','Sleman','DIY','','Indonesia','0813-2880-5323/ 0813','jaya_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(442,3,'customer',1,'General','Wasiyo Jogja','Wasiyo Jogja','','','Sleman','DIY','','Indonesia','087812300098','wasiyo_jogja@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(443,3,'customer',1,'General','Alat Pancing','Alat Pancing','','','Yogyakarta','DIY','','Indonesia','087812300098','alat_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(444,3,'customer',1,'General','Basoru','Basoru','','','Yogyakarta','DIY','','Indonesia','087812300098','basoru@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(445,3,'customer',1,'General','Duayu','Duayu','','','Yogyakarta','DIY','','Indonesia','0813-9216-7777','duayu@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(446,3,'customer',1,'General','Nando Pancing','Nando Pancing','','','Yogyakarta','DIY','','Indonesia','0815-4810-7987','nando_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(447,3,'customer',1,'General','Nusantara Fishing','Nusantara Fishing','','','Yogyakarta','DIY','','Indonesia','0821-3563-0813','nusantara_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(448,3,'customer',1,'General','Pringgolayan','Pringgolayan','','','Yogyakarta','DIY','','Indonesia','0815-7901-899','pringgolayan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(449,3,'customer',1,'General','Satria','Satria','','','Yogyakarta','DIY','','Indonesia','(0274) 513190','satria@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(450,3,'customer',1,'General','Laskar Pancing - Surabaya','Laskar Pancing - Surabaya','','','Surabaya','Jawa Timur','','Indonesia','087812300098','laskar_pancing_-_surabaya@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(451,3,'customer',1,'General','Imam','Imam','','','Malang','Jawa Timur','','Indonesia','087812300098','imam@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(452,3,'customer',1,'General','Griya Pancing','Griya Pancing','','','Lumajang','Jawa Timur','','Indonesia','087812300098','griya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(453,3,'customer',1,'General','Toko Pancing Lumajang','Toko Pancing Lumajang','','','Lumajang','Jawa Timur','','Indonesia','0878-5650-3887','toko_pancing_lumajang@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(454,3,'customer',1,'General','Hylmi Fishing','Hylmi Fishing','','','Probolinggo','Jawa Timur','','Indonesia','0822-3374-0707','hylmi_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(455,3,'customer',1,'General','Angga Novendra','Angga Novendra','','','Malang','Jawa Timur','','Indonesia','0821-4416-6570','angga_novendra@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(456,3,'customer',1,'General','Lestari (Kios Pancing)','Lestari (Kios Pancing)','','','Gresik','Jawa Timur','','Indonesia','0857-4821-4711','lestari_(kios_pancing)@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(457,3,'customer',1,'General','AYU Pancing','AYU Pancing','','','Klaten','Jawa Tengah','','Indonesia','0858-7812-9615','ayu_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(458,3,'customer',1,'General','Wenz','Wenz','','','Kalimantan Selatan','Kalimantan Selatan','','Indonesia','0895-3879-18852','wenz@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(459,3,'customer',1,'General','Apnan','Apnan','','','Pemalang','Jawa Tengah','','Indonesia','0859-4203-8708','apnan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(460,3,'customer',1,'General','Rukiwan','Rukiwan','','','Bajawa','NTT','','Indonesia','0878-5054-4899','rukiwan@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(461,3,'customer',1,'General','Banyoe Biroe','Banyoe Biroe','','','Malang','Jawa Timur','','Indonesia','0822-3298-3193','banyoe_biroe@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(462,3,'customer',1,'General','BASMALLAHcell','BASMALLAHcell','','','Jember','Jawa Timur','','Indonesia','0823-3103-0405','basmallahcell@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(463,3,'customer',1,'General','Mbah Lim','Mbah Lim','','','Pasuruan','Jawa Timur','','Indonesia','0812-1773-5564','mbah_lim@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(464,3,'customer',1,'General','Budi Sutanto','Budi Sutanto','','','Jember','Jawa Timur','','Indonesia','0821-4375-7649','budi_sutanto@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(465,3,'customer',1,'General','Sarana Pancing','Sarana Pancing','','','Cirebon','Jawa Barat','','Indonesia','0851-7439-3752','sarana_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(466,3,'customer',1,'General','Adam Seiko','Adam Seiko','','','Malang','Jawa Timur','','Indonesia','087812300098','adam_seiko@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(467,3,'customer',1,'General','Slamet Pancing','Slamet Pancing','','','Malang','Jawa Timur','','Indonesia','0857-0771-6422','slamet_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(468,3,'customer',1,'General','We\"jaya Pancing','We\"jaya Pancing','','','Lombok','NTB','','Indonesia','0878-4615-5911','we\"jaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(469,3,'customer',1,'General','Kartini Fishing','Kartini Fishing','','','Semarang','Jawa Tengah','','Indonesia','0812-2872-8280','kartini_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(470,3,'customer',1,'General','Milijaya Pancing','Milijaya Pancing','','','Sidoarjo','Jawa Timur','','Indonesia','0813-3620-4004','milijaya_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(471,3,'customer',1,'General','Dunia Pancing - Banyuwangi','Dunia Pancing - Banyuwangi','','','Banyuwangi','Jawa Timur','','Indonesia','082257570327','dunia_pancing_-_banyuwangi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(472,3,'customer',1,'General','Ongki Pancing','Ongki Pancing','','','Malang','Jawa Timur','','Indonesia','08813120122','ongki_pancing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(473,3,'customer',1,'General','Istana Pancing Banyuwangi','Istana Pancing Banyuwangi','','','Banyuwangi','Jawa Timur','','Indonesia','081233550845','istana_pancing_banyuwangi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(474,3,'customer',1,'General','Alfa Banyuwangi','Alfa Banyuwangi','','','Banyuwangi','Jawa Timur','','Indonesia','81230465251','alfa_banyuwangi@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(475,3,'customer',1,'General','Retail','Retail','','','Batu','Jawa Timur','','Indonesia','087812300098','retail@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(476,3,'customer',1,'General','Baradel','Baradel','','','Batu','Jawa Timur','','Indonesia','85720670524','baradel@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(477,3,'customer',1,'General','NK Fishing','NK Fishing','','','Garut','Jawa Barat','','Indonesia','0813-9523-1573','nk_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(478,3,'customer',1,'General','Tunggal Putra','Tunggal Putra','','','Malang','Jawa Timur','','Indonesia','0823-3126-5689','tunggal_putra@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(479,3,'customer',1,'General','Putra Mawar','Putra Mawar','','','Magelang','Jawa Tengah','','Indonesia','0813-9332-1112','putra_mawar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(480,3,'customer',1,'General','Mbrum Fishing','Mbrum Fishing','','','Sleman','DIY','','Indonesia','0819-0880-5558','mbrum_fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(481,3,'customer',1,'General','Lancar','Lancar','','','Magelang','Jawa Tengah','','Indonesia','0856-2888-397','lancar@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(482,3,'customer',1,'General','Aruna Aquatic','Aruna Aquatic','','','Tulungagung','Jawa Timur','','Indonesia','0895-2681-3943','aruna_aquatic@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(483,3,'customer',1,'General','Elstore_id1','Elstore_id1','','','Sidoarjo','Jawa Timur','','Indonesia','082286003900','elstore_id1@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(484,3,'customer',1,'General','Mitra Pancing Jember','Mitra Pancing Jember','','','Jember','Jawa Timur','','Indonesia','081233550845','mitra_pancing_jember@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(485,3,'customer',1,'General','Bapak Amin','Bapak Amin','','','Jakarta Utara','Kota belum terdaftar','','Indonesia','0813 8021 1111','bapak_amin@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,''),
(486,3,'customer',1,'General','R. A. Z. Fishing','R. A. Z. Fishing','','','Madiun','Jawa Timur','','Indonesia','085646640191','r._a._z._fishing@gmail.com','','','','','','',NULL,0,'logo.png',0,NULL,NULL,NULL,'');

/*Table structure for table `sma_costing` */

DROP TABLE IF EXISTS `sma_costing`;

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_costing` */

insert  into `sma_costing`(`id`,`date`,`product_id`,`sale_item_id`,`sale_id`,`purchase_item_id`,`quantity`,`purchase_net_unit_cost`,`purchase_unit_cost`,`sale_net_unit_price`,`sale_unit_price`,`quantity_balance`,`inventory`,`overselling`,`option_id`,`purchase_id`,`transfer_id`) values 
(1,'2024-04-22',1,1,1,1,1.0000,10000.0000,10000.0000,20000.0000,20000.0000,99.0000,1,0,NULL,1,NULL),
(2,'2024-04-26',1,2,2,6,1.0000,10000.0000,10000.0000,20000.0000,20000.0000,5.0000,1,0,NULL,NULL,1),
(3,'2024-04-26',2,3,3,9,1.0000,10000.0000,10000.0000,20000.0000,20000.0000,0.0000,1,0,NULL,NULL,2);

/*Table structure for table `sma_currencies` */

DROP TABLE IF EXISTS `sma_currencies`;

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_currencies` */

insert  into `sma_currencies`(`id`,`code`,`name`,`rate`,`auto_update`,`symbol`) values 
(1,'IDR','Rupiah',1.0000,0,'Rp'),
(2,'CNY','YUAN',0.0005,0,'¥'),
(3,'USD','Dollar',15700.0000,0,'$');

/*Table structure for table `sma_customer_groups` */

DROP TABLE IF EXISTS `sma_customer_groups`;

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_customer_groups` */

insert  into `sma_customer_groups`(`id`,`name`,`percent`,`discount`) values 
(1,'General',0,NULL),
(2,'Reseller',-5,NULL),
(3,'Distributor',-15,NULL),
(4,'New Customer (+10)',10,NULL);

/*Table structure for table `sma_date_format` */

DROP TABLE IF EXISTS `sma_date_format`;

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_date_format` */

insert  into `sma_date_format`(`id`,`js`,`php`,`sql`) values 
(1,'mm-dd-yyyy','m-d-Y','%m-%d-%Y'),
(2,'mm/dd/yyyy','m/d/Y','%m/%d/%Y'),
(3,'mm.dd.yyyy','m.d.Y','%m.%d.%Y'),
(4,'dd-mm-yyyy','d-m-Y','%d-%m-%Y'),
(5,'dd/mm/yyyy','d/m/Y','%d/%m/%Y'),
(6,'dd.mm.yyyy','d.m.Y','%d.%m.%Y');

/*Table structure for table `sma_deliveries` */

DROP TABLE IF EXISTS `sma_deliveries`;

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_deliveries` */

/*Table structure for table `sma_deposits` */

DROP TABLE IF EXISTS `sma_deposits`;

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_deposits` */

/*Table structure for table `sma_expense_categories` */

DROP TABLE IF EXISTS `sma_expense_categories`;

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_expense_categories` */

/*Table structure for table `sma_expenses` */

DROP TABLE IF EXISTS `sma_expenses`;

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_expenses` */

/*Table structure for table `sma_gift_card_topups` */

DROP TABLE IF EXISTS `sma_gift_card_topups`;

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_gift_card_topups` */

/*Table structure for table `sma_gift_cards` */

DROP TABLE IF EXISTS `sma_gift_cards`;

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_gift_cards` */

/*Table structure for table `sma_groups` */

DROP TABLE IF EXISTS `sma_groups`;

CREATE TABLE `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_groups` */

insert  into `sma_groups`(`id`,`name`,`description`) values 
(1,'owner','Owner'),
(2,'admin','Administrator'),
(3,'customer','Customer'),
(4,'supplier','Supplier'),
(5,'sales','Sales Staff'),
(6,'gudang','Gudang'),
(7,'purchasing','Bagian Purchasing');

/*Table structure for table `sma_login_attempts` */

DROP TABLE IF EXISTS `sma_login_attempts`;

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_login_attempts` */

/*Table structure for table `sma_logs` */

DROP TABLE IF EXISTS `sma_logs`;

CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(190) NOT NULL,
  `model` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_logs` */

insert  into `sma_logs`(`id`,`detail`,`model`,`date`) values 
(1,'Purchase is being deleted by gangsar (User Id: 2)','{\"model\":{\"id\":\"3\",\"reference_no\":\"PO2024\\/04\\/0003\",\"date\":\"2024-04-26 14:51:00\",\"supplier_id\":\"5\",\"supplier\":\"China\",\"warehouse_id\":\"2\",\"note\":\"\",\"total\":\"10000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"order_discount\":\"0.0000\",\"total_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"10000.0000\",\"paid\":\"0.0000\",\"status\":\"received\",\"payment_status\":\"pending\",\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"attachment\":null,\"payment_term\":\"0\",\"due_date\":null,\"return_id\":null,\"surcharge\":\"0.0000\",\"return_purchase_ref\":null,\"purchase_id\":null,\"return_purchase_total\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"10\",\"purchase_id\":\"3\",\"transfer_id\":null,\"product_id\":\"2\",\"product_code\":\"TBUT003\",\"product_name\":\"Produk Gangsar Makmur Jaya\",\"option_id\":null,\"net_unit_cost\":\"10000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"expiry\":null,\"subtotal\":\"10000.0000\",\"quantity_balance\":\"1.0000\",\"date\":\"2024-04-26\",\"status\":\"received\",\"unit_cost\":\"10000.0000\",\"real_unit_cost\":\"10000.0000\",\"quantity_received\":\"1.0000\",\"supplier_part_no\":null,\"purchase_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"base_unit_cost\":\"10000.0000\"}]}','2024-04-26 14:52:02');

/*Table structure for table `sma_migrations` */

DROP TABLE IF EXISTS `sma_migrations`;

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_migrations` */

insert  into `sma_migrations`(`version`) values 
(315);

/*Table structure for table `sma_notifications` */

DROP TABLE IF EXISTS `sma_notifications`;

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_notifications` */

insert  into `sma_notifications`(`id`,`comment`,`date`,`from_date`,`till_date`,`scope`) values 
(1,'<p>Terimakasih sudah menggunakan stock manager ini, jika menemukan bug atau permintaan spec bisa email ke christianus.lusi@gmail.com</p>','2014-08-15 06:00:57','2015-01-01 00:00:00','2017-01-01 00:00:00',3);

/*Table structure for table `sma_order_ref` */

DROP TABLE IF EXISTS `sma_order_ref`;

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_order_ref` */

insert  into `sma_order_ref`(`ref_id`,`date`,`so`,`qu`,`po`,`to`,`pos`,`do`,`pay`,`re`,`rep`,`ex`,`ppay`,`qa`) values 
(1,'2015-03-01',2,1,7,5,3,1,3,1,1,1,6,1);

/*Table structure for table `sma_pages` */

DROP TABLE IF EXISTS `sma_pages`;

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_pages` */

/*Table structure for table `sma_payments` */

DROP TABLE IF EXISTS `sma_payments`;

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_payments` */

insert  into `sma_payments`(`id`,`date`,`sale_id`,`return_id`,`purchase_id`,`reference_no`,`transaction_id`,`paid_by`,`cheque_no`,`cc_no`,`cc_holder`,`cc_month`,`cc_year`,`cc_type`,`amount`,`currency`,`created_by`,`attachment`,`type`,`note`,`pos_paid`,`pos_balance`,`approval_code`) values 
(1,'2024-04-22 12:37:00',NULL,NULL,1,'POP2024/04/0001',NULL,'cash','','','','','','Visa',1000000.0000,NULL,2,NULL,'sent','',0.0000,0.0000,NULL),
(2,'2024-04-22 13:00:06',1,NULL,NULL,'IPAY2024/04/0001',NULL,'cash','','','','','','',20000.0000,NULL,2,NULL,'received','',20000.0000,0.0000,NULL),
(3,'2024-04-22 15:51:00',NULL,NULL,2,'POP2024/04/0002',NULL,'cash','','','','','','Visa',100000.0000,NULL,2,NULL,'sent','',0.0000,0.0000,NULL),
(4,'2024-04-22 15:53:00',NULL,NULL,2,'POP2024/04/0003',NULL,'cash','','','','','','Visa',1000000.0000,NULL,2,NULL,'sent','',0.0000,0.0000,NULL),
(5,'2024-04-26 18:40:28',2,NULL,NULL,'IPAY2024/04/0002',NULL,'cash','','','','','','',20000.0000,NULL,2,NULL,'received','',20000.0000,0.0000,NULL),
(6,'2024-04-26 20:35:00',NULL,NULL,16,'POP2024/04/0004',NULL,'cash','','','','','','Visa',5000.0000,NULL,2,NULL,'sent','',0.0000,0.0000,NULL),
(7,'2024-04-26 20:35:00',NULL,NULL,16,'POP2024/04/0005',NULL,'cash','','','','','','Visa',65000.0000,NULL,2,NULL,'sent','',0.0000,0.0000,NULL);

/*Table structure for table `sma_paypal` */

DROP TABLE IF EXISTS `sma_paypal`;

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_paypal` */

insert  into `sma_paypal`(`id`,`active`,`account_email`,`paypal_currency`,`fixed_charges`,`extra_charges_my`,`extra_charges_other`) values 
(1,1,'mypaypal@paypal.com','USD',0.0000,0.0000,0.0000);

/*Table structure for table `sma_permissions` */

DROP TABLE IF EXISTS `sma_permissions`;

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_permissions` */

insert  into `sma_permissions`(`id`,`group_id`,`products-index`,`products-add`,`products-edit`,`products-delete`,`products-cost`,`products-price`,`quotes-index`,`quotes-add`,`quotes-edit`,`quotes-pdf`,`quotes-email`,`quotes-delete`,`sales-index`,`sales-add`,`sales-edit`,`sales-pdf`,`sales-email`,`sales-delete`,`purchases-index`,`purchases-add`,`purchases-edit`,`purchases-pdf`,`purchases-email`,`purchases-delete`,`transfers-index`,`transfers-add`,`transfers-edit`,`transfers-pdf`,`transfers-email`,`transfers-delete`,`customers-index`,`customers-add`,`customers-edit`,`customers-delete`,`suppliers-index`,`suppliers-add`,`suppliers-edit`,`suppliers-delete`,`sales-deliveries`,`sales-add_delivery`,`sales-edit_delivery`,`sales-delete_delivery`,`sales-email_delivery`,`sales-pdf_delivery`,`sales-gift_cards`,`sales-add_gift_card`,`sales-edit_gift_card`,`sales-delete_gift_card`,`pos-index`,`sales-return_sales`,`reports-index`,`reports-warehouse_stock`,`reports-quantity_alerts`,`reports-expiry_alerts`,`reports-products`,`reports-daily_sales`,`reports-monthly_sales`,`reports-sales`,`reports-payments`,`reports-purchases`,`reports-profit_loss`,`reports-customers`,`reports-suppliers`,`reports-staff`,`reports-register`,`sales-payments`,`purchases-payments`,`purchases-expenses`,`products-adjustments`,`bulk_actions`,`customers-deposits`,`customers-delete_deposit`,`products-barcode`,`purchases-return_purchases`,`reports-expenses`,`reports-daily_purchases`,`reports-monthly_purchases`,`products-stock_count`,`edit_price`,`returns-index`,`returns-add`,`returns-edit`,`returns-delete`,`returns-email`,`returns-pdf`,`reports-tax`) values 
(1,5,1,0,0,0,0,0,1,1,1,1,1,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
(2,6,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,0,NULL,NULL,NULL,1,1,0,0,1,0,0,1,1,1,NULL,1,1,1,1,NULL,1,NULL),
(3,7,1,1,1,1,1,1,1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,1,1,1,1,1,1,0,1,1,1,0,NULL,1,1,1,0,1,1,1,1,1,1,1,1,NULL,1,1,1,1,1,1,1);

/*Table structure for table `sma_pos_register` */

DROP TABLE IF EXISTS `sma_pos_register`;

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_pos_register` */

insert  into `sma_pos_register`(`id`,`date`,`user_id`,`cash_in_hand`,`status`,`total_cash`,`total_cheques`,`total_cc_slips`,`total_cash_submitted`,`total_cheques_submitted`,`total_cc_slips_submitted`,`note`,`closed_at`,`transfer_opened_bills`,`closed_by`) values 
(1,'2024-04-22 12:54:25',2,10000000.0000,'open',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'2024-04-23 04:25:03',5,100000.0000,'open',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_pos_settings` */

DROP TABLE IF EXISTS `sma_pos_settings`;

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.47',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_pos_settings` */

insert  into `sma_pos_settings`(`pos_id`,`cat_limit`,`pro_limit`,`default_category`,`default_customer`,`default_biller`,`display_time`,`cf_title1`,`cf_title2`,`cf_value1`,`cf_value2`,`receipt_printer`,`cash_drawer_codes`,`focus_add_item`,`add_manual_product`,`customer_selection`,`add_customer`,`toggle_category_slider`,`toggle_subcategory_slider`,`cancel_sale`,`suspend_sale`,`print_items_list`,`finalize_sale`,`today_sale`,`open_hold_bills`,`close_register`,`keyboard`,`pos_printers`,`java_applet`,`product_button_color`,`tooltips`,`paypal_pro`,`stripe`,`rounding`,`char_per_line`,`pin_code`,`purchase_code`,`envato_username`,`version`,`after_sale_page`,`item_order`,`authorize`,`toggle_brands_slider`,`remote_printing`,`printer`,`order_printers`,`auto_print`,`customer_details`,`local_printers`) values 
(1,22,20,1,1,3,'1','GST Reg','VAT Reg','123456789','987654321','BIXOLON SRP-350II','x1C','Ctrl+F3','Ctrl+Shift+M','Ctrl+Shift+C','Ctrl+Shift+A','Ctrl+F11','Ctrl+F12','F4','F7','F9','F8','Ctrl+F1','Ctrl+F2','Ctrl+F10',1,'BIXOLON SRP-350II, BIXOLON SRP-350II',0,'default',1,0,0,0,42,NULL,'purchase_code','envato_username','3.4.47',0,0,0,NULL,1,NULL,NULL,0,NULL,NULL);

/*Table structure for table `sma_price_groups` */

DROP TABLE IF EXISTS `sma_price_groups`;

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_price_groups` */

insert  into `sma_price_groups`(`id`,`name`) values 
(1,'Default');

/*Table structure for table `sma_printers` */

DROP TABLE IF EXISTS `sma_printers`;

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_printers` */

/*Table structure for table `sma_product_photos` */

DROP TABLE IF EXISTS `sma_product_photos`;

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_product_photos` */

/*Table structure for table `sma_product_prices` */

DROP TABLE IF EXISTS `sma_product_prices`;

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_product_prices` */

/*Table structure for table `sma_product_variants` */

DROP TABLE IF EXISTS `sma_product_variants`;

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_id_name` (`product_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_product_variants` */

/*Table structure for table `sma_products` */

DROP TABLE IF EXISTS `sma_products`;

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0,
  `business_location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_products` */

insert  into `sma_products`(`id`,`code`,`name`,`unit`,`cost`,`price`,`alert_quantity`,`image`,`category_id`,`subcategory_id`,`cf1`,`cf2`,`cf3`,`cf4`,`cf5`,`cf6`,`quantity`,`tax_rate`,`track_quantity`,`details`,`warehouse`,`barcode_symbology`,`file`,`product_details`,`tax_method`,`type`,`supplier1`,`supplier1price`,`supplier2`,`supplier2price`,`supplier3`,`supplier3price`,`supplier4`,`supplier4price`,`supplier5`,`supplier5price`,`promotion`,`promo_price`,`start_date`,`end_date`,`supplier1_part_no`,`supplier2_part_no`,`supplier3_part_no`,`supplier4_part_no`,`supplier5_part_no`,`sale_unit`,`purchase_unit`,`brand`,`slug`,`featured`,`weight`,`hsn_code`,`views`,`hide`,`second_name`,`hide_pos`,`business_location`) values 
(1,'TBUT001','Produk Gangsar Makmur',1,10000.0000,20000.0000,5.0000,'no_image.png',1,NULL,'','','','','','',105.0000,1,1,'',NULL,'code128','','',0,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'produk-gangsar-makmur',NULL,1.0000,NULL,0,0,'',0,1),
(2,'TBUT003','Produk Gangsar Makmur Jaya',1,10000.0000,20000.0000,0.0000,'no_image.png',1,NULL,'','','','','','',54.0000,1,1,'',NULL,'code128','','',1,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'produk-gangsar-makmur-jaya',NULL,0.0000,NULL,0,0,'',0,2),
(3,'TBUT004','Produk Gangsar Jaya',1,10000.0000,20000.0000,6.0000,'no_image.png',1,16,'','','','','','',60.0000,1,1,'',NULL,'code128','','',1,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'produk-gangsar-makmur-jaya',NULL,1.0000,NULL,0,0,'',0,1),
(4,'TBUT005','Produk Gangsar Makmur 2',1,10000.0000,20000.0000,5.0000,'no_image.png',1,NULL,'','','','','','',0.0000,3,1,'',NULL,'code128','','',0,'standard',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,1,1,0,'produk-gangsar-makmur-2',NULL,0.0000,NULL,0,0,'',0,3);

/*Table structure for table `sma_promos` */

DROP TABLE IF EXISTS `sma_promos`;

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_promos` */

/*Table structure for table `sma_purchase_items` */

DROP TABLE IF EXISTS `sma_purchase_items`;

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL,
  `business_location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_purchase_items` */

insert  into `sma_purchase_items`(`id`,`purchase_id`,`transfer_id`,`product_id`,`product_code`,`product_name`,`option_id`,`net_unit_cost`,`quantity`,`warehouse_id`,`item_tax`,`tax_rate_id`,`tax`,`discount`,`item_discount`,`expiry`,`subtotal`,`quantity_balance`,`date`,`status`,`unit_cost`,`real_unit_cost`,`quantity_received`,`supplier_part_no`,`purchase_item_id`,`product_unit_id`,`product_unit_code`,`unit_quantity`,`gst`,`cgst`,`sgst`,`igst`,`base_unit_cost`,`business_location`) values 
(1,1,NULL,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,100.0000,4,0.0000,1,'0','0',0.0000,NULL,1000000.0000,81.0000,'2024-04-22','received',10000.0000,10000.0000,100.0000,NULL,NULL,1,'pcs',100.0000,NULL,NULL,NULL,NULL,10000.0000,NULL),
(4,2,NULL,3,'TBUT004','Produk Gangsar Jaya',NULL,10000.0000,60.0000,4,0.0000,1,'0','0',0.0000,NULL,600000.0000,50.0000,'2024-04-22','received',10000.0000,10000.0000,60.0000,NULL,NULL,1,'pcs',60.0000,NULL,NULL,NULL,NULL,10000.0000,NULL),
(5,2,NULL,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,50.0000,4,0.0000,1,'0','0',0.0000,NULL,500000.0000,47.0000,'2024-04-22','received',10000.0000,10000.0000,50.0000,NULL,NULL,1,'pcs',50.0000,NULL,NULL,NULL,NULL,10000.0000,NULL),
(6,NULL,1,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,6.0000,5,0.0000,1,'0',NULL,NULL,NULL,60000.0000,5.0000,'2024-04-22','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',6.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(7,NULL,2,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,10.0000,5,0.0000,1,'0',NULL,NULL,NULL,100000.0000,10.0000,'2024-04-23','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',10.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(8,NULL,2,3,'TBUT004','Produk Gangsar Jaya',NULL,10000.0000,10.0000,5,0.0000,1,'0',NULL,NULL,NULL,100000.0000,10.0000,'2024-04-23','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',10.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(9,NULL,2,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,1.0000,5,0.0000,1,'0',NULL,NULL,NULL,10000.0000,0.0000,'2024-04-23','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(11,13,NULL,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,1.0000,4,0.0000,1,'0','0',0.0000,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,1.0000,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,10000.0000,NULL),
(12,13,NULL,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,3.0000,4,0.0000,1,'0','0',0.0000,NULL,30000.0000,3.0000,'2024-04-26','received',10000.0000,10000.0000,3.0000,NULL,NULL,1,'pcs',3.0000,NULL,NULL,NULL,NULL,10000.0000,NULL),
(13,15,NULL,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,1.0000,4,0.0000,1,'0','0',0.0000,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,1.0000,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,10000.0000,3),
(14,NULL,3,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,1.0000,5,0.0000,1,'0',NULL,NULL,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(15,NULL,3,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,1.0000,5,0.0000,1,'0',NULL,NULL,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(16,16,NULL,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,6.0000,4,0.0000,1,'0','0',0.0000,NULL,60000.0000,6.0000,'2024-04-26','received',10000.0000,10000.0000,6.0000,NULL,NULL,1,'pcs',6.0000,NULL,NULL,NULL,NULL,10000.0000,3),
(17,16,NULL,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,1.0000,4,0.0000,1,'0','0',0.0000,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,1.0000,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,10000.0000,3),
(18,NULL,4,1,'TBUT001','Produk Gangsar Makmur',NULL,10000.0000,1.0000,5,0.0000,1,'0',NULL,NULL,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL,NULL),
(19,NULL,4,2,'TBUT003','Produk Gangsar Makmur Jaya',NULL,10000.0000,1.0000,5,0.0000,1,'0',NULL,NULL,NULL,10000.0000,1.0000,'2024-04-26','received',10000.0000,10000.0000,NULL,NULL,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_purchases` */

DROP TABLE IF EXISTS `sma_purchases`;

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_purchases` */

insert  into `sma_purchases`(`id`,`reference_no`,`date`,`supplier_id`,`supplier`,`warehouse_id`,`note`,`total`,`product_discount`,`order_discount_id`,`order_discount`,`total_discount`,`product_tax`,`order_tax_id`,`order_tax`,`total_tax`,`shipping`,`grand_total`,`paid`,`status`,`payment_status`,`created_by`,`updated_by`,`updated_at`,`attachment`,`payment_term`,`due_date`,`return_id`,`surcharge`,`return_purchase_ref`,`purchase_id`,`return_purchase_total`,`cgst`,`sgst`,`igst`) values 
(1,'PO2024/04/0001','2024-04-22 12:34:00',5,'China',4,'',1000000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,1000000.0000,1000000.0000,'received','paid',2,NULL,NULL,NULL,0,NULL,NULL,0.0000,NULL,NULL,0.0000,NULL,NULL,NULL),
(2,'PO2024/04/0002','2024-04-22 15:50:00',5,'China',4,'',1100000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,1100000.0000,1100000.0000,'received','paid',2,2,'2024-04-22 15:51:46',NULL,0,NULL,NULL,0.0000,NULL,NULL,0.0000,NULL,NULL,NULL),
(13,'PO2024/04/0004','2024-04-26 17:25:00',5,'China',4,'',40000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,40000.0000,0.0000,'received','pending',2,NULL,NULL,NULL,0,NULL,NULL,0.0000,NULL,NULL,0.0000,NULL,NULL,NULL),
(15,'PO2024/04/0005','2024-04-26 17:33:00',5,'China',4,'',10000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,10000.0000,0.0000,'received','pending',2,NULL,NULL,NULL,0,NULL,NULL,0.0000,NULL,NULL,0.0000,NULL,NULL,NULL),
(16,'PO2024/04/0006','2024-04-26 20:33:00',5,'China',4,'',70000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,70000.0000,70000.0000,'received','paid',2,NULL,NULL,NULL,0,NULL,NULL,0.0000,NULL,NULL,0.0000,NULL,NULL,NULL);

/*Table structure for table `sma_quote_items` */

DROP TABLE IF EXISTS `sma_quote_items`;

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_quote_items` */

/*Table structure for table `sma_quotes` */

DROP TABLE IF EXISTS `sma_quotes`;

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_quotes` */

/*Table structure for table `sma_return_items` */

DROP TABLE IF EXISTS `sma_return_items`;

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`return_id`),
  KEY `return_id_2` (`return_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_return_items` */

/*Table structure for table `sma_returns` */

DROP TABLE IF EXISTS `sma_returns`;

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_returns` */

/*Table structure for table `sma_sale_items` */

DROP TABLE IF EXISTS `sma_sale_items`;

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_sale_items` */

insert  into `sma_sale_items`(`id`,`sale_id`,`product_id`,`product_code`,`product_name`,`product_type`,`option_id`,`net_unit_price`,`unit_price`,`quantity`,`warehouse_id`,`item_tax`,`tax_rate_id`,`tax`,`discount`,`item_discount`,`subtotal`,`serial_no`,`real_unit_price`,`sale_item_id`,`product_unit_id`,`product_unit_code`,`unit_quantity`,`comment`,`gst`,`cgst`,`sgst`,`igst`) values 
(1,1,1,'TBUT001','Produk Gangsar Makmur','standard',NULL,20000.0000,20000.0000,1.0000,4,0.0000,1,'0','0',0.0000,20000.0000,'',20000.0000,NULL,1,'pcs',1.0000,'',NULL,NULL,NULL,NULL),
(2,2,1,'TBUT001','Produk Gangsar Makmur','standard',NULL,20000.0000,20000.0000,1.0000,5,0.0000,1,'0','0',0.0000,20000.0000,'',20000.0000,NULL,1,'pcs',1.0000,'',NULL,NULL,NULL,NULL),
(3,3,2,'TBUT003','Produk Gangsar Makmur Jaya','standard',NULL,20000.0000,20000.0000,1.0000,5,0.0000,1,'0','0',0.0000,20000.0000,'',20000.0000,NULL,1,'pcs',1.0000,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_sales` */

DROP TABLE IF EXISTS `sma_sales`;

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_sales` */

insert  into `sma_sales`(`id`,`date`,`reference_no`,`customer_id`,`customer`,`biller_id`,`biller`,`warehouse_id`,`note`,`staff_note`,`total`,`product_discount`,`order_discount_id`,`total_discount`,`order_discount`,`product_tax`,`order_tax_id`,`order_tax`,`total_tax`,`shipping`,`grand_total`,`sale_status`,`payment_status`,`payment_term`,`due_date`,`created_by`,`updated_by`,`updated_at`,`total_items`,`pos`,`paid`,`return_id`,`surcharge`,`attachment`,`return_sale_ref`,`sale_id`,`return_sale_total`,`rounding`,`suspend_note`,`api`,`shop`,`address_id`,`reserve_id`,`hash`,`manual_payment`,`cgst`,`sgst`,`igst`,`payment_method`) values 
(1,'2024-04-22 13:00:06','SALE/POS2024/04/0001',1,'Walk-in Customer',4,'Gangsar Jaya',4,'','',20000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,20000.0000,'completed','paid',0,NULL,2,NULL,NULL,1,1,20000.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,0.0000,NULL,0,0,NULL,NULL,'5e3c5089d42b4cd755d17c05182b7b45a303bccf76b4cf1b190f88c58c543aba',NULL,NULL,NULL,NULL,NULL),
(2,'2024-04-26 18:40:28','SALE/POS2024/04/0002',7,'Wijaya Srinit',3,'Test Biller',5,'','',20000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,20000.0000,'completed','paid',0,NULL,2,NULL,NULL,1,1,20000.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,0.0000,NULL,0,0,NULL,NULL,'af2fea5fc80e00094aa56fb524360a1358a2cc425b3cfce7860db61786fd35e3',NULL,NULL,NULL,NULL,NULL),
(3,'2024-04-26 20:38:00','SALE2024/04/0001',7,'Wijaya Srinit',4,'Gangsar Jaya',5,'','',20000.0000,0.0000,'',0.0000,0.0000,0.0000,1,0.0000,0.0000,0.0000,20000.0000,'completed','pending',0,NULL,2,NULL,NULL,1,0,0.0000,NULL,0.0000,NULL,NULL,NULL,0.0000,NULL,NULL,0,0,NULL,NULL,'4f696f3515c8a87e8d79218501e1e93e0f6ae2aba835a13872f7b0729c46384c',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_sessions` */

DROP TABLE IF EXISTS `sma_sessions`;

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_sessions` */

insert  into `sma_sessions`(`id`,`ip_address`,`timestamp`,`data`) values 
('0c8ii4hs3l5399dg167h4e63q8ak6q1v','127.0.0.1',1714130985,'__ci_last_regenerate|i:1714130985;'),
('1h3s8ttppau5dbjl53dacs7aqa0jk1fq','::1',1714131390,'__ci_last_regenerate|i:1714131390;'),
('2nas9ugsdislklckti2um3anrgq92c74','127.0.0.1',1714140506,'__ci_last_regenerate|i:1714140384;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"5bza7lDGJSn6otWMEfw0\";remove_tols|i:1;last_activity|i:1714138687;'),
('2v83o6jlknrjerie8dju9n15knq7236f','127.0.0.1',1714131486,'__ci_last_regenerate|i:1714131486;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714131207;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"GDFOAdS6bf4nltwH5ZMy\";'),
('3papj50agttt34hei2su333i8f3p41rj','::1',1714131390,'__ci_last_regenerate|i:1714131390;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}'),
('46r67p8lhmgvl62qaunj607o7kp8buah','::1',1714124259,'__ci_last_regenerate|i:1714124259;requested_page|s:16:\"admin/products/4\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714037208\";last_ip|s:3:\"::1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"xLm1X2hCa8rlGVbiDeKv\";last_activity|i:1714121754;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";'),
('6r7nq4ibod824cn9mf5h660e0skbk8dq','127.0.0.1',1714132346,'__ci_last_regenerate|i:1714132346;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714131668;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"1ZwW4d3oM8YRIGfbUCaQ\";remove_tols|i:1;'),
('78qk0mc5tr0pdp3c12b1d7nbceheemmq','127.0.0.1',1714137279,'__ci_last_regenerate|i:1714137279;'),
('7u0iu2sob048nmjcek5rv8bveln3g567','127.0.0.1',1714830600,'__ci_last_regenerate|i:1714830417;requested_page|s:5:\"admin\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714469049\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"9lj6ZHEgTeNrBRJo7DPF\";'),
('8aofsoe18nm8gqqqalikavr0oiqaipql','::1',1714124265,'__ci_last_regenerate|i:1714124259;requested_page|s:16:\"admin/products/4\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714037208\";last_ip|s:3:\"::1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"xLm1X2hCa8rlGVbiDeKv\";last_activity|i:1714121754;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";'),
('96bafc497qef7d9rnaesl291thnna5r5','::1',1714131390,'__ci_last_regenerate|i:1714131390;requested_page|s:5:\"admin\";'),
('9odsjhph6nv2u1u7fmm7r25k6rsb1v6b','127.0.0.1',1714125059,'__ci_last_regenerate|i:1714125059;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714123448;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";'),
('aauhd64in2tp87t5l0aigt6qtu7iq0oi','127.0.0.1',1714137794,'__ci_last_regenerate|i:1714137794;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137279\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),
('ba64i6hv1p60smhugrr0aa79voaqr1hb','127.0.0.1',1714125703,'__ci_last_regenerate|i:1714125703;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"E9ly1kZ8zRQgJebi0MKr\";'),
('dula3ct7ot7fvqi6579v5abjvkkct2n7','127.0.0.1',1714125792,'__ci_last_regenerate|i:1714125792;requested_page|s:19:\"admin/purchases/add\";'),
('e0f71no9fb1l62spuo254khc4pt9q5lg','127.0.0.1',1714131155,'__ci_last_regenerate|i:1714131155;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714130883;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"v09Py6rRl21HfTzXmFhD\";'),
('eoe5u2fevltnli74am54ibq2rvavooun','127.0.0.1',1714456145,'__ci_last_regenerate|i:1714456072;requested_page|s:22:\"admin/reports/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137835\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"bxeyPq1OwA7kThX6mGWl\";remove_pols|s:1:\"1\";'),
('fmf8sc04n9ceas762b0ecgmjajudvrsp','127.0.0.1',1714138813,'__ci_last_regenerate|i:1714138813;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"5bza7lDGJSn6otWMEfw0\";remove_tols|i:1;last_activity|i:1714138687;'),
('g7d3cqsntb1hvp6du8uhsmda3jqj6t69','127.0.0.1',1714975195,'requested_page|s:19:\"admin/purchases/add\";__ci_last_regenerate|i:1714975195;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714863482\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"UqAPg2xl1CNKbGM5i8La\";'),
('hqb01680jd16o9q012o6r7n79i4q39ap','127.0.0.1',1714863533,'__ci_last_regenerate|i:1714863473;requested_page|s:5:\"admin\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714830470\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"LJktZDz7VquFYE85bnmp\";'),
('igf7mo452c1i83ms489hph3qe08agegh','127.0.0.1',1714973735,'requested_page|s:19:\"admin/purchases/add\";__ci_last_regenerate|i:1714973735;'),
('il0a23qs4q4ib3440nq5aktimvespfbs','127.0.0.1',1714127594,'__ci_last_regenerate|i:1714127594;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"zMHBICwyqQihFJR8bsnE\";'),
('ipmj20s3i7cl3lqiqtbj8if8g2ta81r9','::1',1714131390,'__ci_last_regenerate|i:1714131390;'),
('j40ludq3oagvdl2fgc4b4i9aoqojlup7','127.0.0.1',1714126897,'__ci_last_regenerate|i:1714126897;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"HSvpPQ0eoWXDbjKt5rsF\";'),
('jcjjcfn7r8lvrcjshltk72jpne9auuue','127.0.0.1',1714140384,'__ci_last_regenerate|i:1714140384;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"5bza7lDGJSn6otWMEfw0\";remove_tols|i:1;last_activity|i:1714138687;'),
('jcpnvbh1ua8tqlqns78c3f0ibi0frs1o','127.0.0.1',1714139489,'__ci_last_regenerate|i:1714139489;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"5bza7lDGJSn6otWMEfw0\";remove_tols|i:1;last_activity|i:1714138687;'),
('ju56i2qvoue5m8kmos1cbptrpqp2rb5t','127.0.0.1',1714129339,'__ci_last_regenerate|i:1714129339;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";'),
('k9o7lf794hvssjq9cb3gdavkff7c9eag','::1',1714456128,'__ci_last_regenerate|i:1714456057;error|s:37:\"<p>Login Failed, Please try again</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),
('k9r413rahcsujoir4toipnl0do0vh6dm','127.0.0.1',1714126259,'__ci_last_regenerate|i:1714126259;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"Np61uFOPn9CRTMavdjcI\";'),
('kah4utss3ip1n7dub69ami42r52dvhav','127.0.0.1',1714745866,'__ci_last_regenerate|i:1714745866;requested_page|s:11:\"admin/sales\";'),
('l9igta136epq380mkgq9h3jnk04ip2mu','127.0.0.1',1714130195,'__ci_last_regenerate|i:1714130195;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";'),
('leh7t8qpgkelkdhif2ibev1rfuofdl3b','127.0.0.1',1714469054,'__ci_last_regenerate|i:1714469045;requested_page|s:11:\"admin/sales\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714456076\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),
('n9can7p18ojd3god3mg5hngljnkve52b','127.0.0.1',1714130794,'__ci_last_regenerate|i:1714130793;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";'),
('nhbnegh3310jdj1gomklnmckckd48tc9','::1',1714131391,'__ci_last_regenerate|i:1714131391;'),
('nlu6b6it9ce0j0s5l5vnsgim2arbgkp3','127.0.0.1',1714130985,'__ci_last_regenerate|i:1714130985;requested_page|s:5:\"admin\";'),
('r8218ain2mih8aej6t0a83er8kc1us7n','127.0.0.1',1714975766,'requested_page|s:19:\"admin/purchases/add\";__ci_last_regenerate|i:1714975766;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714863482\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"IsU62AZzJgwxbdeFYt1G\";'),
('rfblh2494t2m3kqoiufuiit7bev6faa8','127.0.0.1',1714975779,'requested_page|s:19:\"admin/purchases/add\";__ci_last_regenerate|i:1714975766;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714863482\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"IsU62AZzJgwxbdeFYt1G\";'),
('sspj5cc93m6mimt2g1hep4dcisd8ouas','127.0.0.1',1714129880,'__ci_last_regenerate|i:1714129880;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}'),
('t6p9gq9kjfmlsn0ph0tl8qtqutm7h4ah','127.0.0.1',1714129003,'__ci_last_regenerate|i:1714129003;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";'),
('u8sf0e92vn1as9goh9edou9rfacn5m2b','127.0.0.1',1714138099,'__ci_last_regenerate|i:1714138099;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";'),
('uu404rkipisapijjpeb7tk8mjl8dtb0h','127.0.0.1',1714127906,'__ci_last_regenerate|i:1714127906;requested_page|s:14:\"admin/products\";identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714108306\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1714125078;register_id|s:1:\"1\";cash_in_hand|s:13:\"10000000.0000\";register_open_time|s:19:\"2024-04-22 12:54:25\";user_csrf|s:20:\"fucX2bWmeTQHA518Nv9r\";'),
('vj511fudkohqvts884b9n2isd3io3phd','127.0.0.1',1714138506,'__ci_last_regenerate|i:1714138506;identity|s:7:\"gangsar\";username|s:7:\"gangsar\";email|s:12:\"gj@gmail.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1714137458\";last_ip|s:9:\"127.0.0.1\";avatar|N;gender|s:6:\"female\";group_id|s:1:\"1\";warehouse_id|s:1:\"0\";view_right|s:1:\"1\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|s:1:\"0\";company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"5bza7lDGJSn6otWMEfw0\";');

/*Table structure for table `sma_settings` */

DROP TABLE IF EXISTS `sma_settings`;

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_settings` */

insert  into `sma_settings`(`setting_id`,`logo`,`logo2`,`site_name`,`language`,`default_warehouse`,`accounting_method`,`default_currency`,`default_tax_rate`,`rows_per_page`,`version`,`default_tax_rate2`,`dateformat`,`sales_prefix`,`quote_prefix`,`purchase_prefix`,`transfer_prefix`,`delivery_prefix`,`payment_prefix`,`return_prefix`,`returnp_prefix`,`expense_prefix`,`item_addition`,`theme`,`product_serial`,`default_discount`,`product_discount`,`discount_method`,`tax1`,`tax2`,`overselling`,`restrict_user`,`restrict_calendar`,`timezone`,`iwidth`,`iheight`,`twidth`,`theight`,`watermark`,`reg_ver`,`allow_reg`,`reg_notification`,`auto_reg`,`protocol`,`mailpath`,`smtp_host`,`smtp_user`,`smtp_pass`,`smtp_port`,`smtp_crypto`,`corn`,`customer_group`,`default_email`,`mmode`,`bc_fix`,`auto_detect_barcode`,`captcha`,`reference_format`,`racks`,`attributes`,`product_expiry`,`decimals`,`qty_decimals`,`decimals_sep`,`thousands_sep`,`invoice_view`,`default_biller`,`envato_username`,`purchase_code`,`rtl`,`each_spent`,`ca_point`,`each_sale`,`sa_point`,`update`,`sac`,`display_all_products`,`display_symbol`,`symbol`,`remove_expired`,`barcode_separator`,`set_focus`,`price_group`,`barcode_img`,`ppayment_prefix`,`disable_editing`,`qa_prefix`,`update_cost`,`apis`,`state`,`pdf_lib`,`use_code_for_slug`,`ws_barcode_type`,`ws_barcode_chars`,`flag_chars`,`item_code_start`,`item_code_chars`,`price_start`,`price_chars`,`price_divide_by`,`weight_start`,`weight_chars`,`weight_divide_by`) values 
(1,'logo2.png','logo3.png','Gangsar Jaya','Indonesian',3,0,'IDR',1,10,'3.4.47',1,5,'SALE','QUOTE','PO','TR','DO','IPAY','SR','PR',NULL,0,'default',1,1,1,1,1,1,0,0,0,'Asia/Kuala_Lumpur',800,800,150,150,0,0,0,0,NULL,'mail','/usr/sbin/sendmail','pop.gmail.com','contact@sma.tecdiary.org','jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==','25',NULL,NULL,1,'contact@tecdiary.com',0,4,1,0,2,1,1,0,2,2,'.',',',0,3,'1','1',0,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,'-',0,NULL,1,'POP',90,NULL,NULL,0,NULL,'dompdf',NULL,'weight',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_shop_settings` */

DROP TABLE IF EXISTS `sma_shop_settings`;

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.47',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT 0,
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT 0,
  `hide_price` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_shop_settings` */

insert  into `sma_shop_settings`(`shop_id`,`shop_name`,`description`,`warehouse`,`biller`,`about_link`,`terms_link`,`privacy_link`,`contact_link`,`payment_text`,`follow_text`,`facebook`,`twitter`,`google_plus`,`instagram`,`phone`,`email`,`cookie_message`,`cookie_link`,`slider`,`shipping`,`purchase_code`,`envato_username`,`version`,`logo`,`bank_details`,`products_page`,`hide0`,`products_description`,`private`,`hide_price`,`stripe`) values 
(1,'SMA Shop','Stock Manager Advance - SMA Shop - Demo Ecommerce Shop that would help you to sell your products from your site.',1,3,'about','terms-conditions','privacy-policy','contact','We accept PayPal or you can pay with your credit/debit cards.','Please click the link below to follow us on social media.','http://facebook.com/tecdiary','http://twitter.com/tecdiary','','','010 1234 567','info@tecdiary.com','We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.','','[{\"image\":\"s1.jpg\",\"link\":\"http:\\/\\/ci.dev\\/sma\\/shop\\/products\",\"caption\":\"\"},{\"image\":\"s2.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"s3.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]',0,'','envato_username','3.4.47','sma-shop.png',NULL,NULL,0,NULL,0,0,0);

/*Table structure for table `sma_skrill` */

DROP TABLE IF EXISTS `sma_skrill`;

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_skrill` */

insert  into `sma_skrill`(`id`,`active`,`account_email`,`secret_word`,`skrill_currency`,`fixed_charges`,`extra_charges_my`,`extra_charges_other`) values 
(1,1,'testaccount2@moneybookers.com','mbtest','USD',0.0000,0.0000,0.0000);

/*Table structure for table `sma_sms_settings` */

DROP TABLE IF EXISTS `sma_sms_settings`;

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_sms_settings` */

insert  into `sma_sms_settings`(`id`,`auto_send`,`config`) values 
(1,NULL,'{\"gateway\":\"Log\",\"Log\":{}');

/*Table structure for table `sma_stock_count_items` */

DROP TABLE IF EXISTS `sma_stock_count_items`;

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_stock_count_items` */

/*Table structure for table `sma_stock_counts` */

DROP TABLE IF EXISTS `sma_stock_counts`;

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_stock_counts` */

insert  into `sma_stock_counts`(`id`,`date`,`reference_no`,`warehouse_id`,`type`,`initial_file`,`final_file`,`brands`,`brand_names`,`categories`,`category_names`,`note`,`products`,`rows`,`differences`,`matches`,`missing`,`created_by`,`updated_by`,`updated_at`,`finalized`) values 
(1,'2024-04-22 12:57:00','',4,'full','a69d153b671e88da73e27dde69912627.csv',NULL,'','','','',NULL,1,1,NULL,NULL,NULL,2,NULL,NULL,NULL);

/*Table structure for table `sma_suspended_bills` */

DROP TABLE IF EXISTS `sma_suspended_bills`;

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_suspended_bills` */

/*Table structure for table `sma_suspended_items` */

DROP TABLE IF EXISTS `sma_suspended_items`;

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_suspended_items` */

/*Table structure for table `sma_tax_rates` */

DROP TABLE IF EXISTS `sma_tax_rates`;

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_tax_rates` */

insert  into `sma_tax_rates`(`id`,`name`,`code`,`rate`,`type`) values 
(1,'No Tax','NT',0.0000,'2'),
(2,'VAT @10%','VAT10',10.0000,'1'),
(3,'GST @6%','GST',6.0000,'1'),
(4,'VAT @20%','VT20',20.0000,'1');

/*Table structure for table `sma_transfer_items` */

DROP TABLE IF EXISTS `sma_transfer_items`;

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_transfer_items` */

/*Table structure for table `sma_transfers` */

DROP TABLE IF EXISTS `sma_transfers`;

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_transfers` */

insert  into `sma_transfers`(`id`,`transfer_no`,`date`,`from_warehouse_id`,`from_warehouse_code`,`from_warehouse_name`,`to_warehouse_id`,`to_warehouse_code`,`to_warehouse_name`,`note`,`total`,`total_tax`,`grand_total`,`created_by`,`status`,`shipping`,`attachment`,`cgst`,`sgst`,`igst`) values 
(1,'TR2024/04/0001','2024-04-22 19:28:17',4,'TR','TRANSIT',5,'UTM','UTAMA','',60000.0000,0.0000,60000.0000,'3','completed',0.0000,NULL,NULL,NULL,NULL),
(2,'TR2024/04/0002','2024-04-23 04:22:00',4,'TR','TRANSIT',5,'UTM','UTAMA','',210000.0000,0.0000,210000.0000,'2','completed',0.0000,NULL,NULL,NULL,NULL),
(3,'TR2024/04/0003','2024-04-26 18:38:00',4,'TR','TRANSIT',5,'UTM','UTAMA','',20000.0000,0.0000,20000.0000,'2','completed',0.0000,NULL,NULL,NULL,NULL),
(4,'TR2024/04/0004','2024-04-26 20:37:00',4,'TR','TRANSIT',5,'UTM','UTAMA','',20000.0000,0.0000,20000.0000,'2','completed',0.0000,NULL,NULL,NULL,NULL);

/*Table structure for table `sma_units` */

DROP TABLE IF EXISTS `sma_units`;

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_units` */

insert  into `sma_units`(`id`,`code`,`name`,`base_unit`,`operator`,`unit_value`,`operation_value`) values 
(1,'pcs','Pieces',NULL,NULL,NULL,NULL);

/*Table structure for table `sma_user_logins` */

DROP TABLE IF EXISTS `sma_user_logins`;

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_user_logins` */

insert  into `sma_user_logins`(`id`,`user_id`,`company_id`,`ip_address`,`login`,`time`) values 
(1,1,NULL,'127.0.0.1','owner@tecdiary.com','2024-04-18 12:18:50'),
(2,1,NULL,'::1','owner@tecdiary.com','2024-04-18 23:27:10'),
(3,1,NULL,'::1','owner@tecdiary.com','2024-04-20 18:14:44'),
(4,1,NULL,'::1','owner@tecdiary.com','2024-04-21 19:00:17'),
(5,2,NULL,'::1','gangsar','2024-04-21 19:37:26'),
(6,2,NULL,'::1','gangsar','2024-04-22 04:56:03'),
(7,3,NULL,'::1','angga','2024-04-22 05:02:05'),
(8,2,NULL,'::1','gangsar','2024-04-22 06:02:31'),
(9,2,NULL,'::1','gangsar','2024-04-22 09:39:24'),
(10,4,NULL,'::1','lilis','2024-04-22 15:59:19'),
(11,3,NULL,'::1','angga','2024-04-22 16:13:41'),
(12,2,NULL,'::1','gangsar','2024-04-22 16:15:20'),
(13,3,NULL,'::1','angga','2024-04-22 16:17:23'),
(14,2,NULL,'::1','gangsar','2024-04-22 16:17:44'),
(15,3,NULL,'::1','angga','2024-04-22 16:18:09'),
(16,2,NULL,'::1','gangsar','2024-04-22 16:27:03'),
(17,3,NULL,'::1','angga','2024-04-22 16:29:46'),
(18,2,NULL,'::1','gangsar','2024-04-22 16:30:20'),
(19,3,NULL,'::1','angga','2024-04-22 16:31:36'),
(20,2,NULL,'::1','gangsar','2024-04-22 16:31:49'),
(21,3,NULL,'::1','angga','2024-04-22 16:45:22'),
(22,2,NULL,'::1','gangsar','2024-04-22 16:50:41'),
(23,3,NULL,'::1','angga','2024-04-22 16:52:29'),
(24,2,NULL,'::1','gangsar','2024-04-22 16:53:32'),
(25,3,NULL,'::1','angga','2024-04-22 16:55:37'),
(26,4,NULL,'::1','lilis','2024-04-22 17:00:27'),
(27,2,NULL,'::1','gangsar','2024-04-22 17:00:38'),
(28,3,NULL,'::1','angga','2024-04-22 17:08:47'),
(29,2,NULL,'::1','gangsar','2024-04-22 19:19:39'),
(30,3,NULL,'::1','angga','2024-04-22 19:21:01'),
(31,3,NULL,'::1','angga','2024-04-23 03:34:38'),
(32,2,NULL,'::1','gangsar','2024-04-23 03:34:52'),
(33,3,NULL,'127.0.0.1','angga','2024-04-23 03:37:24'),
(34,3,NULL,'127.0.0.1','angga','2024-04-23 03:49:21'),
(35,5,NULL,'127.0.0.1','aru','2024-04-23 04:24:41'),
(36,2,NULL,'::1','gangsar','2024-04-23 06:42:29'),
(37,2,NULL,'::1','gangsar','2024-04-23 12:46:18'),
(38,2,NULL,'::1','gangsar','2024-04-23 15:56:11'),
(39,2,NULL,'::1','gangsar','2024-04-24 13:09:54'),
(40,2,NULL,'::1','gangsar','2024-04-24 16:46:42'),
(41,2,NULL,'::1','gangsar','2024-04-25 16:26:48'),
(42,2,NULL,'::1','gangsar','2024-04-26 11:26:54'),
(43,2,NULL,'127.0.0.1','gangsar','2024-04-26 12:11:46'),
(44,2,NULL,'127.0.0.1','gangsar','2024-04-26 16:16:08'),
(45,2,NULL,'127.0.0.1','gangsar','2024-04-26 20:14:39'),
(46,2,NULL,'127.0.0.1','gangsar','2024-04-26 20:17:38'),
(47,2,NULL,'127.0.0.1','gangsar','2024-04-26 20:23:55'),
(48,2,NULL,'127.0.0.1','gangsar','2024-04-30 12:47:56'),
(49,2,NULL,'127.0.0.1','gangsar','2024-04-30 16:24:09'),
(50,2,NULL,'127.0.0.1','gangsar','2024-05-04 20:47:50'),
(51,2,NULL,'127.0.0.1','gangsar','2024-05-05 05:58:02'),
(52,2,NULL,'127.0.0.1','gangsar','2024-05-06 12:35:35');

/*Table structure for table `sma_users` */

DROP TABLE IF EXISTS `sma_users`;

CREATE TABLE `sma_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_users` */

insert  into `sma_users`(`id`,`last_ip_address`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`avatar`,`gender`,`group_id`,`warehouse_id`,`biller_id`,`company_id`,`show_cost`,`show_price`,`award_points`,`view_right`,`edit_right`,`allow_discount`) values 
(2,'127.0.0.1','::1','gangsar','8343b7780246e91bd18b40ae7b59d8f3e3c0d2e2',NULL,'gj@gmail.com',NULL,NULL,NULL,'b22657b877e248f4ab7cb01f01ccd25dc52596f7',1713703029,1714973735,1,'Owner Gangsar','Makmur Jaya','Gangsar Jaya','12345',NULL,'female',1,0,0,NULL,0,0,0,1,0,0),
(3,'127.0.0.1','::1','angga','f938117c7c671f58b5f238cbb4c78524fc93718b',NULL,'anggagudang@gmail.com',NULL,NULL,NULL,NULL,1713736857,1713818961,1,'Angga','gudang','Gangsar Jaya','12345',NULL,'male',6,NULL,NULL,NULL,NULL,NULL,0,1,0,0),
(4,'::1','::1','lilis','cf3523ec5c3926e2a3bdad6b02e263a229981584',NULL,'lilispurchasing@gmail.com',NULL,NULL,NULL,NULL,1713776293,1713780027,1,'Lilis','Purchasing','Gangsar Jaya','12345',NULL,'female',7,4,4,NULL,0,0,0,1,1,1),
(5,'127.0.0.1','::1','aru','451e4bd2d01e39d0ef1215b38dcd207964700c80',NULL,'aru@gmail.com',NULL,NULL,NULL,NULL,1713820588,1713821081,1,'Aru','Sales','Gangsar Jaya','12345',NULL,'male',5,5,4,NULL,0,0,0,1,0,0);

/*Table structure for table `sma_variants` */

DROP TABLE IF EXISTS `sma_variants`;

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_variants` */

/*Table structure for table `sma_warehouses` */

DROP TABLE IF EXISTS `sma_warehouses`;

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_warehouses` */

insert  into `sma_warehouses`(`id`,`code`,`name`,`address`,`map`,`phone`,`email`,`price_group_id`) values 
(1,'WHI','Warehouse 1','<p>Address, City</p>',NULL,'012345678','whi@tecdiary.com',NULL),
(2,'WHII','Warehouse 2','<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>',NULL,'0105292122','whii@tecdiary.com',NULL),
(4,'TR','TRANSIT','<p>Alamat Transit</p>',NULL,'12345','',0),
(5,'UTM','UTAMA','<p>Alamat Utama</p>',NULL,'12345','',0),
(6,'RSK','GUDANG RUSAK','<p>Gudang Rusak</p>',NULL,'','',0),
(7,'KCF','KCF','<p>Alamat KCF</p>',NULL,'','',0),
(8,'MBL','Mobil Traga','<p>Mobil</p>',NULL,'','',1),
(9,'DISP','DISPLAY','<p>DISPLAY</p>',NULL,'','',0);

/*Table structure for table `sma_warehouses_products` */

DROP TABLE IF EXISTS `sma_warehouses_products`;

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_warehouses_products` */

insert  into `sma_warehouses_products`(`id`,`product_id`,`warehouse_id`,`quantity`,`rack`,`avg_cost`) values 
(1,1,1,0.0000,NULL,10000.0000),
(2,1,2,0.0000,NULL,10000.0000),
(3,1,4,88.0000,NULL,10000.0000),
(4,1,5,17.0000,NULL,10000.0000),
(5,1,6,0.0000,NULL,10000.0000),
(6,1,7,0.0000,NULL,10000.0000),
(7,2,1,0.0000,NULL,10000.0000),
(8,2,2,0.0000,NULL,10000.0000),
(9,2,4,52.0000,NULL,10000.0000),
(10,2,5,2.0000,NULL,10000.0000),
(11,2,6,0.0000,NULL,10000.0000),
(12,2,7,0.0000,NULL,10000.0000),
(13,3,1,0.0000,NULL,10000.0000),
(14,3,2,0.0000,NULL,10000.0000),
(15,3,4,50.0000,NULL,10000.0000),
(16,3,5,10.0000,NULL,10000.0000),
(17,3,6,0.0000,NULL,10000.0000),
(18,3,7,0.0000,NULL,10000.0000),
(19,4,1,0.0000,NULL,10000.0000),
(20,4,2,0.0000,NULL,10000.0000),
(21,4,4,0.0000,NULL,10000.0000),
(22,4,5,0.0000,NULL,10000.0000),
(23,4,6,0.0000,NULL,10000.0000),
(24,4,7,0.0000,NULL,10000.0000),
(25,4,8,0.0000,NULL,10000.0000),
(26,1,8,0.0000,NULL,10000.0000),
(27,2,8,0.0000,NULL,10000.0000),
(28,1,9,0.0000,NULL,10000.0000),
(29,2,9,0.0000,NULL,10000.0000);

/*Table structure for table `sma_warehouses_products_variants` */

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_warehouses_products_variants` */

/*Table structure for table `sma_wishlist` */

DROP TABLE IF EXISTS `sma_wishlist`;

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sma_wishlist` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
