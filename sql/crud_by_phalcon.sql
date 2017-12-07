/*
Navicat MariaDB Data Transfer

Source Server         : MariaDB
Source Server Version : 100123
Source Host           : localhost:3306
Source Database       : crud_by_phalcon

Target Server Type    : MariaDB
Target Server Version : 100123
File Encoding         : 65001

Date: 2017-12-07 23:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_fullname` varchar(100) DEFAULT NULL,
  `emp_nickname` varchar(100) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('41', 'Abraham Dinejad', 'Ham', 'ham@di.com');
INSERT INTO `employee` VALUES ('42', 'Suci Maharani', 'Cici', 'suci@gmail.com');
INSERT INTO `employee` VALUES ('43', 'Novi Ambarwati', 'Novi', 'ambar@gmail.com');
INSERT INTO `employee` VALUES ('44', 'Muhammad Alfatih', 'Mehmed', 'mehmed@konstanta.com');
INSERT INTO `employee` VALUES ('45', 'Burhanudin Yahya', 'Burhan', 'yahyaburhan98@gmail.com');
