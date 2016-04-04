/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : rbac_user

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-04-04 16:39:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rbac_group
-- ----------------------------
DROP TABLE IF EXISTS `rbac_group`;
CREATE TABLE `rbac_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_group
-- ----------------------------
INSERT INTO `rbac_group` VALUES ('1', '编程爱好者');
INSERT INTO `rbac_group` VALUES ('2', 'msdn老师');

-- ----------------------------
-- Table structure for rbac_impower
-- ----------------------------
DROP TABLE IF EXISTS `rbac_impower`;
CREATE TABLE `rbac_impower` (
  `impower_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`impower_id`),
  KEY `role_id` (`role_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `rbac_impower_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`role_id`),
  CONSTRAINT `rbac_impower_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `rbac_privilege` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_impower
-- ----------------------------
INSERT INTO `rbac_impower` VALUES ('1', '1', '2');
INSERT INTO `rbac_impower` VALUES ('2', '2', '3');
INSERT INTO `rbac_impower` VALUES ('3', '1', '1');

-- ----------------------------
-- Table structure for rbac_operate
-- ----------------------------
DROP TABLE IF EXISTS `rbac_operate`;
CREATE TABLE `rbac_operate` (
  `operate_id` int(11) NOT NULL,
  `operate_name` varchar(20) NOT NULL,
  PRIMARY KEY (`operate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_operate
-- ----------------------------
INSERT INTO `rbac_operate` VALUES ('1', '添加');
INSERT INTO `rbac_operate` VALUES ('2', '读取');
INSERT INTO `rbac_operate` VALUES ('3', '编写');
INSERT INTO `rbac_operate` VALUES ('4', '删除');

-- ----------------------------
-- Table structure for rbac_privilege
-- ----------------------------
DROP TABLE IF EXISTS `rbac_privilege`;
CREATE TABLE `rbac_privilege` (
  `privilege_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `operate_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_id`),
  KEY `resource_id` (`resource_id`),
  KEY `operate_id` (`operate_id`),
  CONSTRAINT `rbac_privilege_ibfk_2` FOREIGN KEY (`operate_id`) REFERENCES `rbac_operate` (`operate_id`),
  CONSTRAINT `rbac_privilege_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `rbac_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_privilege
-- ----------------------------
INSERT INTO `rbac_privilege` VALUES ('1', '1', '1');
INSERT INTO `rbac_privilege` VALUES ('2', '1', '2');
INSERT INTO `rbac_privilege` VALUES ('3', '1', '3');
INSERT INTO `rbac_privilege` VALUES ('4', '1', '4');
INSERT INTO `rbac_privilege` VALUES ('5', '2', '1');
INSERT INTO `rbac_privilege` VALUES ('6', '2', '2');
INSERT INTO `rbac_privilege` VALUES ('7', '2', '3');
INSERT INTO `rbac_privilege` VALUES ('8', '2', '4');

-- ----------------------------
-- Table structure for rbac_resource
-- ----------------------------
DROP TABLE IF EXISTS `rbac_resource`;
CREATE TABLE `rbac_resource` (
  `resource_id` int(11) NOT NULL,
  `resource_name` varchar(20) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_resource
-- ----------------------------
INSERT INTO `rbac_resource` VALUES ('1', '音频');
INSERT INTO `rbac_resource` VALUES ('2', '视频');

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES ('1', 'admin');
INSERT INTO `rbac_role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_lock` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_user
-- ----------------------------
INSERT INTO `rbac_user` VALUES ('1', 'jiangtianxing', '123456', '\0');
INSERT INTO `rbac_user` VALUES ('2', 'lihangyu', '123948', '\0');
INSERT INTO `rbac_user` VALUES ('3', 'guanxin', '98493849', '');

-- ----------------------------
-- Table structure for rbac_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `rbac_usergroup`;
CREATE TABLE `rbac_usergroup` (
  `usergroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`usergroup_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `rbac_usergroup_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `rbac_user` (`user_id`),
  CONSTRAINT `rbac_usergroup_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `rbac_group` (`group_id`),
  CONSTRAINT `rbac_usergroup_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_usergroup
-- ----------------------------
INSERT INTO `rbac_usergroup` VALUES ('1', '1', '1', '1');
INSERT INTO `rbac_usergroup` VALUES ('2', '2', '2', '1');
INSERT INTO `rbac_usergroup` VALUES ('3', '2', '2', '2');
