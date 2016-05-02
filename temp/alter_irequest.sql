# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 10.11.2.38 (MySQL 5.6.16-64.2-56-log)
# Database: ttopen
# Generation Time: 2015-03-24 09:32:39 +0000
# ************************************************************


# Dump of table IMAdmin
# ------------------------------------------------------------

USE db_jiongmap;



DROP TABLE IF EXISTS `IMFriendsRequest`;

CREATE TABLE `IMFriendsRequest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `req_id` int(11) unsigned NOT NULL COMMENT '请求者',
  `rsp_id` int(11) unsigned NOT NULL COMMENT '被请求者',
  `req_info` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求信息',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '消息处理状态 0-正常，1-同意',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

