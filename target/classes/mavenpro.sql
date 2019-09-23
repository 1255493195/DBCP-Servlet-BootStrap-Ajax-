/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : mavenpro

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-09-23 16:02:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'admin', 'admin');
INSERT INTO `user` VALUES ('11111', 'admin', '1');
INSERT INTO `user` VALUES ('22', '2', '0');
INSERT INTO `user` VALUES ('3333', '1', '1');
INSERT INTO `user` VALUES ('4', '2', '0');

-- ----------------------------
-- Table structure for `user_pro`
-- ----------------------------
DROP TABLE IF EXISTS `user_pro`;
CREATE TABLE `user_pro` (
  `uid` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_pro
-- ----------------------------
INSERT INTO `user_pro` VALUES ('11111', 'admin', '1', '江苏省南通市', '444', '1255493195@qq.com');
INSERT INTO `user_pro` VALUES ('3333', '1', '0', '1', '1', '1255493195@qq.com');
INSERT INTO `user_pro` VALUES ('4', '2', '0', '江苏省南通市', '1', '1255493195@qq.com');
