-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        10.5.9-MariaDB - mariadb.org binary distribution
-- 伺服器作業系統:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 傾印 db_pos 的資料庫結構
CREATE DATABASE IF NOT EXISTS `db_pos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_pos`;

-- 傾印  資料表 db_pos.order 結構
CREATE TABLE IF NOT EXISTS `order` (
  `order_num` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total_price` double(22,0) NOT NULL DEFAULT 0,
  `customer_name` varchar(150) DEFAULT NULL,
  `customer_address` varchar(250) DEFAULT NULL,
  `customer_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在傾印表格  db_pos.order 的資料：~2 rows (近似值)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_num`, `order_date`, `total_price`, `customer_name`, `customer_address`, `customer_phone`) VALUES
	('ord-101', '2021-05-09 04:05:12', 70, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-102', '2021-05-09 04:05:34', 380, '王範例2', '高雄市楠梓區大學路一號', '093256789');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 傾印  資料表 db_pos.order_detail 結構
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_price` int(11) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_detail_order` (`order_num`),
  KEY `FK_order_detail_product` (`product_id`),
  CONSTRAINT `FK_order_detail_order` FOREIGN KEY (`order_num`) REFERENCES `order` (`order_num`),
  CONSTRAINT `FK_order_detail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- 正在傾印表格  db_pos.order_detail 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

-- 傾印  資料表 db_pos.product 結構
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在傾印表格  db_pos.product 的資料：~25 rows (近似值)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`, `category`, `name`, `price`, `photo`, `description`) VALUES
	('p001', '衣服', 'Red', 150, 'Red.png', ''),
	('p002', '衣服', 'Black', 150, 'Black.png', ''),
	('p003', '衣服', 'Chocolate', 150, 'Chocolate.png', ''),
	('p004', '衣服', 'Navy', 150, 'Navy.png', NULL),
	('p005', '衣服', 'Green', 150, 'Green.png', NULL),
	('p006', '衣服', 'Gold', 150, 'Gold.png', NULL),
	('p007', '衣服', 'Blue', 150, 'Blue.png', NULL),
	('p008', '衣服', 'Sky', 150, 'Sky.png', NULL),
	('p009', '衣服', 'Purple', 150, 'Purple.png', NULL),
	('p010', '衣服', 'Royal', 150, 'Royal.png', NULL),
	('p011', '衣服', 'Grey', 150, 'Grey.png', NULL),
	('p012', '衣服', 'White', 150, 'White.png', NULL),
	('p013', '衣服', 'Pink', 150, 'Pink.png', NULL),
	('p014', '衣服', 'Yellow', 150, 'Yellow.png', NULL),
	('p015', '衣服', 'Orange', 150, 'Orange2.png', NULL),
	('p016', '衣服', 'Sand', 150, 'Sand.png', NULL),
	('p017', '褲子', 'Jeans-blue', 200, 'jeans-blue.png', NULL),
	('p018', '褲子', 'Jeans-black', 200, 'jeans-black.png', NULL),
	('p019', '褲子', 'Shorts-black', 180, 'shorts-black.png', NULL),
	('p020', '褲子', 'Shorts-brown', 180, 'shorts-brown.png', NULL),
	('p021', '褲子', 'Shorts-white', 180, 'shorts-white.png', NULL),
	('p022', '外套', 'Jacket-black', 230, 'jacket-black.png', NULL),
	('p023', '外套', 'Jacket-blue', 230, 'jacket-blue.png', NULL),
	('p024', '外套', 'Jacket-gray', 230, 'jacket-gray.png', NULL),
	('p025', '外套', 'Jacket-green', 230, 'jacket-green.png', NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 傾印  資料表 db_pos.sale_order 結構
CREATE TABLE IF NOT EXISTS `sale_order` (
  `order_num` varchar(20) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total_price` double(22,0) NOT NULL DEFAULT 0,
  `customer_name` varchar(150) DEFAULT NULL,
  `customer_address` varchar(250) DEFAULT NULL,
  `customer_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在傾印表格  db_pos.sale_order 的資料：~24 rows (近似值)
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` (`order_num`, `order_date`, `total_price`, `customer_name`, `customer_address`, `customer_phone`) VALUES
	('ord-101', '2021-05-04 22:54:47', 70, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-102', '2021-05-04 22:55:19', 380, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-103', '2021-05-24 06:37:08', 250, '無姓名', '無地址', '無電話'),
	('ord-104', '2021-05-24 09:39:01', 0, '無姓名', '無地址', '無電話'),
	('ord-105', '2021-05-25 17:24:50', 150, '無姓名', '無地址', '無電話'),
	('ord-106', '2021-06-13 23:14:23', 450, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-107', '2021-06-13 23:16:31', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-108', '2021-06-13 23:18:42', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-109', '2021-06-13 23:18:59', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-110', '2021-06-13 23:20:22', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-111', '2021-06-13 23:20:56', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-112', '2021-06-14 01:09:12', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-113', '2021-06-14 01:09:32', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-114', '2021-06-14 01:09:59', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-115', '2021-06-14 01:10:22', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-116', '2021-06-14 01:11:07', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-117', '2021-06-14 01:12:08', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-118', '2021-06-14 02:08:36', 900, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-119', '2021-06-14 02:09:17', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-120', '2021-06-14 02:10:26', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-121', '2021-06-14 02:25:50', 300, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-122', '2021-06-14 22:42:29', 600, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-123', '2021-06-23 09:30:56', 150, '王範例', '高雄市楠梓區大學路一號', '093256789'),
	('ord-124', '2021-06-23 09:42:00', 450, '王範例', '高雄市楠梓區大學路一號', '093256789');
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
