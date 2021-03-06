/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `oid` (`oid`),
  KEY `pid` (`pid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemid`,`count`,`subtotal`,`pid`,`oid`) values ('047d7cce4ba14821a1bcf947fa99098d',1,1999,'11','9df825b8a2db45c892bff51a37149bfc'),('0543726f96a54446a21a3da5dd6907a1',1,1999,'13','6b2b3cc7683243b78e52d5d032a34ed2'),('516a9a8a17a74ebda876c68bba9a1cde',1,1999,'1','88ea0c5e44b24031906c1ec7f627bc3b'),('55b0f01fd45a4d58a283fdc01b823152',1,1999,'17','fa8f9738ded443369d2b7ed2ec96e4e3'),('8d32860926ef4c01b6e890371cce6203',1,1999,'10','89b3a606b68e417098fd2bc35cb7e93e'),('ab77c5073f9947859cd47489a6d17e0c',1,1999,'13','b3d7d90e65c242e6b2f8c1352280407c'),('b54e549d78de497c80e177734711759b',1,1999,'19','fa8f9738ded443369d2b7ed2ec96e4e3');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`ordertime`,`total`,`uid`) values ('6b2b3cc7683243b78e52d5d032a34ed2','2019-09-29 00:00:00',1999,'b181764640754ba99a5ecd2179c4fb1b'),('88ea0c5e44b24031906c1ec7f627bc3b','2019-09-20 00:00:00',1999,'b0379547f5384f12800a71474c40a269'),('89b3a606b68e417098fd2bc35cb7e93e','2019-09-20 00:00:00',1999,'b0379547f5384f12800a71474c40a269'),('9df825b8a2db45c892bff51a37149bfc','2019-09-28 00:00:00',1999,'b0379547f5384f12800a71474c40a269'),('b3d7d90e65c242e6b2f8c1352280407c','2019-09-28 00:00:00',1999,'b0379547f5384f12800a71474c40a269'),('fa8f9738ded443369d2b7ed2ec96e4e3','2019-09-20 00:00:00',3998,'b0379547f5384f12800a71474c40a269');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pstate` int(1) DEFAULT '1',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`price`,`pimage`,`pdate`,`pdesc`,`pstate`) values ('1','商品1',1999,'products/p0001.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',0),('10','商品10',1999,'products/p0010.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('11','商品11',1999,'products/p0011.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('12','商品12',1999,'products/p0012.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('13','商品13',1999,'products/p0013.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('14','商品14',1999,'products/p0014.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('15','商品15',1999,'products/p0015.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('16','商品16',1999,'products/p0016.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('17','商品17',1999,'products/p0017.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('18','商品18',1999,'products/p0018.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('19','商品19',1999,'products/p0019.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('2','商品2',1999,'products/p0002.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('20','商品20',1999,'products/p0020.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('21','商品21',1999,'products/p0021.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('22','商品22',1999,'products/p0022.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('23','商品23',1999,'products/p0023.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('24','商品24',1999,'products/p0024.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('25','商品25',1999,'products/p0025.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('3','商品3',1999,'products/p0003.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('4','商品4',1999,'products/p0004.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('5','商品5',1999,'products/p0005.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('6','商品6',1999,'products/p0006.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('7','商品7',1999,'products/p0007.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('8','商品8',1999,'products/p0008.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1),('9','商品9',1999,'products/p0009.jpg','2019-11-11','真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车',1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `flag` varchar(2) DEFAULT NULL,
  `category_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`pid`,`pname`,`price`,`flag`,`category_id`) values (1,'联想',5000,'1','c001'),(2,'海尔',3000,'1','c001'),(3,'雷神',5000,'1','c001'),(4,'JACK JONES',800,'1','c002'),(5,'真维斯',200,'1','c002'),(6,'花花公子',440,'1','c002'),(7,'劲霸',2000,'1','c002'),(8,'香奈儿',800,'1','c003'),(9,'相宜本草',200,'1','c003'),(10,'123',123,'1','c00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `authority` int(11) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`email`,`name`,`sex`,`birthday`,`code`,`state`,`authority`,`telephone`) values ('b0379547f5384f12800a71474c40a269','zl52074','zl1218207423.','737218582@qq.com','张乐','1','1997-12-19',NULL,NULL,0,NULL),('b181764640754ba99a5ecd2179c4fb1b','ssssss','zl1218207423.','123456@qq.com','123','1','1999-01-01',NULL,NULL,0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
