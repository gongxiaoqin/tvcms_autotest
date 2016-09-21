/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.77 : Database - tvcms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tvcms` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `app_upgrade_group` */

DROP TABLE IF EXISTS `app_upgrade_group`;

CREATE TABLE `app_upgrade_group` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) default NULL,
  `group_type` bigint(1) default NULL COMMENT '分组类型：1正式，根据厂商型号找到分组；2测试，根据mac找到分组',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用升级分组';

/*Data for the table `app_upgrade_group` */

LOCK TABLES `app_upgrade_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `app_upgrade_plan` */

DROP TABLE IF EXISTS `app_upgrade_plan`;

CREATE TABLE `app_upgrade_plan` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `software_code` varchar(256) NOT NULL COMMENT '应用升级包编码app_upgrade_software.code',
  `software_ver_code` varchar(256) NOT NULL COMMENT '应用升级包版本编码app_upgrade_software_ver.code',
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) default NULL,
  `upgrade_mode` bigint(1) default NULL COMMENT '升级方式0：没有升级文件1：需要立即强制升级2：提示升级4：静默升级',
  `group_code` varchar(256) default NULL COMMENT '升级分组编码',
  `upgrade_switch` bigint(1) default NULL COMMENT '升级开关0, 关1，开',
  `valid_start` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `valid_end` timestamp NOT NULL default '0000-00-00 00:00:00',
  `create_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用升级包版本';

/*Data for the table `app_upgrade_plan` */

LOCK TABLES `app_upgrade_plan` WRITE;

UNLOCK TABLES;

/*Table structure for table `app_upgrade_software` */

DROP TABLE IF EXISTS `app_upgrade_software`;

CREATE TABLE `app_upgrade_software` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) default NULL,
  `package_name` varchar(512) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用升级包';

/*Data for the table `app_upgrade_software` */

LOCK TABLES `app_upgrade_software` WRITE;

UNLOCK TABLES;

/*Table structure for table `app_upgrade_software_ver` */

DROP TABLE IF EXISTS `app_upgrade_software_ver`;

CREATE TABLE `app_upgrade_software_ver` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `app_code` varchar(256) NOT NULL COMMENT '应用升级包编码app_upgrade_software.code',
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) default NULL,
  `file_size` bigint(19) default NULL COMMENT '升级包文件大小',
  `file_url` varchar(256) default NULL COMMENT '升级包url',
  `file_hash` varchar(256) default NULL COMMENT '升级包md5值',
  `compress_type` bigint(1) default NULL COMMENT '升级包压缩类型1：tar，2：zip',
  `version` varchar(256) default NULL COMMENT '升级包版本',
  `upgrade_info_url` varchar(256) default NULL COMMENT '升级包介绍文件url',
  `upgrade_info_md5` varchar(256) default NULL COMMENT '升级包MD5数值',
  `upgrade_info_type` bigint(1) default NULL COMMENT '升级包介绍文件格式(0 文本 1.图片2.媒体类)',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用升级包版本';

/*Data for the table `app_upgrade_software_ver` */

LOCK TABLES `app_upgrade_software_ver` WRITE;

UNLOCK TABLES;

/*Table structure for table `app_upgrade_ver_control` */

DROP TABLE IF EXISTS `app_upgrade_ver_control`;

CREATE TABLE `app_upgrade_ver_control` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `app_code` varchar(256) NOT NULL COMMENT '应用升级包编码app_upgrade_software.code',
  `version` varchar(128) NOT NULL COMMENT '版本号',
  `provider` varchar(256) NOT NULL COMMENT '厂商',
  `model` varchar(256) NOT NULL COMMENT '型号',
  `valid_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '不强制升级的时间截至',
  `descr` varchar(1024) default NULL COMMENT '提示信息，将会显示在终端',
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用升级版本控制';

/*Data for the table `app_upgrade_ver_control` */

LOCK TABLES `app_upgrade_ver_control` WRITE;

UNLOCK TABLES;

/*Table structure for table `category_item_oper` */

DROP TABLE IF EXISTS `category_item_oper`;

CREATE TABLE `category_item_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `content_code` varchar(128) default NULL,
  `category_code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2582610 DEFAULT CHARSET=utf8 COMMENT='编排操作记录表';

/*Data for the table `category_item_oper` */

LOCK TABLES `category_item_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `content_bitrate` */

DROP TABLE IF EXISTS `content_bitrate`;

CREATE TABLE `content_bitrate` (
  `id` bigint(19) NOT NULL auto_increment,
  `content_code` varchar(128) default NULL,
  `content_name` varchar(128) default NULL,
  `bitrates` varchar(256) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `content_bitrate_content_code` (`content_code`)
) ENGINE=InnoDB AUTO_INCREMENT=732677 DEFAULT CHARSET=utf8 COMMENT='节目码流';

/*Data for the table `content_bitrate` */

LOCK TABLES `content_bitrate` WRITE;

UNLOCK TABLES;

/*Table structure for table `content_oper` */

DROP TABLE IF EXISTS `content_oper`;

CREATE TABLE `content_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  `program_type` bigint(1) default NULL COMMENT '节目类型：0=单剧集；1=多剧集',
  `episode_num` bigint(19) default NULL COMMENT '总集数',
  `md_episode_num` bigint(19) default NULL COMMENT '媒体对应第几集',
  `md_format` varchar(256) default NULL COMMENT '媒体格式',
  `del` varchar(512) default NULL COMMENT '删除的mdCode',
  `program_name` varchar(512) default NULL COMMENT '节目名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6052189 DEFAULT CHARSET=utf8 COMMENT='content操作记录表';

/*Data for the table `content_oper` */

LOCK TABLES `content_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject` */

DROP TABLE IF EXISTS `epg_subject`;

CREATE TABLE `epg_subject` (
  `ID` bigint(19) NOT NULL,
  `NAME` varchar(128) default NULL,
  `SHOW_NAME` varchar(128) default NULL,
  `CODE` varchar(128) default NULL,
  `STATUS` bigint(2) default NULL,
  `ICON` varchar(256) default NULL,
  `VALID_TIME` date default NULL,
  `EXPIRE_TIME` date default NULL,
  `CREATE_TIME` date default NULL,
  `UPDATE_TIME` date default NULL,
  `OPERATOR_ID` bigint(19) default NULL,
  `DESCRIPTION` varchar(256) default NULL,
  `STA_STATUS` bigint(2) default NULL,
  `SOURCE` varchar(64) default NULL,
  `DISPATCH_TIME` datetime default NULL,
  `RATIO` bigint(2) unsigned default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `EPG_SUBJECT_CODE_I` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject` */

LOCK TABLES `epg_subject` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject_ext` */

DROP TABLE IF EXISTS `epg_subject_ext`;

CREATE TABLE `epg_subject_ext` (
  `ID` bigint(19) NOT NULL,
  `NAME` varchar(128) default NULL,
  `SHOW_NAME` varchar(128) default NULL,
  `CODE` varchar(128) default NULL,
  `STATUS` bigint(2) default NULL,
  `ICON` varchar(256) default NULL,
  `VALID_TIME` date default NULL,
  `EXPIRE_TIME` date default NULL,
  `CREATE_TIME` date default NULL,
  `UPDATE_TIME` date default NULL,
  `OPERATOR_ID` bigint(19) default NULL,
  `DESCRIPTION` varchar(256) default NULL,
  `STA_STATUS` bigint(2) default NULL,
  `SOURCE` varchar(64) default NULL,
  `DISPATCH_TIME` datetime default NULL,
  `RATIO` bigint(2) default '0',
  `ONLINED_PROTOCOL` bigint(19) default NULL COMMENT '已上线的编码协议',
  `onlined_bitrate` varchar(2048) default NULL,
  `icon2` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»Ð¡Í¼',
  `big_image1` varchar(256) default NULL COMMENT 'Êú°æÍÆ¼öÎ»´óÍ¼',
  `big_image2` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»´óÍ¼',
  PRIMARY KEY  (`ID`),
  KEY `EPG_SUBJECT_CODE_I` (`CODE`),
  KEY `epg_subject_ext_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject_ext` */

LOCK TABLES `epg_subject_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject_page` */

DROP TABLE IF EXISTS `epg_subject_page`;

CREATE TABLE `epg_subject_page` (
  `ID` bigint(19) NOT NULL,
  `SUBJECT_ID` bigint(19) default NULL,
  `NAME` varchar(128) default NULL,
  `CODE` varchar(128) default NULL,
  `ICON` varchar(256) default NULL,
  `BACKGROUD_IMAGE` varchar(256) default NULL,
  `FIRST_PAGE` bigint(1) default NULL,
  `SOURCE` varchar(64) default NULL,
  `SUBJECT_CODE` varchar(128) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SUBJECT_ID` (`SUBJECT_ID`),
  KEY `EPG_SUBJECT_PAGE_I` (`SUBJECT_CODE`),
  CONSTRAINT `epg_subject_page_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `epg_subject` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject_page` */

LOCK TABLES `epg_subject_page` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject_page_ext` */

DROP TABLE IF EXISTS `epg_subject_page_ext`;

CREATE TABLE `epg_subject_page_ext` (
  `ID` bigint(19) NOT NULL,
  `SUBJECT_ID` bigint(19) default NULL,
  `NAME` varchar(128) default NULL,
  `CODE` varchar(128) default NULL,
  `ICON` varchar(256) default NULL,
  `BACKGROUD_IMAGE` varchar(256) default NULL,
  `FIRST_PAGE` bigint(1) default NULL,
  `SOURCE` varchar(64) default NULL,
  `SUBJECT_CODE` varchar(128) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `epg_subject_page_ext_subject_id` (`SUBJECT_ID`),
  KEY `epg_subject_page_ext_SUBJECT_CODE` (`SUBJECT_CODE`),
  CONSTRAINT `FK_epg_subject_page_ext_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `epg_subject_ext` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject_page_ext` */

LOCK TABLES `epg_subject_page_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject_region` */

DROP TABLE IF EXISTS `epg_subject_region`;

CREATE TABLE `epg_subject_region` (
  `ID` bigint(19) NOT NULL,
  `PAGE_ID` bigint(19) default NULL,
  `POSITION` varchar(19) default NULL,
  `OBJ_TYPE` varchar(16) default NULL,
  `OBJ_NAME` varchar(128) default NULL,
  `OBJ_CODE` varchar(128) default NULL,
  `DESCRIPTION` varchar(256) default NULL,
  `ENABLE_STATUS` bigint(10) default NULL,
  `SOURCE` varchar(64) default NULL,
  `SEQUENCE` bigint(19) default NULL,
  `PAGE_CODE` varchar(128) default NULL,
  `TV_OBJ_CODE` varchar(128) default NULL,
  `CATEGORY_CODE_PATH` varchar(128) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `PAGE_ID` (`PAGE_ID`),
  KEY `EPG_SUBJECT_REGION_I` (`PAGE_CODE`),
  CONSTRAINT `epg_subject_region_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `epg_subject_page` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject_region` */

LOCK TABLES `epg_subject_region` WRITE;

UNLOCK TABLES;

/*Table structure for table `epg_subject_region_ext` */

DROP TABLE IF EXISTS `epg_subject_region_ext`;

CREATE TABLE `epg_subject_region_ext` (
  `ID` bigint(19) NOT NULL,
  `PAGE_ID` bigint(19) default NULL,
  `POSITION` varchar(19) default NULL,
  `OBJ_TYPE` varchar(16) default NULL,
  `OBJ_NAME` varchar(128) default NULL,
  `OBJ_CODE` varchar(128) default NULL,
  `DESCRIPTION` varchar(256) default NULL,
  `ENABLE_STATUS` bigint(10) default NULL,
  `SOURCE` varchar(64) default NULL,
  `SEQUENCE` bigint(19) default NULL,
  `PAGE_CODE` varchar(128) default NULL,
  `TV_OBJ_CODE` varchar(128) default NULL,
  `CATEGORY_CODE_PATH` varchar(128) default NULL,
  `ONLINED_PROTOCOL` bigint(19) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `epg_subject_region_ext_PAGE_ID` (`PAGE_ID`),
  KEY `epg_subject_region_ext_PAGE_CODE` (`PAGE_CODE`),
  CONSTRAINT `FK_epg_subject_region_ext_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `epg_subject_page_ext` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `epg_subject_region_ext` */

LOCK TABLES `epg_subject_region_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `guide_video_oper` */

DROP TABLE IF EXISTS `guide_video_oper`;

CREATE TABLE `guide_video_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1663 DEFAULT CHARSET=utf8 COMMENT='导视操作记录表';

/*Data for the table `guide_video_oper` */

LOCK TABLES `guide_video_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_check_log` */

DROP TABLE IF EXISTS `order_check_log`;

CREATE TABLE `order_check_log` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `order_trans_no` varchar(255) default NULL COMMENT '百视通流水号',
  `partner_trans_no` varchar(255) default NULL COMMENT '运营商流水号',
  `bestv_user_id` varchar(255) default NULL COMMENT '百视通用户Id',
  `partner_user_id` varchar(255) default NULL COMMENT '运营商用户Id',
  `payment_account` varchar(255) default NULL COMMENT '支付账号',
  `bill_type` bigint(1) default NULL COMMENT '账单类型:0：用户订购的订单,1：包月取消续订的订单,2：包月自动续订',
  `bill_log` text COMMENT '账单日志详情',
  `check_time` datetime default NULL COMMENT '对账时间',
  `check_status` bigint(1) default NULL COMMENT '对账状态:0：一致，1：不一致，2：无比对数据，3：数据错误',
  `check_comment` text COMMENT '对账备注',
  `unsubscribe_type` bigint(1) default NULL COMMENT '退订类型:0：用户发起,1：平台自动续订失败',
  `payment_type` varchar(255) default NULL COMMENT '支付类型（贵州用） 0001 支付 0002 退款 0003 预授权 0004 预授权完成 0005 预授权撤销 0006 撤销',
  `old_payment_status` int(2) default NULL COMMENT '修改前支付状态',
  `new_payment_status` int(2) default NULL COMMENT '修改后支付状态',
  `old_order_extend` bigint(1) default NULL COMMENT '修改前否自动续订',
  `new_order_extend` bigint(1) default NULL COMMENT '修改后否自动续订',
  `old_expire_time` datetime default NULL COMMENT '修改前失效时间',
  `new_expire_time` datetime default NULL COMMENT '修改后失效时间',
  `remark` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='对账日志表';

/*Data for the table `order_check_log` */

LOCK TABLES `order_check_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_monthly` */

DROP TABLE IF EXISTS `order_monthly`;

CREATE TABLE `order_monthly` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `order_trans_no` varchar(256) default NULL COMMENT '流水号',
  `content_code` varchar(256) default NULL COMMENT '节目代码',
  `content_name` varchar(256) default NULL COMMENT '节目名称',
  `user_id` varchar(256) default NULL COMMENT '用户唯一标识',
  `order_type` bigint(1) default NULL COMMENT '订购类型:包月SVOD和PVOD',
  `product_code` varchar(256) default NULL COMMENT '产品表业务主键',
  `product_name` varchar(256) default NULL COMMENT '产品名称',
  `is_renew` bigint(1) default NULL COMMENT '0：不续订；1：续订；null：NA续订;null;NA',
  `unsubscribe_time` datetime default NULL COMMENT '退订时间',
  `valid_time` datetime default NULL COMMENT '生效时间',
  `expire_time` datetime default NULL COMMENT '过期时间',
  `order_extend` bigint(1) default '0' COMMENT '订购是否自动续订：0：关闭自动续订；1：开启自动续订',
  `order_time` datetime default NULL COMMENT '订购时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `pg_code` varchar(256) default NULL COMMENT '产品分组代码',
  `price` float(10,2) default NULL COMMENT '产品原价格',
  `discount_type` bigint(1) default NULL COMMENT '折扣方式:0：使用折扣率；1：使用折扣价格',
  `discount_rate_price` float(10,2) default NULL COMMENT '折扣率或价:如：0.8（8折）或4（4元）',
  `final_price` float(10,2) default NULL COMMENT '最终价格',
  `content_type` varchar(256) default NULL COMMENT '内容类型:以后用，频道、节目单等',
  `client_ip` varchar(256) default NULL COMMENT '客户端IP',
  `payment_status` int(2) default NULL COMMENT '支付状态:0：待支付；1支付成功；2支付失败',
  `category_code` varchar(128) default NULL COMMENT '栏目编码',
  `promotion_code` varchar(128) default NULL COMMENT '促销规则编码',
  `biz_type` int(2) default '1' COMMENT '业务类型:1：视频；2:APP',
  `payment_type` int(2) default NULL COMMENT '0:在线支付；1:套餐包赠送',
  `payment_account` varchar(256) default NULL COMMENT '支付帐号，暂时未用',
  `payment_timeout` int(11) default NULL,
  `pay_channel_code` varchar(64) default NULL,
  `subscription_status` int(11) default '0' COMMENT '订购状态,未订购：0,已订购：1,退续订处理中：2,已退续订：3,已过期：4',
  `product_price_code` varchar(64) default NULL COMMENT '价格代码',
  `bestv_family_id` varchar(64) default NULL COMMENT '百视通family账号',
  PRIMARY KEY  (`id`),
  KEY `TV_ORDER_INX` (`user_id`(255),`expire_time`,`order_time`,`payment_status`),
  KEY `index_bestv_family_id` (`bestv_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=810956 DEFAULT CHARSET=utf8 COMMENT='订购表_包月';

/*Data for the table `order_monthly` */

LOCK TABLES `order_monthly` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_monthly_bak` */

DROP TABLE IF EXISTS `order_monthly_bak`;

CREATE TABLE `order_monthly_bak` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `order_trans_no` varchar(256) default NULL COMMENT '流水号',
  `content_code` varchar(256) default NULL COMMENT '节目代码',
  `content_name` varchar(256) default NULL COMMENT '节目名称',
  `user_id` varchar(256) default NULL COMMENT '用户唯一标识',
  `order_type` bigint(1) default NULL COMMENT '订购类型:包月SVOD和PVOD',
  `product_code` varchar(256) default NULL COMMENT '产品表业务主键',
  `product_name` varchar(256) default NULL COMMENT '产品名称',
  `is_renew` bigint(1) default NULL COMMENT '0：不续订；1：续订；null：NA续订;null;NA',
  `unsubscribe_time` datetime default NULL COMMENT '退订时间',
  `valid_time` datetime default NULL COMMENT '生效时间',
  `expire_time` datetime default NULL COMMENT '过期时间',
  `order_extend` bigint(1) default NULL COMMENT '订购是否自动续订：0：关闭自动续订；1：开启自动续订',
  `order_time` datetime default NULL COMMENT '订购时间',
  `pg_code` varchar(256) default NULL COMMENT '产品分组代码',
  `price` float(10,2) default NULL COMMENT '产品原价格',
  `discount_type` bigint(1) default NULL COMMENT '折扣方式:0：使用折扣率；1：使用折扣价格',
  `discount_rate_price` float(10,2) default NULL COMMENT '折扣率或价:如：0.8（8折）或4（4元）',
  `final_price` float(10,2) default NULL COMMENT '最终价格',
  `content_type` varchar(256) default NULL COMMENT '内容类型:以后用，频道、节目单等',
  `client_ip` varchar(256) default NULL COMMENT '客户端IP',
  `payment_status` int(2) default NULL COMMENT '支付状态:0：待支付；1支付成功；2支付失败',
  `biz_type` int(2) default '1' COMMENT '业务类型:1：视频；2:APP',
  `category_code` varchar(128) default NULL COMMENT '栏目编码',
  `promotion_code` varchar(128) default NULL COMMENT '促销规则编码',
  `payment_type` int(2) default NULL COMMENT '0:在线支付；1:套餐包赠送',
  `payment_account` varchar(256) default NULL COMMENT '支付帐号，暂时未用',
  `update_time` datetime default NULL COMMENT '更新时间',
  `pay_channel_code` varchar(64) default NULL,
  `product_price_code` varchar(64) default NULL COMMENT '价格代码',
  PRIMARY KEY  (`id`),
  KEY `TV_ORDER_BAK_INX` (`user_id`(255),`expire_time`,`order_time`,`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5993 DEFAULT CHARSET=utf8 COMMENT='订购表_包月';

/*Data for the table `order_monthly_bak` */

LOCK TABLES `order_monthly_bak` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_pay_mapping` */

DROP TABLE IF EXISTS `order_pay_mapping`;

CREATE TABLE `order_pay_mapping` (
  `id` int(11) NOT NULL auto_increment,
  `orderno` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `channel_transactionid` varchar(50) default NULL,
  `insert_time` datetime default NULL,
  `pay_state` int(11) default NULL COMMENT '-1 失败 1 待支付 2成功',
  `update_time` datetime default NULL,
  `channel_code` varchar(20) default NULL,
  `channel_url` varchar(2000) default NULL,
  `channel_desc` varchar(1000) default NULL,
  `up_transeq` varchar(50) default NULL,
  `tran_date` varchar(20) default NULL,
  `retn_code` varchar(10) default NULL,
  `balance_date` varchar(12) default NULL,
  `serial_type` int(2) default '0',
  `mobile` varchar(11) default NULL,
  `result_code` varchar(20) default NULL,
  `result_msg` varchar(200) default NULL,
  `bestv_family_id` varchar(64) default NULL COMMENT '百视通family账号',
  PRIMARY KEY  (`id`),
  KEY `orderno` (`orderno`),
  KEY `index_bestv_family_id` (`bestv_family_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100650 DEFAULT CHARSET=utf8;

/*Data for the table `order_pay_mapping` */

LOCK TABLES `order_pay_mapping` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_payment_record` */

DROP TABLE IF EXISTS `order_payment_record`;

CREATE TABLE `order_payment_record` (
  `id` bigint(19) NOT NULL auto_increment,
  `order_code` varchar(64) default NULL COMMENT '本系统交易流水号',
  `order_type` int(2) default NULL COMMENT '订单类型：1:PPV;2:产品订购',
  `order_id` int(19) default NULL COMMENT '订单标识',
  `order_desc` varchar(128) default NULL COMMENT '交易描述',
  `status` int(2) default NULL COMMENT '支付状态：0：待支付；1支付成功；2支付失败',
  `price` float(10,2) default NULL COMMENT '交易金额',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '创建时间',
  `trans_code` varchar(64) default NULL COMMENT '支付平台交易流水号',
  `error_code` varchar(64) default NULL COMMENT '错误代码',
  `error_msg` varchar(256) default NULL COMMENT '错误信息',
  `source_type` int(2) default '1',
  `pay_channel_code` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_PAYRECORD_INX` (`order_id`,`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1573907 DEFAULT CHARSET=utf8 COMMENT='支付记录';

/*Data for the table `order_payment_record` */

LOCK TABLES `order_payment_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_ppv` */

DROP TABLE IF EXISTS `order_ppv`;

CREATE TABLE `order_ppv` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `order_trans_no` varchar(256) default NULL COMMENT '流水号',
  `content_code` varchar(256) default NULL COMMENT '节目代码',
  `content_name` varchar(256) default NULL COMMENT '节目名称',
  `user_id` varchar(256) default NULL COMMENT '用户唯一标识',
  `order_type` bigint(1) default NULL COMMENT '订购类型:包月SVOD和PVOD',
  `product_code` varchar(256) default NULL COMMENT '产品表业务主键',
  `product_name` varchar(256) default NULL COMMENT '产品名称',
  `valid_time` datetime default NULL COMMENT '生效时间',
  `expire_time` datetime default NULL COMMENT '过期时间',
  `order_time` datetime default NULL COMMENT '订购时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `pg_code` varchar(256) default NULL COMMENT '产品分组代码',
  `price` float(10,2) default NULL COMMENT '产品原价格',
  `discount_type` bigint(1) default NULL COMMENT '折扣方式:0：使用折扣率；1：使用折扣价格',
  `discount_rate_price` float(10,2) default NULL COMMENT '折扣率或价:如：0.8（8折）或4（4元）',
  `final_price` float(10,2) default NULL COMMENT '最终价格',
  `content_type` varchar(256) default NULL COMMENT '内容类型:以后用，频道、节目单等',
  `client_ip` varchar(256) default NULL COMMENT '客户端IP',
  `payment_status` int(2) default NULL COMMENT '支付状态:0：待支付；1支付成功；2支付失败',
  `category_code` varchar(128) default NULL COMMENT '栏目编码',
  `biz_type` int(2) default '1' COMMENT '业务类型:1：视频；2:APP',
  `payment_type` int(2) default NULL COMMENT '0:在线支付；1:套餐包赠送',
  `payment_account` varchar(256) default NULL COMMENT '支付帐号，暂时未用',
  `payment_timeout` int(11) default NULL,
  `pay_channel_code` varchar(64) default NULL,
  `product_price_code` varchar(64) default NULL COMMENT '价格代码',
  `bestv_family_id` varchar(64) default NULL COMMENT '百视通family账号',
  PRIMARY KEY  (`id`),
  KEY `TV_PPV_INX` (`user_id`(255),`expire_time`,`order_time`,`payment_status`,`content_code`(255)),
  KEY `index_bestv_family_id` (`bestv_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1085801 DEFAULT CHARSET=utf8 COMMENT='订购表_按次';

/*Data for the table `order_ppv` */

LOCK TABLES `order_ppv` WRITE;

UNLOCK TABLES;

/*Table structure for table `order_record_diff` */

DROP TABLE IF EXISTS `order_record_diff`;

CREATE TABLE `order_record_diff` (
  `id` bigint(19) unsigned NOT NULL auto_increment,
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `order_trans_no` varchar(256) NOT NULL COMMENT '本地订单id',
  `status` bigint(2) default NULL COMMENT '保留',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `order_record_diff` */

LOCK TABLES `order_record_diff` WRITE;

UNLOCK TABLES;

/*Table structure for table `oss_loss_registration` */

DROP TABLE IF EXISTS `oss_loss_registration`;

CREATE TABLE `oss_loss_registration` (
  `id` bigint(19) NOT NULL auto_increment,
  `terminal_provider` varchar(64) default NULL,
  `serial` varchar(128) default NULL,
  `user_name` varchar(128) default NULL,
  `address` varchar(256) default NULL,
  `telephone` varchar(32) default NULL,
  `mobile` varchar(32) default NULL,
  `reason` varchar(256) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;

/*Data for the table `oss_loss_registration` */

LOCK TABLES `oss_loss_registration` WRITE;

UNLOCK TABLES;

/*Table structure for table `recommend_oper` */

DROP TABLE IF EXISTS `recommend_oper`;

CREATE TABLE `recommend_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46899 DEFAULT CHARSET=utf8 COMMENT='推荐位操作记录表';

/*Data for the table `recommend_oper` */

LOCK TABLES `recommend_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `rel_app_upgrade_group` */

DROP TABLE IF EXISTS `rel_app_upgrade_group`;

CREATE TABLE `rel_app_upgrade_group` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `group_code` varchar(256) NOT NULL COMMENT '应用升级分组编码',
  `provider_code` varchar(256) default NULL COMMENT '厂商',
  `terminal_code` varchar(256) default NULL COMMENT '型号',
  `mac_start` varchar(256) default NULL,
  `mac_end` varchar(256) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关联应用升级分组';

/*Data for the table `rel_app_upgrade_group` */

LOCK TABLES `rel_app_upgrade_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_filter` */

DROP TABLE IF EXISTS `soft_upgrade_filter`;

CREATE TABLE `soft_upgrade_filter` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` varchar(2000) default NULL,
  `update_time` datetime default NULL,
  `insert_time` datetime default NULL,
  `mac_start` varchar(256) default NULL,
  `mac_end` varchar(256) default NULL,
  `provider_code` varchar(128) default NULL,
  `terminal_code` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_filter` */

LOCK TABLES `soft_upgrade_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_package` */

DROP TABLE IF EXISTS `soft_upgrade_package`;

CREATE TABLE `soft_upgrade_package` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL COMMENT 'Èí¼þ±êÊ¶Âë\r\n            Ä¿Ç°Ö»ÓÐÐ¾Æ¬ÏµÍ³Éý¼¶Âë£ºFirmwareVersion',
  `name` varchar(128) default NULL COMMENT 'Èí¼þÃû³Æ\n',
  `size` bigint(20) default NULL COMMENT 'Èí¼þ´óÐ¡£¬µ¥Î»×Ö½Ú',
  `file_url` varchar(256) default NULL COMMENT 'Éý¼¶Èí¼þ°üµØÖ·²ÉÓÃhttp·½Ê½',
  `file_hash` varchar(128) default NULL COMMENT 'Éý¼¶Èí¼þ°üMD5Öµ',
  `compress_type` int(11) default NULL COMMENT 'Ñ¹Ëõ·½Ê½:1:tar;2:zip',
  `version` varchar(128) default NULL COMMENT 'µ±Ç°°æ±¾',
  `pkg_type` int(11) default NULL COMMENT 'Éý¼¶°üÀàÐÍ:1:Èí¼þÉý¼¶°ü2£ºÍ¼Æ¬Éý¼¶°ü3£ºÄ£°å',
  `insert_time` datetime default NULL COMMENT '¼ÇÂ¼´´½¨Ê±¼ä',
  `update_time` datetime default NULL COMMENT '¼ÇÂ¼ÐÞ¸ÄÊ±¼ä',
  `tv_provider` varchar(128) default NULL,
  `tv_model` varchar(128) default NULL,
  `compatible_version` varchar(128) default NULL,
  `descrip` varchar(256) default NULL,
  `pic` varchar(256) default NULL,
  `upgrade_mode` int(11) default NULL,
  `powder_on_update_mode` int(11) default NULL,
  `powder_on_file_version` varchar(128) default NULL,
  `powder_on_file_hash` varchar(128) default NULL,
  `powder_on_file_url` varchar(256) default NULL,
  `loading_update_mode` int(11) default NULL,
  `loading_file_version` varchar(128) default NULL,
  `loading_file_hash` varchar(128) default NULL,
  `loading_file_url` varchar(256) default NULL,
  `del_status` int(11) default NULL,
  `sup_group_code` varchar(128) default '*',
  `upgrade_info` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1521 DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_package` */

LOCK TABLES `soft_upgrade_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_plan` */

DROP TABLE IF EXISTS `soft_upgrade_plan`;

CREATE TABLE `soft_upgrade_plan` (
  `id` bigint(19) NOT NULL auto_increment COMMENT 'id',
  `code` varchar(128) default NULL COMMENT '软件标识码\r\n            目前只有芯片系统升级码：FirmwareVersion',
  `t_provider` varchar(128) default NULL COMMENT '厂商',
  `t_model` varchar(128) default NULL COMMENT '型号',
  `cur_version` varchar(128) default NULL COMMENT '当前版本',
  `upgrade_switch` int(11) default NULL COMMENT '升级开关 1：开 0：关',
  `insert_time` datetime default NULL COMMENT '记录创建时间',
  `update_time` datetime default NULL COMMENT '记录修改时间',
  `des` varchar(512) default NULL,
  `GROUP_CODE` varchar(4000) default NULL,
  `package_code` varchar(2000) default NULL,
  `not_sup_version` varchar(2000) default NULL,
  `plan_type` int(2) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1621 DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_plan` */

LOCK TABLES `soft_upgrade_plan` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_result_report` */

DROP TABLE IF EXISTS `soft_upgrade_result_report`;

CREATE TABLE `soft_upgrade_result_report` (
  `id` bigint(19) NOT NULL auto_increment COMMENT 'id',
  `user_id` varchar(32) default NULL COMMENT '用户ID',
  `tv_profile` varchar(128) default NULL COMMENT 'tv_profile',
  `tv_provider` varchar(128) default NULL COMMENT '厂商',
  `tv_model` varchar(128) default NULL COMMENT '型号',
  `soft_code` varchar(128) default NULL COMMENT '软件升级包CODE',
  `org_soft_version` varchar(128) default NULL COMMENT '升级前软件版本信息',
  `cur_soft_version` varchar(128) default NULL COMMENT '升级后软件版本信息',
  `status` int(11) default NULL COMMENT '升级状态:1:表示成功；2：表示失败 默认为1',
  `insert_time` datetime default NULL COMMENT '记录创建时间',
  `user_ip` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_result_report` */

LOCK TABLES `soft_upgrade_result_report` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_sub_group` */

DROP TABLE IF EXISTS `soft_upgrade_sub_group`;

CREATE TABLE `soft_upgrade_sub_group` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` varchar(2000) default NULL,
  `update_time` datetime default NULL,
  `insert_time` datetime default NULL,
  `provider_code` varchar(128) default NULL,
  `terminal_code` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620 DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_sub_group` */

LOCK TABLES `soft_upgrade_sub_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `soft_upgrade_sub_group_config` */

DROP TABLE IF EXISTS `soft_upgrade_sub_group_config`;

CREATE TABLE `soft_upgrade_sub_group_config` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) default NULL,
  `group_code` varchar(128) default NULL,
  `mac_start` varchar(128) default NULL,
  `mac_end` varchar(128) default NULL,
  `update_time` datetime default NULL,
  `insert_time` datetime default NULL,
  `provider_code` varchar(256) default NULL,
  `terminal_code` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `soft_upgrade_sub_group_config` */

LOCK TABLES `soft_upgrade_sub_group_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `subject_oper` */

DROP TABLE IF EXISTS `subject_oper`;

CREATE TABLE `subject_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3211 DEFAULT CHARSET=utf8 COMMENT='专辑操作记录表';

/*Data for the table `subject_oper` */

LOCK TABLES `subject_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `tmp_allmaclist` */

DROP TABLE IF EXISTS `tmp_allmaclist`;

CREATE TABLE `tmp_allmaclist` (
  `a` varchar(384) character set utf8 default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_allmaclist` */

LOCK TABLES `tmp_allmaclist` WRITE;

UNLOCK TABLES;

/*Table structure for table `tmp_gm` */

DROP TABLE IF EXISTS `tmp_gm`;

CREATE TABLE `tmp_gm` (
  `sn` varchar(2000) default NULL,
  KEY `sn` (`sn`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tmp_gm` */

LOCK TABLES `tmp_gm` WRITE;

UNLOCK TABLES;

/*Table structure for table `tmp_maclist` */

DROP TABLE IF EXISTS `tmp_maclist`;

CREATE TABLE `tmp_maclist` (
  `a` varchar(384) character set utf8 default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_maclist` */

LOCK TABLES `tmp_maclist` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_account` */

DROP TABLE IF EXISTS `tv_account`;

CREATE TABLE `tv_account` (
  `id` bigint(20) NOT NULL auto_increment,
  `custom_id` bigint(20) default NULL,
  `account_no` varchar(64) default NULL,
  `account_type` int(11) default NULL,
  `valid_time` datetime default NULL,
  `expire_time` datetime default NULL,
  `priority` int(11) default NULL,
  `balance` float(10,2) default NULL,
  `freeze` float(10,2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2182094 DEFAULT CHARSET=utf8;

/*Data for the table `tv_account` */

LOCK TABLES `tv_account` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_account_local` */

DROP TABLE IF EXISTS `tv_account_local`;

CREATE TABLE `tv_account_local` (
  `id` bigint(20) NOT NULL auto_increment,
  `custom_id` bigint(20) default NULL,
  `account_no` varchar(64) default NULL,
  `account_type` int(11) default NULL,
  `valid_time` datetime default NULL,
  `expire_time` datetime default NULL,
  `priority` int(11) default NULL,
  `balance` float(10,2) default NULL,
  `freeze` float(10,2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_custom_id` (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10855878 DEFAULT CHARSET=utf8;

/*Data for the table `tv_account_local` */

LOCK TABLES `tv_account_local` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_account_local_ext` */

DROP TABLE IF EXISTS `tv_account_local_ext`;

CREATE TABLE `tv_account_local_ext` (
  `id` bigint(20) NOT NULL auto_increment,
  `custom_id` bigint(20) default NULL,
  `account_no` varchar(64) default NULL,
  `account_type` int(11) default NULL,
  `valid_time` datetime default NULL,
  `expire_time` datetime default NULL,
  `priority` int(11) default NULL,
  `freeze` float default '0',
  `balance` float default '0',
  PRIMARY KEY  (`id`),
  KEY `index_ext_custom_id` (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13834768 DEFAULT CHARSET=utf8;

/*Data for the table `tv_account_local_ext` */

LOCK TABLES `tv_account_local_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_ad_mgmt` */

DROP TABLE IF EXISTS `tv_ad_mgmt`;

CREATE TABLE `tv_ad_mgmt` (
  `id` int(19) NOT NULL auto_increment,
  `name` varchar(256) default NULL,
  `code` varchar(256) default NULL,
  `ad_pic` varchar(256) default NULL,
  `ad_video` varchar(256) default NULL,
  `ad_format` int(2) default NULL COMMENT '0：图片；1：视频',
  `ad_type` int(2) default NULL COMMENT '0：前；1：中；2：后插',
  `user_group_code` varchar(384) default NULL COMMENT '业务分组code',
  `category_code` varchar(384) default NULL,
  `descr` varchar(256) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  `mid_position` int(19) default NULL COMMENT 'ad_type=1时，用此属性',
  `content_length` int(19) default NULL,
  `sub_group_code` varchar(256) default NULL COMMENT '用户分组',
  `is_ad_batch` int(2) default NULL COMMENT '投放广告的节目：0，单播；1，联播',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告投放信息表';

/*Data for the table `tv_ad_mgmt` */

LOCK TABLES `tv_ad_mgmt` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_adaptation_rule` */

DROP TABLE IF EXISTS `tv_adaptation_rule`;

CREATE TABLE `tv_adaptation_rule` (
  `id` bigint(19) NOT NULL auto_increment,
  `rule_name` varchar(256) default NULL COMMENT 'è§„åˆ™åç§°',
  `rule_code` varchar(32) default NULL COMMENT '规则编码',
  `user_id` varchar(32) default NULL COMMENT '用户ID',
  `provider_code` varchar(32) default NULL COMMENT '厂商编码',
  `user_type` varchar(2) default NULL,
  `terminal_model` varchar(32) default NULL COMMENT '厂商型号',
  `terminal_type` varchar(2) default NULL,
  `bcti_version` varchar(32) default NULL COMMENT 'BCTI版本号',
  `player_version` varchar(32) default NULL COMMENT '播放器版本号',
  `user_group_code` varchar(32) default NULL COMMENT '业务分组',
  `product_group_code` varchar(32) default NULL COMMENT '资费分组',
  `terminal_group_code` varchar(32) default NULL COMMENT '终端分组',
  `media_encoding_protocol` bigint(19) default NULL COMMENT '媒体编码协议',
  `is_support_ad` int(1) default NULL COMMENT '是否支持广告:0:不支持, 1:支持',
  `is_support_bsd` int(1) default NULL COMMENT '是否支持bsd:0:不支持, 1:支持',
  `picture` int(1) default NULL COMMENT '图片：默认0：CTV，1：PAD',
  `update_time` datetime default NULL,
  `cdn_priority` varchar(512) default NULL,
  `remark` varchar(2000) default NULL COMMENT 'å¤‡æ³¨',
  `template_type` int(2) default '5' COMMENT 'æ¨¡æ¿ç±»åž‹ï¼Œ1ï¼šå¹¿å‘Šç±»ï¼›2ï¼šæœåŠ¡é¢„å‡çº§ç±»ï¼›3ï¼šcdnæ™ºèƒ½ç­›é€‰ç±»ï¼›4ï¼šå…¨èƒ½ç±»;5ï¼šäº§å“ç³»åˆ—é»˜è®¤ç±»;6ï¼šç”¨æˆ·/macç‰¹ä¾‹ç±»',
  `audio_format` int(2) default NULL,
  `content_group_code` varchar(128) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_adaptation_rule_user_id` (`user_id`),
  KEY `tv_adaptation_provider_code` (`provider_code`),
  KEY `tv_adaptation_rule_code` (`rule_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8 COMMENT='ç»ˆç«¯è¾“å‡ºæ¨¡æ¿';

/*Data for the table `tv_adaptation_rule` */

LOCK TABLES `tv_adaptation_rule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_app_operation_group` */

DROP TABLE IF EXISTS `tv_app_operation_group`;

CREATE TABLE `tv_app_operation_group` (
  `id` bigint(19) NOT NULL,
  `code` varchar(19) NOT NULL,
  `app_code` varchar(19) NOT NULL COMMENT '应用的code',
  `operation_code` varchar(19) NOT NULL COMMENT '运营商code',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_app_operation_group` */

LOCK TABLES `tv_app_operation_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_app_version` */

DROP TABLE IF EXISTS `tv_app_version`;

CREATE TABLE `tv_app_version` (
  `id` bigint(19) NOT NULL,
  `code` varchar(19) NOT NULL,
  `package_name` varchar(256) NOT NULL COMMENT '应用包名',
  `pack_show_name` varchar(128) NOT NULL COMMENT '应用显示名称',
  `tag` varchar(128) default NULL COMMENT '应用分类名称',
  `app_code` varchar(19) NOT NULL COMMENT '应用的code',
  `soft_version` varchar(128) NOT NULL COMMENT '终端软件版本信息',
  `app_version` varchar(64) NOT NULL COMMENT '应用版本信息',
  `url` varchar(256) default NULL COMMENT '升级包URL地址',
  `hash` varchar(128) default NULL COMMENT '升级包hashmd5值',
  `app_status` int(1) NOT NULL COMMENT '应用状态',
  `action` int(1) NOT NULL,
  `operation_group_code` varchar(19) NOT NULL COMMENT '运营商分组',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_app_version` */

LOCK TABLES `tv_app_version` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_application` */

DROP TABLE IF EXISTS `tv_application`;

CREATE TABLE `tv_application` (
  `id` bigint(19) NOT NULL,
  `code` varchar(19) NOT NULL COMMENT '应用的code',
  `package_name` varchar(256) NOT NULL COMMENT '应用包名',
  `pack_show_name` varchar(128) NOT NULL COMMENT '应用显示名称',
  `tag` varchar(128) default NULL COMMENT '应用分类名称',
  `description` varchar(256) default NULL COMMENT '应用描述信息',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_application` */

LOCK TABLES `tv_application` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_area` */

DROP TABLE IF EXISTS `tv_area`;

CREATE TABLE `tv_area` (
  `id` int(19) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `des` varchar(128) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_area` */

LOCK TABLES `tv_area` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_area_ip_config` */

DROP TABLE IF EXISTS `tv_area_ip_config`;

CREATE TABLE `tv_area_ip_config` (
  `id` int(19) NOT NULL,
  `code` varchar(128) default NULL,
  `area_code` varchar(128) default NULL,
  `ip_start` varchar(128) default NULL,
  `ip_end` varchar(128) default NULL,
  `des` varchar(128) default NULL,
  `area_id` varchar(128) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_area_ip_config` */

LOCK TABLES `tv_area_ip_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_auth_url` */

DROP TABLE IF EXISTS `tv_auth_url`;

CREATE TABLE `tv_auth_url` (
  `id` bigint(19) NOT NULL,
  `auth_code` varchar(256) NOT NULL,
  `auth_url` varchar(256) NOT NULL,
  `auth_name` varchar(256) NOT NULL,
  `type` bigint(1) default NULL,
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='认证地址管理';

/*Data for the table `tv_auth_url` */

LOCK TABLES `tv_auth_url` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_bctiversion` */

DROP TABLE IF EXISTS `tv_bctiversion`;

CREATE TABLE `tv_bctiversion` (
  `id` bigint(19) NOT NULL auto_increment COMMENT 'BCTI版本的id',
  `version_code` varchar(200) default NULL COMMENT '版本code',
  `remark` varchar(2000) default NULL COMMENT '备注',
  `provider_code` varchar(32) default NULL,
  `terminal_model` varchar(32) default NULL,
  `type` int(1) default NULL,
  `flowFlag` int(1) default NULL COMMENT '流程控制',
  `busiType` varchar(32) NOT NULL default 'CTV' COMMENT 'ä¸šåŠ¡ç±»åž‹',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tv_bctiversion` */

LOCK TABLES `tv_bctiversion` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_bitr_encode_prot_audio_enu` */

DROP TABLE IF EXISTS `tv_bitr_encode_prot_audio_enu`;

CREATE TABLE `tv_bitr_encode_prot_audio_enu` (
  `id` int(19) NOT NULL,
  `encode` varchar(32) character set utf8 default NULL COMMENT '编码',
  `protocol` varchar(32) character set utf8 default NULL COMMENT '协议',
  `digit` int(19) default NULL COMMENT '位数',
  `bitrate` varchar(32) character set utf8 default NULL COMMENT '码流',
  `audio` varchar(32) character set utf8 default NULL COMMENT '音频'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_bitr_encode_prot_audio_enu` */

LOCK TABLES `tv_bitr_encode_prot_audio_enu` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_bitrate_encode_protocol_enu` */

DROP TABLE IF EXISTS `tv_bitrate_encode_protocol_enu`;

CREATE TABLE `tv_bitrate_encode_protocol_enu` (
  `id` bigint(19) NOT NULL auto_increment,
  `encode` varchar(32) default NULL,
  `protocol` varchar(32) default NULL,
  `digit` bigint(19) default NULL,
  `bitrate` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

/*Data for the table `tv_bitrate_encode_protocol_enu` */

LOCK TABLES `tv_bitrate_encode_protocol_enu` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_bitrate_model` */

DROP TABLE IF EXISTS `tv_bitrate_model`;

CREATE TABLE `tv_bitrate_model` (
  `id` int(11) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` varchar(2000) default NULL,
  `bitrate_code` varchar(128) default NULL,
  `audio_format` int(2) default NULL,
  `priority` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_bitrate_model` */

LOCK TABLES `tv_bitrate_model` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_bitrate_model_20130227` */

DROP TABLE IF EXISTS `tv_bitrate_model_20130227`;

CREATE TABLE `tv_bitrate_model_20130227` (
  `id` int(11) NOT NULL,
  `code` varchar(128) character set utf8 default NULL,
  `name` varchar(128) character set utf8 default NULL,
  `description` varchar(2000) character set utf8 default NULL,
  `bitrate_code` varchar(128) character set utf8 default NULL,
  `audio_format` int(2) default NULL,
  `priority` int(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_bitrate_model_20130227` */

LOCK TABLES `tv_bitrate_model_20130227` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_card` */

DROP TABLE IF EXISTS `tv_card`;

CREATE TABLE `tv_card` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) NOT NULL,
  `package_code` varchar(128) NOT NULL COMMENT '套餐code',
  `series` varchar(128) NOT NULL COMMENT '点卡上面的序列号',
  `activated_time_start` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '点卡有效充值时间开始',
  `activated_time_end` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '点卡有效充值时间结束',
  `publish_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tv_card_unique` (`code`,`series`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点卡';

/*Data for the table `tv_card` */

LOCK TABLES `tv_card` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_card_activate_record` */

DROP TABLE IF EXISTS `tv_card_activate_record`;

CREATE TABLE `tv_card_activate_record` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) default NULL,
  `card_code` varchar(256) NOT NULL COMMENT 'tv_card表的code',
  `series` varchar(256) NOT NULL COMMENT '点卡上面的序列号',
  `package_code` varchar(256) default NULL COMMENT '套餐code',
  `activated_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '激活时间',
  `user_account` varchar(128) default NULL,
  `create_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5154 DEFAULT CHARSET=utf8 COMMENT='点卡激活记录';

/*Data for the table `tv_card_activate_record` */

LOCK TABLES `tv_card_activate_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cate_filter` */

DROP TABLE IF EXISTS `tv_cate_filter`;

CREATE TABLE `tv_cate_filter` (
  `id` int(11) NOT NULL auto_increment,
  `user_group_code` varchar(1024) default NULL,
  `category_code` varchar(1024) default NULL,
  `terminal_provider_code` varchar(1024) default NULL,
  `terminal_model` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_cate_filter` */

LOCK TABLES `tv_cate_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_category` */

DROP TABLE IF EXISTS `tv_category`;

CREATE TABLE `tv_category` (
  `id` bigint(20) NOT NULL default '0',
  `code` varchar(128) default NULL,
  `parent_code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` text,
  `icon1` varchar(128) default NULL,
  `icon2` varchar(128) default NULL,
  `big_image1` varchar(128) default NULL,
  `big_image2` varchar(128) default NULL,
  `child_number` int(11) default NULL,
  `display_mode` int(11) default NULL,
  `template_code` varchar(64) default NULL,
  `sequence` int(4) NOT NULL default '0',
  `status` int(1) NOT NULL default '1',
  `site_code` varchar(128) default NULL,
  `type` int(11) NOT NULL default '1',
  `reference_code` varchar(128) default NULL,
  `kind` int(11) default '0',
  `url` varchar(256) default NULL,
  `pop_rel_category` varchar(24) default '',
  `pop_type` varchar(24) default '',
  `ott_small_image` varchar(256) default NULL,
  `icon3` varchar(256) default NULL COMMENT 'Êú°æÍÆ¼öÎ»Ð¡Í¼±ê',
  `big_image3` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»Ð¡Í¼±ê',
  `category_name_image1` varchar(256) default NULL COMMENT '分类名字图片A',
  `category_name_image2` varchar(256) default NULL COMMENT '分类名字图片B',
  `show_way` int(2) default '0' COMMENT '展示方式 0:普通展示,1:颗粒化展示',
  `mark_uri` varchar(256) default NULL COMMENT '角标路径',
  `mark_position` int(2) default NULL COMMENT '角标位置',
  `nav_recommend` varchar(256) default NULL COMMENT '栏目推荐位',
  `search_tags` varchar(100) default NULL COMMENT '对应多个tv_search_tag中的search_type 格式如下：|0|1|2|',
  `tag_type` int(2) default '0',
  `SEARCH_FLAG` int(11) default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `TV_CATEGORY_CODE_I` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_category` */

LOCK TABLES `tv_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_category_filter` */

DROP TABLE IF EXISTS `tv_category_filter`;

CREATE TABLE `tv_category_filter` (
  `id` int(11) NOT NULL auto_increment,
  `category_code` varchar(1024) NOT NULL,
  `type` int(11) NOT NULL default '0' COMMENT '¹ýÂË·½Ê½,0:¹ýÂË;1:±£Áô',
  `app_code` varchar(1024) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_CTG_FILTER_I` (`app_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Data for the table `tv_category_filter` */

LOCK TABLES `tv_category_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_category_item` */

DROP TABLE IF EXISTS `tv_category_item`;

CREATE TABLE `tv_category_item` (
  `id` bigint(20) NOT NULL,
  `visible_status` int(11) default NULL,
  `icon1` varchar(1024) default NULL,
  `icon2` varchar(1024) default NULL,
  `content_type` int(11) default NULL,
  `content_code` varchar(128) default NULL,
  `category_code` varchar(128) default NULL,
  `show_name` varchar(128) default NULL,
  `begin_time` datetime default NULL,
  `end_time` datetime default NULL,
  `description` text,
  `item_type` int(11) default NULL,
  `item_index` int(11) default NULL,
  `insert_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_CATEGORY_ITEM_I` (`category_code`),
  KEY `TV_CATEGORY_ITEM_CONTC_I` (`content_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_category_item` */

LOCK TABLES `tv_category_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_category_item_ext` */

DROP TABLE IF EXISTS `tv_category_item_ext`;

CREATE TABLE `tv_category_item_ext` (
  `id` bigint(20) NOT NULL,
  `visible_status` int(11) default NULL,
  `icon1` varchar(1024) default NULL,
  `icon2` varchar(1024) default NULL,
  `content_type` int(11) default NULL,
  `content_code` varchar(128) default NULL,
  `category_code` varchar(128) default NULL,
  `show_name` varchar(128) default NULL,
  `ipd_show_name` varchar(128) default NULL,
  `begin_time` datetime default NULL,
  `end_time` datetime default NULL,
  `description` text,
  `item_type` int(11) default NULL,
  `item_index` int(11) default NULL,
  `insert_time` datetime default NULL,
  `onlined_protocol` bigint(19) default NULL,
  `onlined_bitrate` varchar(2048) default NULL,
  `onlined_protocol_audio` varchar(512) default NULL COMMENT '已经上线的带音频的编码协议码流音频',
  PRIMARY KEY  (`id`),
  KEY `tv_category_item_ext_category_code` (`category_code`),
  KEY `tv_category_item_ext_content_code` (`content_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展';

/*Data for the table `tv_category_item_ext` */

LOCK TABLES `tv_category_item_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cdn_play_suffix` */

DROP TABLE IF EXISTS `tv_cdn_play_suffix`;

CREATE TABLE `tv_cdn_play_suffix` (
  `id` int(11) NOT NULL auto_increment,
  `operatorGroup` varchar(1024) NOT NULL,
  `suffix` varchar(1024) NOT NULL,
  `url_pattern` varchar(1024) default NULL COMMENT 'HLSVodService.m3u8',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tv_cdn_play_suffix` */

LOCK TABLES `tv_cdn_play_suffix` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cdn_server_entry` */

DROP TABLE IF EXISTS `tv_cdn_server_entry`;

CREATE TABLE `tv_cdn_server_entry` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL default '0' COMMENT '0:Í£ÓÃ;1:Õý³£',
  `code` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tv_cdn_server_entry` */

LOCK TABLES `tv_cdn_server_entry` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cdn_server_entry_patch` */

DROP TABLE IF EXISTS `tv_cdn_server_entry_patch`;

CREATE TABLE `tv_cdn_server_entry_patch` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL default '0' COMMENT '0:Í£ÓÃ;1:Õý³£',
  `code` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tv_cdn_server_entry_patch` */

LOCK TABLES `tv_cdn_server_entry_patch` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_channel` */

DROP TABLE IF EXISTS `tv_channel`;

CREATE TABLE `tv_channel` (
  `id` bigint(20) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` text,
  `type` int(11) default NULL,
  `timeshift_duration` int(11) default NULL,
  `small_image1` varchar(128) default NULL,
  `small_image2` varchar(128) default NULL,
  `big_image1` varchar(128) default NULL,
  `big_image2` varchar(128) default NULL,
  `reserve1` varchar(128) default NULL,
  `reserve2` varchar(128) default NULL,
  `reserve3` varchar(128) default NULL,
  `reserve4` varchar(128) default NULL,
  `reserve5` varchar(128) default NULL,
  `package_code` text COMMENT '产品包唯一编码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_channel` */

LOCK TABLES `tv_channel` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_chip_type` */

DROP TABLE IF EXISTS `tv_chip_type`;

CREATE TABLE `tv_chip_type` (
  `id` bigint(19) NOT NULL,
  `name` varchar(256) default NULL,
  `code` varchar(256) default NULL,
  `terminal_id` bigint(19) default NULL,
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `UPDATE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00',
  `CREATOR_ID` bigint(19) default NULL,
  `MENDER_ID` bigint(19) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_chip_type` */

LOCK TABLES `tv_chip_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cloud_recom_source_config` */

DROP TABLE IF EXISTS `tv_cloud_recom_source_config`;

CREATE TABLE `tv_cloud_recom_source_config` (
  `id` bigint(19) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL COMMENT 'ÅäÖÃcode',
  `cloud_rem_code` varchar(128) NOT NULL COMMENT 'ÔÆÍÆ¼öÎ»code',
  `source_type` int(2) NOT NULL COMMENT 'Êý¾ÝÔ´ÀàÐÍ£º1£¬À¸Ä¿£»2£¬À¸Ä¿±àÅÅ£»3£¬ÍÆ¼öÎ»±àÅÅ',
  `content_type` varchar(128) default NULL COMMENT 'ÄÚÈÝÀàÐÍ£ºVOD=1,ÆµµÀ=2,·ÖÀà=4,URL=5,×¨¼­=6',
  `category_path` varchar(200) NOT NULL COMMENT 'À¸Ä¿Â·¾¶»òÕßÍÆ¼öÎ»code',
  `record_number` int(11) NOT NULL COMMENT '»ñÈ¡¼ÇÂ¼Êý',
  `sort` varchar(20) NOT NULL COMMENT 'ÅÅÐòË³Ðò£º0:asc¡¢1:desc',
  `source_sort` int(11) NOT NULL COMMENT 'Êý¾ÝÔ´ÅÅÐòºÅ',
  `update_time` datetime default NULL COMMENT '¸üÐÂÊ±¼ä',
  `user_group_code` varchar(4000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_cloud_recom_source_config` */

LOCK TABLES `tv_cloud_recom_source_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_cloud_recommend` */

DROP TABLE IF EXISTS `tv_cloud_recommend`;

CREATE TABLE `tv_cloud_recommend` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) NOT NULL COMMENT 'ÔÆÍÆ¼öÎ»code',
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) default NULL COMMENT 'ÃèÊöÐÅÏ¢',
  `horizontal_big` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»´óÍ¼',
  `horizontal_small` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»Ð¡Í¼',
  `upright_big` varchar(256) default NULL COMMENT 'Êú°æÍÆ¼öÎ»´óÍ¼',
  `upright_small` varchar(256) default NULL COMMENT 'Êú°æÍÆ¼öÎ»Ð¡Í¼',
  `default_category_code` varchar(128) default NULL COMMENT 'Ä¬ÈÏ°ó¶¨À¸Ä¿±àÂë',
  `default_category_path` varchar(256) default NULL COMMENT 'Ä¬ÈÏ°ó¶¨À¸Ä¿Â·¾¶',
  `update_time` datetime default NULL COMMENT '¸üÐÂÊ±¼ä',
  `is_used_by_ott` int(11) default '0',
  `mode` int(2) default '2' COMMENT '应用显示模式',
  `res_uri` varchar(256) default NULL COMMENT '资源URL',
  `target_type` int(2) default '1' COMMENT '关联类型',
  `package_name` varchar(256) default NULL COMMENT '包名字',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_cloud_recommend` */

LOCK TABLES `tv_cloud_recommend` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_comment` */

DROP TABLE IF EXISTS `tv_comment`;

CREATE TABLE `tv_comment` (
  `id` bigint(19) NOT NULL auto_increment,
  `user_id` varchar(128) NOT NULL COMMENT '用户ID',
  `item_code` varchar(128) NOT NULL COMMENT '节目code',
  `nick_name` varchar(200) NOT NULL COMMENT '用户昵称',
  `comment` varchar(2000) default NULL COMMENT '评论信息',
  `ip` varchar(128) default NULL,
  `insert_time` datetime default NULL COMMENT '插入时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_comment` */

LOCK TABLES `tv_comment` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_content_genre` */

DROP TABLE IF EXISTS `tv_content_genre`;

CREATE TABLE `tv_content_genre` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目类型表';

/*Data for the table `tv_content_genre` */

LOCK TABLES `tv_content_genre` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_content_group` */

DROP TABLE IF EXISTS `tv_content_group`;

CREATE TABLE `tv_content_group` (
  `id` int(19) NOT NULL,
  `content_group_code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `remark` varchar(128) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_content_group` */

LOCK TABLES `tv_content_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_control_pack_down_num` */

DROP TABLE IF EXISTS `tv_control_pack_down_num`;

CREATE TABLE `tv_control_pack_down_num` (
  `id` bigint(19) NOT NULL,
  `down_num` int(10) default '500',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_control_pack_down_num` */

LOCK TABLES `tv_control_pack_down_num` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_country` */

DROP TABLE IF EXISTS `tv_country`;

CREATE TABLE `tv_country` (
  `id` int(19) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_country` */

LOCK TABLES `tv_country` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_customer` */

DROP TABLE IF EXISTS `tv_customer`;

CREATE TABLE `tv_customer` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `name` varchar(64) default NULL,
  `sex` int(11) default NULL,
  `birthday` varchar(10) default NULL,
  `id_type` int(11) default NULL,
  `id_number` varchar(20) default NULL,
  `address` text,
  `post_code` varchar(64) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `mobile_phone` varchar(16) default NULL,
  `country` varchar(256) default NULL,
  `province` varchar(256) default NULL,
  `city` varchar(256) default NULL,
  `icon` varchar(256) default NULL,
  `favorite` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_customer_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2182214 DEFAULT CHARSET=utf8;

/*Data for the table `tv_customer` */

LOCK TABLES `tv_customer` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_customer_local` */

DROP TABLE IF EXISTS `tv_customer_local`;

CREATE TABLE `tv_customer_local` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `name` varchar(64) default NULL,
  `sex` int(11) default NULL,
  `birthday` varchar(10) default NULL,
  `id_type` int(11) default NULL,
  `id_number` varchar(20) default NULL,
  `address` text,
  `post_code` varchar(64) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `mobile_phone` varchar(16) default NULL,
  `country` varchar(256) default NULL,
  `province` varchar(256) default NULL,
  `city` varchar(256) default NULL,
  `icon` varchar(256) default NULL,
  `favorite` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_customer_local_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10855954 DEFAULT CHARSET=utf8;

/*Data for the table `tv_customer_local` */

LOCK TABLES `tv_customer_local` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_customer_local_ext` */

DROP TABLE IF EXISTS `tv_customer_local_ext`;

CREATE TABLE `tv_customer_local_ext` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `name` varchar(64) default NULL,
  `sex` int(11) default NULL,
  `birthday` varchar(10) default NULL,
  `id_type` int(11) default NULL,
  `id_number` varchar(20) default NULL,
  `address` text,
  `post_code` varchar(64) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `mobile_phone` varchar(16) default NULL,
  `country` varchar(256) default NULL,
  `province` varchar(256) default NULL,
  `city` varchar(256) default NULL,
  `icon` varchar(256) default NULL,
  `favorite` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_customer_local_ext_code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=13849437 DEFAULT CHARSET=utf8 COMMENT='客户信息新表';

/*Data for the table `tv_customer_local_ext` */

LOCK TABLES `tv_customer_local_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_default_user_group` */

DROP TABLE IF EXISTS `tv_default_user_group`;

CREATE TABLE `tv_default_user_group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_default_user_group` */

LOCK TABLES `tv_default_user_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_discount` */

DROP TABLE IF EXISTS `tv_discount`;

CREATE TABLE `tv_discount` (
  `id` bigint(19) NOT NULL auto_increment,
  `name` varchar(256) default NULL,
  `code` varchar(256) default NULL,
  `discount_rate` float(10,2) default NULL COMMENT '折扣比率：如 8.5折',
  `discount_price` float(10,2) default NULL COMMENT '折扣价格：如：10.50元',
  `flag` bigint(1) default NULL COMMENT '0:使用折扣率；1：使用折扣价格',
  PRIMARY KEY  (`id`),
  KEY `discount_code` (`code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=20759 DEFAULT CHARSET=utf8;

/*Data for the table `tv_discount` */

LOCK TABLES `tv_discount` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_encode_protocol_enum` */

DROP TABLE IF EXISTS `tv_encode_protocol_enum`;

CREATE TABLE `tv_encode_protocol_enum` (
  `id` bigint(19) default NULL,
  `encode` varchar(32) default NULL COMMENT '编码',
  `protocol` varchar(32) default NULL COMMENT '协议',
  `digit` int(19) default NULL COMMENT '位数',
  `priority` int(1) default NULL COMMENT '优先级',
  KEY `tv_encode_protocol_enum_digit` (`digit`),
  KEY `tv_encode_protocol_enum_encode` (`encode`),
  KEY `tv_encode_protocol_enum_protocol` (`protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编码协议枚举';

/*Data for the table `tv_encode_protocol_enum` */

LOCK TABLES `tv_encode_protocol_enum` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_error_code_mapping` */

DROP TABLE IF EXISTS `tv_error_code_mapping`;

CREATE TABLE `tv_error_code_mapping` (
  `id` bigint(12) NOT NULL auto_increment,
  `code` varchar(32) default NULL,
  `mapping_code` varchar(32) default NULL,
  `message` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

/*Data for the table `tv_error_code_mapping` */

LOCK TABLES `tv_error_code_mapping` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_family_user` */

DROP TABLE IF EXISTS `tv_family_user`;

CREATE TABLE `tv_family_user` (
  `id` int(11) NOT NULL auto_increment,
  `bestv_family_id` varchar(64) default NULL COMMENT '百视通family账号',
  `partner_user_id` varchar(64) default NULL COMMENT '运营商账户',
  `create_time` timestamp NULL default CURRENT_TIMESTAMP,
  `update_time` timestamp NULL default NULL,
  `status` int(6) default '1' COMMENT '0 禁用，1 启用。预留干预手段',
  `pay_identity` varchar(64) default NULL COMMENT '支付标识',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_bestv_family_id` (`bestv_family_id`),
  KEY `index_partner_user_id` (`partner_user_id`),
  KEY `index_pay_identity` (`pay_identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_family_user` */

LOCK TABLES `tv_family_user` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_favorite` */

DROP TABLE IF EXISTS `tv_favorite`;

CREATE TABLE `tv_favorite` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `da_user_id` varchar(128) NOT NULL,
  `daterminal` int(10) unsigned NOT NULL,
  `da_user_name` varchar(128) default NULL,
  `oa_user_id` varchar(128) default NULL,
  `oaterminal` int(10) unsigned default NULL,
  `oa_user_name` varchar(128) default NULL,
  `biztype` int(10) unsigned NOT NULL,
  `favorite_type` int(10) unsigned NOT NULL,
  `favorite_code` varchar(1024) NOT NULL,
  `favorite_name` varchar(128) NOT NULL,
  `small_image_1` varchar(128) default NULL,
  `big_image_1` varchar(128) default NULL,
  `episode_index` int(10) unsigned default NULL,
  `videocode` varchar(45) default NULL,
  `categorycode` varchar(128) default NULL,
  `categoryname` varchar(128) default NULL,
  `createtime` datetime NOT NULL,
  `recordtime` int(10) unsigned default NULL,
  `ip` varchar(1024) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

/*Data for the table `tv_favorite` */

LOCK TABLES `tv_favorite` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_filter_rule` */

DROP TABLE IF EXISTS `tv_filter_rule`;

CREATE TABLE `tv_filter_rule` (
  `filter_id` bigint(19) NOT NULL auto_increment COMMENT 'è¿‡æ»¤è§„åˆ™id',
  `filter_nm` varchar(256) default NULL COMMENT 'è¿‡æ»¤è§„åˆ™åç§°',
  `filter_code` varchar(32) default NULL COMMENT 'è¿‡æ»¤è§„åˆ™ç¼–ç ',
  `filter_type` int(2) default '5' COMMENT 'ç±»åˆ«ï¼š 1:å¹¿å‘ŠæŠ•æ”¾ç±»ã€2:æœåŠ¡é¢„å‡çº§ç±»ã€3:cdnæ™ºèƒ½ç­›é€‰ç±»ã€4:å…¨èƒ½ç±»ã€5:åŽ‚å•†äº§å“ç³»åˆ—é»˜è®¤ç±»',
  `series_code` varchar(2048) default NULL,
  `terminal_provider` varchar(50) default NULL COMMENT 'åŽ‚å•†',
  `terminal_model` varchar(4000) default NULL COMMENT 'ç»ˆç«¯åž‹å·:é»˜è®¤ä¸º*ä»£è¡¨æ‰€æœ‰ï¼Œå¯ä»¥é€‰å–å¤šä¸ªåž‹å·ä»¥:åˆ†å‰²',
  `terminal_type` varchar(256) default NULL COMMENT 'ç»ˆç«¯ç±»åž‹ï¼š* é€šç”¨  0  ä¸“ç”¨å®¢æˆ·ç«¯  1web',
  `bcti_version` varchar(256) default NULL COMMENT 'bctiç‰ˆæœ¬å·',
  `ter_out_code` varchar(50) default NULL COMMENT 'ç»ˆç«¯è¾“å‡ºæ¨¡æ¿code',
  `operation_code` varchar(200) default NULL COMMENT 'è¿è¥å•†ç¼–ç ',
  `publish_status` int(1) default '0' COMMENT 'å‘å¸ƒçŠ¶æ€  0 æœªå‘å¸ƒ  1 å·²å‘å¸ƒ 2 æš‚åœ',
  `create_time` datetime default NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime default NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `create_id` varchar(50) default NULL COMMENT 'åˆ›å»ºäºº',
  `mender_id` varchar(50) default NULL COMMENT 'ä¿®æ”¹äºº',
  `del_flag` int(1) default '0' COMMENT '0 æ­£å¸¸ 1 åˆ é™¤',
  `remark` varchar(2000) default NULL COMMENT 'å¤‡æ³¨',
  `operatorGroup_code` varchar(128) default '*' COMMENT '网络运营商分组code',
  `subscriber_group_code` varchar(256) default '*' COMMENT '用户分组Code',
  PRIMARY KEY  (`filter_id`),
  KEY `series_code` (`series_code`(255)),
  KEY `filter_type` (`filter_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8 COMMENT='å¼€æˆ·ç™»é™†è¿‡æ»¤è§„åˆ™';

/*Data for the table `tv_filter_rule` */

LOCK TABLES `tv_filter_rule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_filter_whitelist` */

DROP TABLE IF EXISTS `tv_filter_whitelist`;

CREATE TABLE `tv_filter_whitelist` (
  `white_id` bigint(19) NOT NULL COMMENT 'ç™½åå•id',
  `white_nm` varchar(200) default NULL COMMENT 'åç§°',
  `series_code` varchar(50) default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  `terminal_provider` varchar(50) default NULL COMMENT 'åŽ‚å•†',
  `user_id` varchar(32) default NULL,
  `mac_start` varchar(64) default NULL COMMENT 'macå¼€å§‹åœ°å€',
  `mac_end` varchar(64) default NULL COMMENT 'macç»“æŸåœ°å€',
  `ter_out_code` varchar(50) default NULL COMMENT 'ç»ˆç«¯è¾“å‡ºæ¨¡æ¿code',
  `publish_status` int(1) default '0' COMMENT 'å‘å¸ƒçŠ¶æ€  0 æœªå‘å¸ƒ  1 å·²å‘å¸ƒ 2 æš‚åœ',
  `create_time` datetime default NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime default NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `create_id` varchar(50) default NULL COMMENT 'åˆ›å»ºäºº',
  `mender_id` varchar(50) default NULL COMMENT 'ä¿®æ”¹äºº',
  `del_flag` int(1) default '0' COMMENT '0 æ­£å¸¸ 1 åˆ é™¤',
  `remark` varchar(2000) default NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY  (`white_id`),
  KEY `user_id` (`user_id`),
  KEY `terminal_provider` (`terminal_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿‡æ»¤è§„åˆ™ç™½åå•--åœ¨å¼€æˆ·å’Œç™»é™†çš„æ—¶å€™ä¼˜é€‰çº§æ';

/*Data for the table `tv_filter_whitelist` */

LOCK TABLES `tv_filter_whitelist` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_gen_useraccount_rule` */

DROP TABLE IF EXISTS `tv_gen_useraccount_rule`;

CREATE TABLE `tv_gen_useraccount_rule` (
  `id` int(11) NOT NULL auto_increment,
  `pointer` int(9) default NULL COMMENT 'åˆ†é…ç”¨æˆ·è´¦æˆ·æŒ‡é’ˆ(ç”¨äºŽæ¯æ¬¡ç”Ÿæˆç”¨æˆ·æ®µçš„èµ·å§‹å€¼)',
  `provider_partner_identify` varchar(128) default NULL COMMENT 'ç»ˆç«¯åŽ‚å•†,è¿è¥å•†è¯†åˆ«ç ',
  `update_time` datetime default NULL COMMENT 'å¸å·æ®µç”Ÿæˆæ—¶é—´',
  `version` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tv_gen_useraccount_rule` */

LOCK TABLES `tv_gen_useraccount_rule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_guide_video` */

DROP TABLE IF EXISTS `tv_guide_video`;

CREATE TABLE `tv_guide_video` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(128) default NULL COMMENT '导视标题',
  `code` varchar(128) default NULL COMMENT '导视code',
  `description` varchar(1024) default NULL COMMENT '导视描述',
  `guide_video_mode` int(2) default '0' COMMENT '导视元素是否置顶',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导视表';

/*Data for the table `tv_guide_video` */

LOCK TABLES `tv_guide_video` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_guide_video_item` */

DROP TABLE IF EXISTS `tv_guide_video_item`;

CREATE TABLE `tv_guide_video_item` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(128) default NULL COMMENT '导视子项标题',
  `guide_code` varchar(128) default NULL COMMENT '导视code',
  `description` varchar(1024) default NULL COMMENT '导视子项描述',
  `guide_item_code` varchar(128) default NULL COMMENT '导视元素节目Code',
  `guide_category_code` varchar(128) default NULL COMMENT '导视内容所在的分类路径',
  `guide_item_type` int(2) default '1' COMMENT '0 进入详情页 1 直接播放或运行',
  `big_image_url` varchar(256) default NULL COMMENT '大图片路径',
  `link_type` int(2) default NULL COMMENT '导视元素关联的对象类型',
  `mode` int(2) default NULL COMMENT '弹出窗口显示类型',
  `sort` int(2) default NULL COMMENT '导视元素顺序',
  `guide_video_mode` int(2) default '0' COMMENT '导视元素是否置顶',
  `link_value_code` varchar(128) default NULL COMMENT '导视元素关联对象code',
  `link_category_code` varchar(128) default NULL COMMENT '导视元素关联对象所在的分类路径',
  `user_group_code` varchar(4000) default NULL COMMENT '关联业务分组编码',
  `package_name` varchar(128) default NULL COMMENT '包名字',
  `res_uri` varchar(128) default NULL COMMENT '资源入口地址',
  `item_begin_time` datetime default NULL COMMENT '播放开始时间',
  `item_end_time` datetime default NULL COMMENT '播放结束时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导视元素表';

/*Data for the table `tv_guide_video_item` */

LOCK TABLES `tv_guide_video_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_interface_log` */

DROP TABLE IF EXISTS `tv_interface_log`;

CREATE TABLE `tv_interface_log` (
  `id` bigint(19) NOT NULL auto_increment,
  `name` varchar(256) NOT NULL COMMENT '接口名称:如HBLT Checkprice',
  `direction` varchar(256) default NULL COMMENT '方向: 如VAC->BEST   BEST->VAC',
  `send_value` varchar(1024) default NULL COMMENT '发送的值, 跟direction有关, 如果VAC->Best  则其值是VAC发送过来的值.',
  `reply_value` varchar(1024) default NULL COMMENT '回复的值, 跟direction有关, 如果VAC->Best  则其值是Best回复的值.',
  `send_result` varchar(128) default NULL COMMENT '发送的解释结果 如: 成功, 失败, 异常',
  `create_time` timestamp NULL default NULL,
  `status` varchar(128) default NULL COMMENT '状态: 如成功, 失败,或者其它',
  `reply_result` varchar(128) default NULL COMMENT '发送的解释结果 如: 成功, 失败, 异常',
  `partner_user_id` varchar(256) default NULL,
  `bestv_user_id` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `tv_interface_log` */

LOCK TABLES `tv_interface_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_ip_operation` */

DROP TABLE IF EXISTS `tv_ip_operation`;

CREATE TABLE `tv_ip_operation` (
  `ip_id` bigint(19) NOT NULL auto_increment,
  `operation_nm` varchar(50) default NULL COMMENT '运营名称',
  `operation_code` varchar(200) default NULL COMMENT '运营商编码',
  `start_ip` varchar(32) default NULL COMMENT '开始ip',
  `end_ip` varchar(32) default NULL COMMENT '结束ip',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '修改时间',
  `create_id` varchar(50) default NULL COMMENT '创建人',
  `mender_id` varchar(50) default NULL COMMENT '修改人',
  `del_flag` int(1) default NULL COMMENT '0 正常 1 删除',
  `remark` varchar(2000) default NULL COMMENT '备注',
  `start_num_ip` bigint(20) default NULL,
  `end_num_ip` bigint(20) default NULL,
  PRIMARY KEY  (`ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8 COMMENT='ip运营对照';

/*Data for the table `tv_ip_operation` */

LOCK TABLES `tv_ip_operation` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_issue_year` */

DROP TABLE IF EXISTS `tv_issue_year`;

CREATE TABLE `tv_issue_year` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `start_time` varchar(96) default NULL,
  `end_time` varchar(96) default NULL,
  `sort` int(4) default NULL COMMENT '顺序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时代表';

/*Data for the table `tv_issue_year` */

LOCK TABLES `tv_issue_year` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_item_hot` */

DROP TABLE IF EXISTS `tv_item_hot`;

CREATE TABLE `tv_item_hot` (
  `id` int(11) NOT NULL auto_increment,
  `item_code` varchar(50) character set utf8 default NULL COMMENT '内容节目编码',
  `day_num` int(11) default NULL,
  `week_num` int(11) default NULL,
  `month_num` int(11) default NULL,
  `year_num` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `item_code` (`item_code`)
) ENGINE=MyISAM AUTO_INCREMENT=65908 DEFAULT CHARSET=latin1;

/*Data for the table `tv_item_hot` */

LOCK TABLES `tv_item_hot` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_item_score` */

DROP TABLE IF EXISTS `tv_item_score`;

CREATE TABLE `tv_item_score` (
  `id` bigint(19) NOT NULL auto_increment,
  `item_code` varchar(256) NOT NULL,
  `count` int(10) default NULL,
  `score` float default '0',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `total_score` float(13,3) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_item_code` (`item_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=35831 DEFAULT CHARSET=utf8;

/*Data for the table `tv_item_score` */

LOCK TABLES `tv_item_score` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_live_program_item` */

DROP TABLE IF EXISTS `tv_live_program_item`;

CREATE TABLE `tv_live_program_item` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `channel_code` varchar(128) default NULL COMMENT '频道代码',
  `code` varchar(128) default NULL COMMENT '直播节目代码',
  `name` varchar(128) default NULL COMMENT '直播节目名称',
  `begin_time` datetime default NULL COMMENT '直播开始时间',
  `end_time` datetime default NULL COMMENT '直播结束时间',
  `open_look_back` int(1) default NULL COMMENT '是否打开回看，0=否，1=是',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='直播节目';

/*Data for the table `tv_live_program_item` */

LOCK TABLES `tv_live_program_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_login_log` */

DROP TABLE IF EXISTS `tv_login_log`;

CREATE TABLE `tv_login_log` (
  `id` bigint(12) NOT NULL auto_increment,
  `user_id` varchar(128) default NULL,
  `TVID` varchar(128) default NULL,
  `region_code` varchar(16) default NULL,
  `user_type` varchar(64) default NULL,
  `user_group` varchar(64) default NULL,
  `terminal_model` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `login_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `terminal_provider` varchar(128) default NULL,
  `log_source` varchar(128) default NULL,
  `busi_type` int(2) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `product_group_code` varchar(128) default NULL,
  `tv_profile` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91582 DEFAULT CHARSET=utf8;

/*Data for the table `tv_login_log` */

LOCK TABLES `tv_login_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_long_comment_detail` */

DROP TABLE IF EXISTS `tv_long_comment_detail`;

CREATE TABLE `tv_long_comment_detail` (
  `id` bigint(19) NOT NULL auto_increment,
  `comment_id` bigint(19) NOT NULL,
  `content_code` varchar(384) default NULL,
  `title` varchar(192) default NULL,
  `summary` varchar(798) default NULL,
  `nickname` varchar(192) default NULL,
  `publish_time` datetime default NULL,
  `url` varchar(192) default NULL,
  `movie_id` bigint(19) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='长影评信息';

/*Data for the table `tv_long_comment_detail` */

LOCK TABLES `tv_long_comment_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_media_detail` */

DROP TABLE IF EXISTS `tv_media_detail`;

CREATE TABLE `tv_media_detail` (
  `id` int(19) NOT NULL,
  `code` varchar(128) default NULL,
  `media_file_code` varchar(128) default NULL,
  `content_code` varchar(128) default NULL,
  `content_type` varchar(128) default NULL COMMENT '1：点播 ;2：直播 ',
  `type` int(10) default NULL,
  `episode_num` int(10) default NULL,
  `video_encode_type` int(11) default NULL,
  `audio_encode_type` int(11) default NULL,
  `source_url` varchar(1536) default NULL COMMENT '媒体源路径',
  `play_url` varchar(1536) default NULL COMMENT '媒体路径，可供播放使用',
  `path` varchar(1536) default NULL,
  `cp_code` text COMMENT '来源code',
  `source` varchar(96) default NULL COMMENT '媒体来源',
  `can_download` int(10) default NULL COMMENT '是否提供下载',
  `download_url` varchar(1536) default NULL COMMENT '下载链接',
  `can_onlineplay` int(10) default NULL COMMENT '是否提供在线播放',
  `duration` int(10) default NULL COMMENT '播放时长HHMISSFF （时分秒）格式为NNNNNN',
  `cdn` int(19) default NULL,
  `storage_id` int(19) default NULL,
  `file_size` bigint(19) default NULL,
  `use_space` int(19) default NULL,
  `audio_type` int(10) default NULL,
  `screen_format` int(10) default NULL,
  `captioning` int(1) default NULL,
  `drm_type` int(1) default NULL,
  `is_3d_video` int(1) default NULL,
  `format_3d` int(1) default NULL,
  `split_duration` varchar(4000) default NULL,
  `online_status` int(1) default NULL COMMENT '上线状态',
  `format` varchar(256) default NULL COMMENT '编码',
  `protocol` varchar(256) default NULL COMMENT '协议',
  `bitrate` varchar(256) default NULL COMMENT '码流',
  `insert_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `resolution` varchar(384) default NULL COMMENT '分辨率',
  `audio_format` int(10) unsigned default NULL,
  `fid` varchar(256) default NULL,
  `tar_url` varchar(1024) default NULL,
  `original` varchar(64) default NULL,
  `old_id` varchar(400) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_media_detail_code` (`code`),
  KEY `tv_media_detail_media_file_code` (`media_file_code`),
  KEY `tv_media_detail_content_codee` (`content_code`),
  KEY `index_path` (`path`(255)),
  KEY `ccm` (`code`,`content_code`,`media_file_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展';

/*Data for the table `tv_media_detail` */

LOCK TABLES `tv_media_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_media_detail_20130710` */

DROP TABLE IF EXISTS `tv_media_detail_20130710`;

CREATE TABLE `tv_media_detail_20130710` (
  `id` int(19) NOT NULL,
  `code` varchar(128) character set utf8 default NULL,
  `media_file_code` varchar(128) character set utf8 default NULL,
  `content_code` varchar(128) character set utf8 default NULL,
  `content_type` varchar(128) character set utf8 default NULL COMMENT '1：点播 ;2：直播 ',
  `type` int(10) default NULL,
  `episode_num` int(10) default NULL,
  `video_encode_type` int(11) default NULL,
  `audio_encode_type` int(11) default NULL,
  `source_url` varchar(1536) character set utf8 default NULL COMMENT '媒体源路径',
  `play_url` varchar(1536) character set utf8 default NULL COMMENT '媒体路径，可供播放使用',
  `path` varchar(1536) character set utf8 default NULL,
  `cp_code` text character set utf8 COMMENT '来源code',
  `source` varchar(96) character set utf8 default NULL COMMENT '媒体来源',
  `can_download` int(10) default NULL COMMENT '是否提供下载',
  `download_url` varchar(1536) character set utf8 default NULL COMMENT '下载链接',
  `can_onlineplay` int(10) default NULL COMMENT '是否提供在线播放',
  `duration` int(10) default NULL COMMENT '播放时长HHMISSFF （时分秒）格式为NNNNNN',
  `cdn` int(19) default NULL,
  `storage_id` int(19) default NULL,
  `file_size` bigint(19) default NULL,
  `use_space` int(19) default NULL,
  `audio_type` int(10) default NULL,
  `screen_format` int(10) default NULL,
  `captioning` int(1) default NULL,
  `drm_type` int(1) default NULL,
  `is_3d_video` int(1) default NULL,
  `format_3d` int(1) default NULL,
  `split_duration` varchar(4000) character set utf8 default NULL,
  `online_status` int(1) default NULL COMMENT '上线状态',
  `format` varchar(256) character set utf8 default NULL COMMENT '编码',
  `protocol` varchar(256) character set utf8 default NULL COMMENT '协议',
  `bitrate` varchar(256) character set utf8 default NULL COMMENT '码流',
  `insert_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `resolution` varchar(384) character set utf8 default NULL COMMENT '分辨率',
  `audio_format` int(10) unsigned default NULL,
  `fid` varchar(256) character set utf8 default NULL,
  `tar_url` varchar(1024) character set utf8 default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_media_detail_20130710` */

LOCK TABLES `tv_media_detail_20130710` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_media_file_ext` */

DROP TABLE IF EXISTS `tv_media_file_ext`;

CREATE TABLE `tv_media_file_ext` (
  `id` int(19) NOT NULL,
  `code` varchar(128) default NULL,
  `content_code` varchar(128) default NULL,
  `content_type` varchar(128) default NULL,
  `type` int(10) default NULL,
  `episode_num` int(10) default NULL,
  `onlined_protocol` bigint(19) default NULL COMMENT '支持的媒体编码协议',
  `bitrate` varchar(256) default NULL COMMENT '码流',
  `bitrate_type` int(10) default NULL,
  `onlined_protocol_audio` varchar(512) default NULL COMMENT '已经上线的带音频的编码协议码流音频',
  PRIMARY KEY  (`id`),
  KEY `tv_media_file_ext_code` (`code`),
  KEY `tv_media_file_ext_content_code` (`content_code`),
  KEY `tv_media_file_ext_episode_num` (`episode_num`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='扩展';

/*Data for the table `tv_media_file_ext` */

LOCK TABLES `tv_media_file_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_message` */

DROP TABLE IF EXISTS `tv_message`;

CREATE TABLE `tv_message` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) NOT NULL,
  `type` int(2) default NULL COMMENT '消息类型1:系统升级公告消息,2:内容推荐消息,3:应用推荐消息',
  `display_type` int(2) default NULL COMMENT '0:有时效的,1:永久性的',
  `pop_type` int(2) default NULL COMMENT '0:不弹窗,1:弹窗提示消息,2:Alert Dialog方式',
  `style` int(2) default NULL COMMENT '0:文字,1:图片+文字',
  `icon` varchar(256) default NULL,
  `SUMMARY` varchar(4000) default NULL,
  `validity_starttime` datetime default NULL,
  `validity_endtime` datetime default NULL,
  `publish_time` datetime default NULL,
  `onclick_flag` int(2) default NULL COMMENT '0:不能点击，只能浏览,1:用户可以点击进入到相关的apk进行后续处理',
  `uri` varchar(128) default NULL,
  `title` varchar(4000) default NULL,
  `partner_code` varchar(4000) default NULL,
  `term_version` varchar(256) default NULL,
  `sender` varchar(256) default NULL,
  `subscriber_group_code` varchar(4000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

/*Data for the table `tv_message` */

LOCK TABLES `tv_message` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_message_ext` */

DROP TABLE IF EXISTS `tv_message_ext`;

CREATE TABLE `tv_message_ext` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) NOT NULL,
  `type` int(2) default NULL COMMENT '消息类型1:系统升级公告消息,2:内容推荐消息,3:应用推荐消息,4:激活码,5:到期提醒',
  `display_type` int(2) default NULL COMMENT '0:有时效的,1:永久性的',
  `pop_type` int(2) unsigned zerofill default NULL COMMENT '0:不弹窗,1:弹窗提示消息,2:Alert Dialog方式',
  `style` int(2) default NULL COMMENT '0:文字,1:图片+文字',
  `icon` varchar(256) default NULL,
  `SUMMARY` varchar(4000) default NULL,
  `validity_starttime` datetime default NULL,
  `validity_endtime` datetime default NULL,
  `publish_time` datetime default NULL,
  `onclick_flag` int(2) default NULL COMMENT '0:不能点击，只能浏览,1:用户可以点击进入到相关的apk进行后续处理',
  `uri` varchar(128) default NULL,
  `title` varchar(4000) default NULL,
  `partner_code` varchar(4000) default NULL,
  `term_version` varchar(256) default NULL,
  `sender` varchar(256) default NULL,
  `subscriber_group_code` varchar(4000) default NULL,
  `user_id` varchar(256) default NULL,
  `show_count` int(11) default NULL,
  `visit_count` int(11) default NULL,
  `template_code` varchar(128) default NULL,
  `sort` int(11) default NULL,
  `status` int(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tv_message_ext` */

LOCK TABLES `tv_message_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_module_engine` */

DROP TABLE IF EXISTS `tv_module_engine`;

CREATE TABLE `tv_module_engine` (
  `id` bigint(19) NOT NULL,
  `app_code` varchar(256) default NULL,
  `auth_code` varchar(256) default NULL,
  `module_name` varchar(256) default NULL,
  `service_url` varchar(256) default NULL,
  `type` bigint(1) default NULL,
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='module配置页面';

/*Data for the table `tv_module_engine` */

LOCK TABLES `tv_module_engine` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_operation` */

DROP TABLE IF EXISTS `tv_operation`;

CREATE TABLE `tv_operation` (
  `operation_id` bigint(19) NOT NULL,
  `operation_nm` varchar(50) default NULL COMMENT 'è¿è¥åç§°',
  `operation_code` varchar(200) default NULL COMMENT 'è¿è¥å•†ç¼–ç ',
  `create_time` datetime default NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime default NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `create_id` varchar(50) default NULL COMMENT 'åˆ›å»ºäºº',
  `mender_id` varchar(50) default NULL COMMENT 'ä¿®æ”¹äºº',
  `del_flag` int(1) default '0' COMMENT '0 æ­£å¸¸ 1 åˆ é™¤',
  `remark` varchar(2000) default NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY  (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¿è¥å•†';

/*Data for the table `tv_operation` */

LOCK TABLES `tv_operation` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_operation_group` */

DROP TABLE IF EXISTS `tv_operation_group`;

CREATE TABLE `tv_operation_group` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `DispatchedCDNgroupCode` varchar(128) NOT NULL,
  `url` varchar(1024) default NULL,
  `status` int(11) default '1',
  `description` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8;

/*Data for the table `tv_operation_group` */

LOCK TABLES `tv_operation_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_package` */

DROP TABLE IF EXISTS `tv_package`;

CREATE TABLE `tv_package` (
  `id` bigint(20) NOT NULL auto_increment,
  `package_name` varchar(128) NOT NULL COMMENT '名称',
  `package_code` varchar(64) NOT NULL COMMENT '唯一编码',
  `price` int(11) NOT NULL default '0' COMMENT '价格',
  `type` int(11) NOT NULL COMMENT '类型，1：ppv；2：包月',
  `cp_code` varchar(64) NOT NULL COMMENT 'cp唯一编码，当type=1时，取值为ALL',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='产品包';

/*Data for the table `tv_package` */

LOCK TABLES `tv_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_partner_area_mapping` */

DROP TABLE IF EXISTS `tv_partner_area_mapping`;

CREATE TABLE `tv_partner_area_mapping` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `partner_code` varchar(64) default NULL COMMENT '运营商代码',
  `area_type` varchar(64) default NULL COMMENT '地区类型 1：省份，2：地市，3：区县',
  `boss_area_code` varchar(64) default NULL COMMENT '运营商地区代码',
  `bestv_area_code` varchar(64) default NULL COMMENT '百视通地区代码',
  `name` varchar(64) default NULL COMMENT '名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='运营商地区映射表';

/*Data for the table `tv_partner_area_mapping` */

LOCK TABLES `tv_partner_area_mapping` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_partner_log` */

DROP TABLE IF EXISTS `tv_partner_log`;

CREATE TABLE `tv_partner_log` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `log_type` varchar(64) default NULL COMMENT '日志类型1:用户，2：订购关系',
  `user_id` varchar(255) default NULL COMMENT '运营商用户唯一标识',
  `boss_sequence_id` varchar(64) default NULL COMMENT '流水号或BOSS受理单号',
  `product_code` varchar(64) default NULL COMMENT '产品标识',
  `update_type` varchar(64) default NULL COMMENT '操作类型 1:订购，2：退订',
  `boss_update_time` datetime default NULL COMMENT 'BOSS上修改时间',
  `valid_time` datetime default NULL COMMENT '订购关系生效时间',
  `continue_flag` varchar(64) default NULL COMMENT '订购时作为续订标志(0:不续订，1:续订)，退订时作为退订标志(0:立即退订，1：不立即退订，退订到月底)',
  `expire_time` datetime default NULL COMMENT '订购关系结束时间',
  `request_log` longtext COMMENT '请求日志',
  `response_log` longtext COMMENT '回执日志',
  `error_code` varchar(64) default NULL COMMENT '错误代码',
  `comment` longtext COMMENT '错误描述',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  `OperationType` int(2) default NULL COMMENT '操作类型1:开户,2:取消订购,3:账号变更,4:业务暂停,5:复机,6:换机',
  `FamilyID` varchar(32) default NULL COMMENT '原有家宽账号',
  `NewFamilyID` varchar(32) default NULL COMMENT '变更后的家宽账号',
  `UserType` int(11) default NULL COMMENT '1：表式普通家宽用户（缺省）2：表示集团专线用户3：表示LTE方式用户',
  `UserLevel` int(11) default NULL COMMENT '0：主账号1：子账号',
  `CntProviderID` varchar(32) default NULL COMMENT '用户对应的牌照方ID',
  `ProductList` varchar(1024) default NULL COMMENT '用户订购的产品ID列表，多个产品用英文半角,分割',
  `AreaCode` varchar(32) default NULL COMMENT '用户所属地市',
  `BesTVAreaCode` varchar(32) default NULL COMMENT '转换地市代码',
  `Action` int(2) default NULL COMMENT '0：换机1：取消换机',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414674 DEFAULT CHARSET=utf8 COMMENT='运营商同户与订购关系同步日志';

/*Data for the table `tv_partner_log` */

LOCK TABLES `tv_partner_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_partner_order` */

DROP TABLE IF EXISTS `tv_partner_order`;

CREATE TABLE `tv_partner_order` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `user_id` varchar(255) default NULL COMMENT '运营商用户唯一标识',
  `boss_sequence_id` varchar(64) default NULL COMMENT '流水号或BOSS受理单号',
  `product_code` varchar(64) default NULL COMMENT '产品标识',
  `product_name` varchar(255) default NULL COMMENT '产品名称',
  `is_renew` bigint(1) default NULL COMMENT '0：不续订；1：续订',
  `valid_time` datetime default NULL COMMENT '生效时间',
  `expire_time` datetime default NULL COMMENT '失效时间',
  `order_time` datetime default NULL COMMENT '订购时间',
  `unsubscribe_time` datetime default NULL COMMENT '退订时间',
  `update_time` datetime default NULL COMMENT '订购记录最后修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营商用户订购表';

/*Data for the table `tv_partner_order` */

LOCK TABLES `tv_partner_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_partner_user` */

DROP TABLE IF EXISTS `tv_partner_user`;

CREATE TABLE `tv_partner_user` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `user_id` varchar(256) default NULL COMMENT '运营商用户唯一标识',
  `bestv_user_id` varchar(256) default NULL COMMENT '百视通用户唯一标识',
  `epg_user_group` varchar(128) default NULL COMMENT '用户分组',
  `user_name` varchar(128) default NULL COMMENT '用户名称',
  `sn` varchar(128) default NULL COMMENT '设备序号',
  `id_number` varchar(32) default NULL COMMENT '身份证号码',
  `phone` varchar(32) default NULL COMMENT '电话号码',
  `sex` varchar(16) default NULL COMMENT '性别',
  `address` varchar(512) default NULL COMMENT '住址',
  `postal_code` varchar(6) default NULL COMMENT '邮政编码',
  `email` varchar(128) default NULL COMMENT '电子邮箱',
  `area_code` varchar(16) default NULL COMMENT '区域',
  `products` varchar(128) default NULL COMMENT '订购产品列表',
  `terminal_mode` varchar(128) default NULL COMMENT '终端型号',
  `status` int(2) default NULL COMMENT '状态:0:开户；1：激活；2：停机；3：拆机；4：暂停',
  `created_time` datetime default NULL COMMENT '创建时间',
  `actived_time` datetime default NULL COMMENT '激活时间',
  `suspended_time` datetime default NULL COMMENT '暂时时间',
  `cancled_time` datetime default NULL COMMENT '注销时间',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `partner_code` varchar(64) default NULL COMMENT '合作伙伴标识',
  `band_width` varchar(64) default NULL COMMENT '带宽',
  `password` varchar(256) default NULL,
  `adsl_account` varchar(256) default NULL,
  `reserved1` varchar(256) default NULL,
  `reserved2` varchar(256) default NULL,
  `band_width_password` varchar(64) default NULL COMMENT '宽带接入密码',
  `source` varchar(64) default '0' COMMENT '来源类型 0:工单，1：手动',
  `province_id` varchar(64) default NULL COMMENT '省份代码',
  `city_code` varchar(64) default NULL COMMENT '城市代码',
  `expire_time` datetime default NULL COMMENT '失效时间',
  `pre_status` int(2) default '0' COMMENT '是否是预开通 0:非预开通，1：预开通',
  `mac` varchar(64) default NULL COMMENT 'mac地址',
  `stb_type` varchar(64) default NULL COMMENT '01：个人 02：集团',
  `ec_code` varchar(64) default NULL COMMENT '集团客户编码',
  `detail_param` longtext COMMENT '扩展属性',
  `group_ip` varchar(1025) default NULL,
  `custName` varchar(100) default NULL,
  `custOccupType` int(10) default NULL,
  `custTelephone` varchar(20) default NULL,
  `connectType` int(10) default NULL,
  `orderLevel` int(11) default NULL,
  `cardNo` varchar(32) default NULL,
  `groupId` varchar(128) default NULL,
  `points` varchar(128) default NULL,
  `validDates` varchar(512) default NULL,
  `validStatus` varchar(512) default NULL,
  `expireDates` varchar(512) default NULL,
  `continueFlags` varchar(255) default NULL,
  `operationTypes` varchar(2048) default NULL,
  `gather_flag` int(10) default NULL,
  `paidUserId` varchar(32) default NULL,
  `acctId` varchar(32) default NULL,
  `balance` varchar(10) default NULL,
  `jobstatus` int(11) default NULL,
  `old_sn` varchar(1024) default NULL,
  `opt_status` int(11) default NULL COMMENT '绑定状态',
  `user_type` int(11) default NULL COMMENT '用户类型',
  PRIMARY KEY  (`id`),
  KEY `TV_PUSER_INX` (`user_id`(255),`bestv_user_id`(255)),
  KEY `idx_partner_sn` (`sn`),
  KEY `idx_partner_btv_id` (`bestv_user_id`(255)),
  KEY `index_tv_partner_user_user_id` (`user_id`(255))
) ENGINE=InnoDB AUTO_INCREMENT=1432566 DEFAULT CHARSET=utf8 COMMENT='合作伙伴用户信息表';

/*Data for the table `tv_partner_user` */

LOCK TABLES `tv_partner_user` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_pre_subscriber` */

DROP TABLE IF EXISTS `tv_pre_subscriber`;

CREATE TABLE `tv_pre_subscriber` (
  `id` bigint(12) NOT NULL auto_increment,
  `customer_id` bigint(12) default NULL,
  `nick_name` varchar(64) default NULL,
  `tvid` varchar(128) default NULL,
  `user_account` varchar(128) default NULL,
  `password` varchar(64) default NULL,
  `region_code` varchar(16) default NULL,
  `user_type` varchar(64) default NULL,
  `user_group` varchar(64) default NULL,
  `terminal_model` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `money` int(11) unsigned default '0',
  `terminal_provider` varchar(128) default NULL,
  `batch_no` varchar(128) default NULL,
  `rule_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

/*Data for the table `tv_pre_subscriber` */

LOCK TABLES `tv_pre_subscriber` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_pre_useraccount` */

DROP TABLE IF EXISTS `tv_pre_useraccount`;

CREATE TABLE `tv_pre_useraccount` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_account` varchar(255) default NULL,
  `status` int(11) default NULL,
  `tvid` varchar(255) default NULL,
  `rule_id` bigint(20) default NULL,
  `create_time` datetime default NULL,
  `apply_time` datetime default NULL,
  `provider_code` varchar(1024) default NULL,
  PRIMARY KEY  (`id`),
  KEY `IDX_account` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=21259221 DEFAULT CHARSET=utf8;

/*Data for the table `tv_pre_useraccount` */

LOCK TABLES `tv_pre_useraccount` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_product` */

DROP TABLE IF EXISTS `tv_product`;

CREATE TABLE `tv_product` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) default NULL COMMENT '产品唯一标识',
  `name` varchar(256) default NULL,
  `type` varchar(256) default NULL COMMENT '产品包含3类：PPV、SVOD、PVOD',
  `picture_big` varchar(256) default NULL,
  `picture_small` varchar(256) default NULL,
  `enter_url` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL COMMENT '产品状态包含3种状态：生效：1（默认）、失效：0、 删除：-1',
  `publish_status` bigint(1) default NULL COMMENT '包含3种状态：未发布：0（默认）、部分发布：1、已发布：2',
  `validity_starttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '产品生命周期的开始时间',
  `validity_endtime` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '产品生命周期的结束时间',
  `order_type` bigint(1) default NULL COMMENT '订购生命周期的类型：如 1：按自然月按；0：按小时',
  `order_cycle` varchar(256) default NULL COMMENT '订购生命周期的时长：如：按小时的：24/48小时。按自然月的：1-2个月',
  `unsubscribe` bigint(1) default NULL COMMENT '是否允许退订：0：不允许；1：允许',
  `keepsubscribe` bigint(1) default NULL COMMENT '是否允许续订：0：不允许；1：允许',
  `chargeplan_code` varchar(256) default NULL,
  `create_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `last_modify` timestamp NOT NULL default '0000-00-00 00:00:00',
  `publish_time` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '产品的发布时间',
  `operator_name` varchar(256) default NULL,
  `description` varchar(3072) default NULL,
  `partner_code` varchar(128) default NULL COMMENT '运营商code,关联tv_user_netoperator_group.code',
  `picture_big_2` varchar(256) default NULL COMMENT '产品显示图片',
  `biz_type` int(2) default '1' COMMENT '业务类型:1：视频；2:APP',
  `oper_type` bigint(1) default NULL,
  `use_type` int(2) default '0',
  `free_time` bigint(19) default '300',
  `product_type` int(1) default NULL,
  `display_type` int(11) default '1' COMMENT '该产品显示的类型.1:所有场景显示,2:仅在鉴权失败提示订购时显示,3:仅在赠送时显示',
  `valid_time` datetime default NULL COMMENT '生效时间',
  `expire_time` datetime default NULL COMMENT '失效时间',
  `order_num` int(11) default '0' COMMENT '可订购数量,0表示没有数量限制',
  PRIMARY KEY  (`id`),
  KEY `product_code` (`code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=832 DEFAULT CHARSET=utf8;

/*Data for the table `tv_product` */

LOCK TABLES `tv_product` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_product_chargeplan` */

DROP TABLE IF EXISTS `tv_product_chargeplan`;

CREATE TABLE `tv_product_chargeplan` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) default NULL,
  `price` float(10,2) default NULL,
  `validity_status` bigint(1) default NULL COMMENT '价格计划状态3种：生效：1，失效：0,删除：-1',
  `validity_starttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '价格计划有效开始时间',
  `validity_endtime` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '价格计划的有效结束时间',
  `publish_status` bigint(1) default NULL COMMENT '包含3种状态：未发布：0（默认）、部分发布：1、已发布：2',
  `create_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `operator_name` varchar(256) default NULL,
  `free_episode` bigint(1) default NULL,
  `description` varchar(3072) default NULL,
  `mark_id` int(11) default NULL,
  `mark_position` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `product_chargeplan_code` (`code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=utf8;

/*Data for the table `tv_product_chargeplan` */

LOCK TABLES `tv_product_chargeplan` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_product_group` */

DROP TABLE IF EXISTS `tv_product_group`;

CREATE TABLE `tv_product_group` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) default NULL,
  `name` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL,
  `publish_status` bigint(1) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `operator_name` varchar(256) default NULL,
  `description` varchar(3072) default NULL,
  PRIMARY KEY  (`id`),
  KEY `product_group_code` (`code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `tv_product_group` */

LOCK TABLES `tv_product_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_product_package` */

DROP TABLE IF EXISTS `tv_product_package`;

CREATE TABLE `tv_product_package` (
  `id` bigint(19) NOT NULL,
  `code` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `publish_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `description` varchar(512) default NULL,
  `title` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套餐';

/*Data for the table `tv_product_package` */

LOCK TABLES `tv_product_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_product_price` */

DROP TABLE IF EXISTS `tv_product_price`;

CREATE TABLE `tv_product_price` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `product_code` varchar(64) default NULL COMMENT '产品代码',
  `code` varchar(64) default NULL COMMENT '价格代码',
  `name` varchar(64) default NULL COMMENT '价格名称，暂不需要',
  `type` bigint(1) NOT NULL COMMENT '价格类型：PPV=0，包月=1，包季，半年=3，包年=4',
  `status` bigint(1) NOT NULL COMMENT '状态',
  `original_price` decimal(20,2) default '0.00' COMMENT '原价',
  `price` decimal(20,2) default '0.00' COMMENT '现价',
  `description` text COMMENT '描述',
  `sort_num` int(2) default '1',
  `order_type` int(11) default '1' COMMENT '订购生命周期的类型：如 1：按自然月；0：按小时',
  `order_cycle` int(11) default '1' COMMENT '订购生命周期的时长：如：按小时的：24/48小时。按自然月的：1-2个月',
  `relative_begin_time` int(11) NOT NULL default '0',
  `validity_starttime` datetime default NULL,
  `validity_endtime` datetime default NULL,
  `mark_id` int(11) default '0',
  `mark_position` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品价格表';

/*Data for the table `tv_product_price` */

LOCK TABLES `tv_product_price` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_program` */

DROP TABLE IF EXISTS `tv_program`;

CREATE TABLE `tv_program` (
  `id` bigint(20) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `description` text,
  `type` int(11) unsigned default NULL,
  `status` int(11) default NULL,
  `episode_number` int(11) default NULL,
  `actor` varchar(128) default NULL,
  `director` varchar(128) default NULL,
  `region` varchar(64) default NULL,
  `language` varchar(32) default NULL,
  `genre` varchar(256) default NULL,
  `keywords` varchar(1024) default NULL,
  `rating` varchar(8) default NULL,
  `small_image1` varchar(128) default NULL,
  `small_image2` varchar(128) default NULL,
  `big_image1` varchar(128) default NULL,
  `big_image2` varchar(128) default NULL,
  `reserve1` varchar(128) default NULL,
  `reserve2` varchar(128) default NULL,
  `reserve3` varchar(128) default NULL,
  `reserve4` varchar(128) default NULL,
  `reserve5` varchar(128) default NULL,
  `package_code` text COMMENT '产品包唯一编码',
  `SEARCH_NAME` varchar(256) default NULL,
  `year` varchar(96) default NULL,
  `content_type` varchar(96) default NULL,
  `tags` varchar(1024) default NULL,
  `length` bigint(20) default '0',
  `splittype` varchar(16) default NULL,
  `subtitleType` int(11) default '0',
  `subtitleURL` varchar(382) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `TV_PROGRAM_CODE_I` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_program` */

LOCK TABLES `tv_program` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_program_ext` */

DROP TABLE IF EXISTS `tv_program_ext`;

CREATE TABLE `tv_program_ext` (
  `id` bigint(20) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `ipd_name` varchar(128) default NULL,
  `description` text,
  `type` int(11) default NULL,
  `status` int(11) default NULL,
  `episode_number` int(11) default NULL,
  `actor` varchar(128) default NULL,
  `director` varchar(128) default NULL,
  `region` varchar(64) default NULL,
  `language` varchar(32) default NULL,
  `genre` varchar(256) default NULL,
  `keywords` varchar(1024) default NULL,
  `rating` varchar(8) default NULL,
  `small_image1` varchar(128) default NULL,
  `small_image2` varchar(128) default NULL,
  `big_image1` varchar(128) default NULL,
  `big_image2` varchar(128) default NULL,
  `reserve1` varchar(128) default NULL,
  `reserve2` varchar(128) default NULL,
  `reserve3` varchar(128) default NULL,
  `reserve4` varchar(128) default NULL,
  `reserve5` varchar(128) default NULL,
  `package_code` text COMMENT '产品包唯一编码',
  `SEARCH_NAME` varchar(256) default NULL,
  `year` varchar(96) default NULL,
  `content_type` varchar(96) default NULL,
  `tags` varchar(1024) default NULL,
  `length` bigint(20) default '0',
  `subtitleType` int(11) default '0',
  `subtitleURL` varchar(382) default NULL,
  `onlined_protocol` bigint(19) default NULL COMMENT '已经上线的媒体编码协议',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `onlined_bitrate` varchar(2048) default NULL,
  `price` float(10,2) default '0.00' COMMENT '节目的最低价格',
  `p_code` varchar(256) default NULL COMMENT '对应产品的code',
  `small_image3` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»Ð¡Í¼',
  `big_image3` varchar(256) default NULL COMMENT 'ºá°æÍÆ¼öÎ»´óÍ¼',
  `onlined_protocol_audio` varchar(512) default NULL COMMENT '已经上线的带音频的编码协议码流音频',
  `old_id` varchar(384) default NULL,
  `r_media_code` varchar(384) default NULL,
  `mi_small_image` varchar(256) default NULL COMMENT '小米小图',
  `mi_big_image` varchar(256) default NULL COMMENT '小米大图',
  `update_episode_number` int(10) default '0',
  `xbox_image1` varchar(128) default NULL COMMENT '标准海报推荐图',
  `xbox_image2` varchar(128) default NULL COMMENT '无字缩略图',
  `xbox_image3` varchar(128) default NULL COMMENT '观看记录大图',
  `xbox_image4` varchar(128) default NULL COMMENT '搜索显示海报图',
  `xbox_image5` varchar(128) default NULL COMMENT '方图',
  `xbox_image6` varchar(128) default NULL COMMENT '小方图',
  `xbox_image7` varchar(128) default NULL COMMENT '详情页的大海报图',
  `xbox_image_1138_640` varchar(128) default NULL,
  `xbox_image_424_640` varchar(128) default NULL,
  `xbox_image_640_640` varchar(128) default NULL,
  `xbox_image_424_100` varchar(128) default NULL,
  `category` varchar(40) default NULL,
  `copyright_type` int(11) default '0' COMMENT '°爨£º0 IPTV+OTT,1 ½�V',
  PRIMARY KEY  (`id`),
  KEY `tv_program_ext_code` (`code`),
  KEY `rating` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展';

/*Data for the table `tv_program_ext` */

LOCK TABLES `tv_program_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_promotion_rule` */

DROP TABLE IF EXISTS `tv_promotion_rule`;

CREATE TABLE `tv_promotion_rule` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(128) default NULL COMMENT '规则名称',
  `code` varchar(128) default NULL COMMENT '规则编码',
  `terminal_provider` varchar(128) default NULL COMMENT '设备厂商',
  `start_serial` varchar(128) default NULL COMMENT '开始设备序号',
  `end_serial` varchar(128) default NULL COMMENT '结束设备序号',
  `product_code` varchar(128) default NULL COMMENT '产品编码',
  `order_cycle` int(8) default NULL COMMENT '订购时长，单位：天',
  `valid_time` date default NULL COMMENT '规则生效时间',
  `expire_time` date default NULL COMMENT '规则失效时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='促销规则配置表';

/*Data for the table `tv_promotion_rule` */

LOCK TABLES `tv_promotion_rule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend` */

DROP TABLE IF EXISTS `tv_recommend`;

CREATE TABLE `tv_recommend` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(1024) default NULL COMMENT ' åç§°',
  `code` varchar(1024) default NULL COMMENT 'å”¯ä¸€æ ‡è¯†',
  `display_type` int(11) default NULL COMMENT 'å±•ç¤ºç±»åž‹ï¼Œ0ï¼šå›¾ç‰‡ï¼›1ï¼šæ–‡å­—ï¼›2ï¼šè§†é¢‘',
  `choose_method` int(11) default NULL COMMENT 'é€‰å–æ–¹å¼ï¼Œ0ï¼šæ—¶é—´ï¼›1ï¼šæƒé‡',
  `support_adv` int(11) default NULL COMMENT 'é€‰å–æ–¹å¼ï¼Œ0ï¼šä¸æ”¯æŒï¼›1ï¼šæ”¯æŒ',
  `adv_code` varchar(1024) default NULL COMMENT 'å¹¿å‘Šç¼–ç ï¼ŒSUPPORT_ADV=1æ—¶ï¼Œæœ‰æ•ˆ',
  `default_display` varchar(1024) default NULL COMMENT 'é»˜è®¤å±•ç¤ºå†…å®¹',
  `default_display_type` int(11) default NULL COMMENT 'é»˜è®¤å±•ç¤ºå†…å®¹ç±»åž‹ï¼Œå½“DISPLAY_TYPE=2æ—¶æœ‰æ•ˆï¼Œ2ï¼šVODï¼›3ï¼šCHANNELï¼›4ï¼šèŠ‚ç›®å•ï¼›',
  `default_target` varchar(1024) default NULL COMMENT 'é»˜è®¤ç›®æ ‡å¯¹è±¡å”¯ä¸€æ ‡è¯†',
  `default_target_type` int(11) default NULL COMMENT 'é»˜è®¤ç›®æ ‡å¯¹è±¡ç±»åž‹ï¼Œ0ï¼šVODï¼›1ï¼šCHANNELï¼›2ï¼šèŠ‚ç›®å•ï¼›3ï¼šåˆ†ç±»ï¼›4ï¼šä¸šåŠ¡å…¥å£ï¼›5ï¼šURL',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æŽ¨èä½';

/*Data for the table `tv_recommend` */

LOCK TABLES `tv_recommend` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend_ext` */

DROP TABLE IF EXISTS `tv_recommend_ext`;

CREATE TABLE `tv_recommend_ext` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(1024) default NULL,
  `code` varchar(1024) default NULL,
  `display_type` int(11) default NULL COMMENT '展示类型，0：图片；1：文字；2：视频',
  `choose_method` int(11) default NULL COMMENT '选取方式，0：时间；1：权重',
  `support_adv` int(11) default NULL COMMENT '选取方式，0：不支持；1：支持',
  `adv_code` varchar(1024) default NULL COMMENT '广告编码，SUPPORT_ADV=1时，有效',
  `default_display` varchar(1024) default NULL COMMENT '默认展示内容',
  `default_display_type` int(11) default NULL COMMENT '默认展示内容类型，当DISPLAY_TYPE=2时有效，2：VOD；3：CHANNEL；4：节目单；',
  `default_target` varchar(1024) default NULL COMMENT '默认目标对象唯一标识',
  `default_target_type` int(11) default NULL COMMENT '默认目标对象类型，0：VOD；1：CHANNEL；2：节目单；3：分类；4：业务入口；5：URL',
  `onlined_protocol` bigint(19) default NULL COMMENT '已经上线的编码协议',
  `modify_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_recommend_ext` */

LOCK TABLES `tv_recommend_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend_item` */

DROP TABLE IF EXISTS `tv_recommend_item`;

CREATE TABLE `tv_recommend_item` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `recommend_id` bigint(20) default NULL COMMENT 'recommend_id',
  `recommend_code` varchar(1024) default NULL COMMENT 'æŽ¨èä½å”¯ä¸€ç¼–ç ',
  `item_display` varchar(1024) default NULL COMMENT 'æ˜¾ç¤ºå†…å®¹',
  `item_display_type` varchar(1024) default NULL COMMENT 'å±•ç¤ºå†…å®¹ç±»åž‹ï¼Œ0ï¼šå›¾ç‰‡ï¼›1ï¼šæ–‡å­—ï¼›2ï¼šVODï¼›3ï¼šCHANNELï¼›4ï¼šèŠ‚ç›®å•ï¼›',
  `item_target` varchar(1024) default NULL COMMENT 'ç›®æ ‡å¯¹è±¡å†…å®¹',
  `item_target_type` varchar(1024) default NULL COMMENT 'ç›®æ ‡å¯¹è±¡ç±»åž‹ï¼Œ0ï¼šVODï¼›1ï¼šCHANNELï¼›2ï¼šèŠ‚ç›®å•ï¼›3ï¼šåˆ†ç±»ï¼›4ï¼šä¸šåŠ¡å…¥å£ï¼›5ï¼šURL',
  `power` int(11) default NULL COMMENT 'æƒé‡',
  `item_begin_time` datetime default NULL COMMENT 'èµ·å§‹æ—¶é—´',
  `item_end_time` datetime default NULL COMMENT 'ç»ˆæ­¢æ—¶é—´',
  `source_cate` varchar(1024) default NULL,
  `name` varchar(3000) default NULL,
  `sort` int(11) default NULL,
  `item_display_big` varchar(1024) default NULL,
  `description` varchar(3000) default NULL,
  `category_code_path` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æŽ¨èåˆ—è¡¨item';

/*Data for the table `tv_recommend_item` */

LOCK TABLES `tv_recommend_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend_item_ext` */

DROP TABLE IF EXISTS `tv_recommend_item_ext`;

CREATE TABLE `tv_recommend_item_ext` (
  `id` bigint(20) NOT NULL,
  `recommend_id` bigint(20) default NULL,
  `recommend_code` varchar(1024) default NULL,
  `item_display` varchar(1024) default NULL,
  `item_display_type` varchar(1024) default NULL COMMENT ' //默认展示内容类型，当DISPLAY_TYPE=2时有效，2：VOD；3：CHANNEL；4：节目单；',
  `item_target` varchar(1024) default NULL,
  `item_target_type` varchar(1024) default NULL COMMENT '//默认目标对象类型，0：VOD；1：CHANNEL；2：节目单；3：分类；4：业务入口；5：URL ',
  `power` int(11) default NULL,
  `item_begin_time` datetime default NULL,
  `item_end_time` datetime default NULL,
  `source_cate` varchar(1024) default NULL,
  `name` varchar(3000) default NULL,
  `sort` int(11) default NULL,
  `item_display_big` varchar(1024) default NULL,
  `description` varchar(3000) default NULL,
  `category_code_path` varchar(128) default NULL,
  `onlined_protocol` bigint(19) default NULL COMMENT '已经上线的编码协议',
  `item_display2` varchar(1024) default NULL,
  `item_display_big2` varchar(1024) default NULL,
  `modify_time` datetime default NULL,
  `onlined_bitrate` varchar(2048) default NULL,
  `onlined_protocol_audio` varchar(512) default NULL COMMENT '已经上线的带音频的编码协议码流音频',
  `app_mode` int(2) default '2' COMMENT '应用显示模式',
  `res_uri` varchar(256) default NULL COMMENT '资源URL',
  `mark` varchar(256) default NULL COMMENT '推荐位角标识图片路径',
  `mark_position` int(2) default '0' COMMENT '角标位置 0：左上；1：右上；2：左下；3：右下',
  `item_xbox_img` varchar(1024) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_recommend_item_ext_recommend_code` (`recommend_code`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_recommend_item_ext` */

LOCK TABLES `tv_recommend_item_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend_item_mark` */

DROP TABLE IF EXISTS `tv_recommend_item_mark`;

CREATE TABLE `tv_recommend_item_mark` (
  `id` bigint(20) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(128) default NULL,
  `pic` text,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_recommend_item_mark` */

LOCK TABLES `tv_recommend_item_mark` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_recommend_usergroupconfig` */

DROP TABLE IF EXISTS `tv_recommend_usergroupconfig`;

CREATE TABLE `tv_recommend_usergroupconfig` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tv_profile` varchar(128) default NULL,
  `tv_id` varchar(128) default NULL,
  `user_group` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐位业务分组配置';

/*Data for the table `tv_recommend_usergroupconfig` */

LOCK TABLES `tv_recommend_usergroupconfig` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_business_group_content` */

DROP TABLE IF EXISTS `tv_rel_business_group_content`;

CREATE TABLE `tv_rel_business_group_content` (
  `id` bigint(19) NOT NULL auto_increment,
  `business_group_code` varchar(256) default NULL,
  `content_code` varchar(256) default NULL,
  `create_time` datetime default NULL,
  `mark_url` varchar(150) default NULL,
  `mark_position` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tv_rel_bgc_gc` (`business_group_code`(255)),
  KEY `tv_rel_bgc_cc` (`content_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=487664 DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_business_group_content` */

LOCK TABLES `tv_rel_business_group_content` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_category` */

DROP TABLE IF EXISTS `tv_rel_category`;

CREATE TABLE `tv_rel_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `source_cate_code` varchar(128) NOT NULL COMMENT '最新更新栏目的CODE',
  `target_cate_code` varchar(128) NOT NULL COMMENT '最新更新栏目的关联栏目CODE',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=772 DEFAULT CHARSET=utf8 COMMENT='最新更新栏目的栏目关联表';

/*Data for the table `tv_rel_category` */

LOCK TABLES `tv_rel_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_conent_group_item` */

DROP TABLE IF EXISTS `tv_rel_conent_group_item`;

CREATE TABLE `tv_rel_conent_group_item` (
  `id` int(19) NOT NULL,
  `content_group_code` varchar(128) default NULL,
  `content_code` varchar(128) default NULL,
  `content_name` varchar(128) default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_conent_group_item` */

LOCK TABLES `tv_rel_conent_group_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_content_trailer` */

DROP TABLE IF EXISTS `tv_rel_content_trailer`;

CREATE TABLE `tv_rel_content_trailer` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `content_code` varchar(255) default NULL COMMENT '内容代码',
  `content_name` varchar(255) default NULL COMMENT '内容名称',
  `trailer_code` varchar(255) default NULL COMMENT '片花代码',
  `trailer_name` varchar(255) default NULL COMMENT '片花名称',
  `mark` text,
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3443 DEFAULT CHARSET=utf8 COMMENT='内容关联片花';

/*Data for the table `tv_rel_content_trailer` */

LOCK TABLES `tv_rel_content_trailer` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_country` */

DROP TABLE IF EXISTS `tv_rel_country`;

CREATE TABLE `tv_rel_country` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `keyword` varchar(1024) default NULL,
  `sort` int(4) default NULL COMMENT '顺序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区关联表';

/*Data for the table `tv_rel_country` */

LOCK TABLES `tv_rel_country` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_genre` */

DROP TABLE IF EXISTS `tv_rel_genre`;

CREATE TABLE `tv_rel_genre` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `keyword` varchar(1024) default NULL,
  `sort` int(4) default NULL COMMENT '顺序',
  `type` varchar(256) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目类型关联表';

/*Data for the table `tv_rel_genre` */

LOCK TABLES `tv_rel_genre` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_product_group` */

DROP TABLE IF EXISTS `tv_rel_product_group`;

CREATE TABLE `tv_rel_product_group` (
  `id` bigint(19) NOT NULL auto_increment,
  `p_code` varchar(256) default NULL,
  `pg_code` varchar(256) default NULL,
  `dc_code` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL,
  `publish_status` bigint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `rel_product_group_p_code` (`p_code`(255)),
  KEY `rel_product_group_pg_code` (`pg_code`(255)),
  KEY `rel_product_group_dc_code` (`dc_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=20989 DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_product_group` */

LOCK TABLES `tv_rel_product_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_product_live_program` */

DROP TABLE IF EXISTS `tv_rel_product_live_program`;

CREATE TABLE `tv_rel_product_live_program` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `product_code` varchar(128) default NULL COMMENT '产品代码',
  `item_code` varchar(128) default NULL COMMENT '直播节目代码',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品直播节目关系';

/*Data for the table `tv_rel_product_live_program` */

LOCK TABLES `tv_rel_product_live_program` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_product_package` */

DROP TABLE IF EXISTS `tv_rel_product_package`;

CREATE TABLE `tv_rel_product_package` (
  `id` bigint(19) NOT NULL auto_increment,
  `product_package_code` varchar(128) NOT NULL,
  `product_code` varchar(128) NOT NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  `life_cycle_start` datetime default NULL,
  `life_cycle_end` datetime default NULL,
  `life_cycle_flag` int(2) default NULL,
  `relative_time` bigint(19) default NULL,
  `description` varchar(512) default NULL,
  `free_validity_starttime` datetime default '1998-01-01 00:00:00' COMMENT '该赠送产品的赠送使用有效期的开始时间',
  `free_validity_endtime` datetime default '2099-01-01 23:59:59' COMMENT '该赠送产品的赠送使用有效期的结束时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1409 DEFAULT CHARSET=utf8 COMMENT='套餐产品关系表';

/*Data for the table `tv_rel_product_package` */

LOCK TABLES `tv_rel_product_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_product_service` */

DROP TABLE IF EXISTS `tv_rel_product_service`;

CREATE TABLE `tv_rel_product_service` (
  `id` bigint(19) NOT NULL auto_increment,
  `p_code` varchar(256) default NULL,
  `s_code` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL COMMENT '产品状态包含3种状态：生效：1（默认）、失效：0,删除：-1',
  `publish_status` bigint(1) default NULL COMMENT '包含2种状态：未发布：0（默认）、已发布：2',
  PRIMARY KEY  (`id`),
  KEY `rel_product_service_p_code` (`p_code`(255)),
  KEY `rel_product_service_s_code` (`s_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=15475 DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_product_service` */

LOCK TABLES `tv_rel_product_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_service_category` */

DROP TABLE IF EXISTS `tv_rel_service_category`;

CREATE TABLE `tv_rel_service_category` (
  `id` bigint(19) NOT NULL auto_increment,
  `c_code` varchar(256) default NULL,
  `s_code` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL,
  `publish_status` bigint(1) default NULL,
  `category_path` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `rel_service_category_c_code` (`c_code`(255)),
  KEY `rel_service_category_s_code` (`s_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=42233 DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_service_category` */

LOCK TABLES `tv_rel_service_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_service_content` */

DROP TABLE IF EXISTS `tv_rel_service_content`;

CREATE TABLE `tv_rel_service_content` (
  `id` bigint(19) NOT NULL auto_increment,
  `s_code` varchar(256) default NULL,
  `c_code` varchar(256) default NULL,
  `validity_status` bigint(1) default NULL COMMENT '产品状态包含3种状态：生效：1（默认）、失效：0,删除：-1',
  `content_type` varchar(256) default NULL COMMENT '包含2种类型：vod;Series',
  `publish_status` bigint(1) default NULL COMMENT '包含2种状态：未发布：0（默认）、已发布：2',
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  `category_path` varchar(1024) default NULL COMMENT '节目所属栏目的path,对应多个栏目时竖线隔开',
  PRIMARY KEY  (`id`),
  KEY `rel_service_content_c_code` (`c_code`(255)),
  KEY `rel_service_content_s_code` (`s_code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=11716372 DEFAULT CHARSET=utf8;

/*Data for the table `tv_rel_service_content` */

LOCK TABLES `tv_rel_service_content` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_rel_topic_category` */

DROP TABLE IF EXISTS `tv_rel_topic_category`;

CREATE TABLE `tv_rel_topic_category` (
  `id` bigint(19) NOT NULL auto_increment,
  `category_code` varchar(256) default NULL COMMENT '栏目编码',
  `category_path` varchar(256) default NULL COMMENT '栏目路径',
  `topic_code` varchar(256) default NULL COMMENT '专题编码',
  `validity_status` bigint(1) default NULL COMMENT '上线下线状态：0是下线，1是上线',
  `publish_status` bigint(1) default NULL COMMENT '发布状态',
  `sequence` int(11) default NULL COMMENT '排序值',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`),
  KEY `category_code` (`category_code`(255)),
  KEY `topic_r_code_status` (`topic_code`(255),`validity_status`)
) ENGINE=InnoDB AUTO_INCREMENT=14068 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `tv_rel_topic_category` */

LOCK TABLES `tv_rel_topic_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_remove_fid` */

DROP TABLE IF EXISTS `tv_remove_fid`;

CREATE TABLE `tv_remove_fid` (
  `id` bigint(20) NOT NULL auto_increment,
  `ter_code` varchar(256) default NULL,
  `model_code` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_REMOVE_FID_CODE_I` (`ter_code`),
  KEY `TV_REMOVE_FID_MCODE_I` (`model_code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tv_remove_fid` */

LOCK TABLES `tv_remove_fid` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_replace_device_his` */

DROP TABLE IF EXISTS `tv_replace_device_his`;

CREATE TABLE `tv_replace_device_his` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `user_id` varchar(128) default NULL COMMENT '用户标识',
  `old_tvid` varchar(128) default NULL COMMENT '替换前设备标识',
  `new_tvid` varchar(128) default NULL COMMENT '替换后设备标识',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更换时间',
  `status` int(2) default NULL COMMENT '状态:0:更换失败；1：更换成功',
  `old_user_id` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150486 DEFAULT CHARSET=utf8 COMMENT='设备更换历史表';

/*Data for the table `tv_replace_device_his` */

LOCK TABLES `tv_replace_device_his` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_schedule` */

DROP TABLE IF EXISTS `tv_schedule`;

CREATE TABLE `tv_schedule` (
  `id` bigint(20) NOT NULL,
  `name` varchar(128) default NULL,
  `description` text,
  `channel_code` varchar(128) default NULL,
  `start_time` datetime default NULL,
  `end_time` datetime default NULL,
  `reserve1` varchar(128) default NULL,
  `reserve2` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_schedule` */

LOCK TABLES `tv_schedule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_search_tag` */

DROP TABLE IF EXISTS `tv_search_tag`;

CREATE TABLE `tv_search_tag` (
  `id` int(11) NOT NULL default '0',
  `tag_type` int(11) default NULL COMMENT '电影=0,电视剧=1,少儿=2',
  `search_type` int(11) default NULL COMMENT '类型=0,地区=1,年代=2',
  `tag_name` varchar(128) default NULL,
  `tag_keyword` varchar(128) default NULL,
  `order_num` int(11) default NULL COMMENT '倒叙排列',
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_search_tag` */

LOCK TABLES `tv_search_tag` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_series_episode` */

DROP TABLE IF EXISTS `tv_series_episode`;

CREATE TABLE `tv_series_episode` (
  `id` bigint(20) NOT NULL,
  `series_code` varchar(128) default NULL,
  `episode_code` varchar(128) default NULL,
  `episode_index` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_series_episode` */

LOCK TABLES `tv_series_episode` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_server_config` */

DROP TABLE IF EXISTS `tv_server_config`;

CREATE TABLE `tv_server_config` (
  `id` int(11) NOT NULL auto_increment,
  `terminal_provider_code` varchar(1024) default NULL,
  `server_type` varchar(1024) default NULL,
  `server_portal_address` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tv_server_config` */

LOCK TABLES `tv_server_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_service` */

DROP TABLE IF EXISTS `tv_service`;

CREATE TABLE `tv_service` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(256) NOT NULL COMMENT '服务唯一标识',
  `name` varchar(256) default NULL,
  `type` varchar(256) default NULL COMMENT '服务包含3类：PPV、SVOD、PVOD',
  `price` float(10,2) default NULL COMMENT '服务的参考价格',
  `validity_status` bigint(1) default NULL COMMENT '服务状态包含3种状态：生效：1（默认）、失效：0,删除：-1',
  `publish_status` bigint(1) default NULL COMMENT '包含3种状态：未发布：0（默认）、部分发布：1、已发布：2',
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `operator_name` varchar(256) default NULL,
  `description` varchar(3072) default NULL,
  `bitrate` varchar(128) default NULL COMMENT '码流信息',
  PRIMARY KEY  (`id`),
  KEY `service_code` (`code`(255))
) ENGINE=InnoDB AUTO_INCREMENT=12859 DEFAULT CHARSET=utf8;

/*Data for the table `tv_service` */

LOCK TABLES `tv_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_service_group_config` */

DROP TABLE IF EXISTS `tv_service_group_config`;

CREATE TABLE `tv_service_group_config` (
  `id` int(11) NOT NULL auto_increment,
  `service_group_code` varchar(128) default NULL,
  `service_type` varchar(128) default NULL,
  `service_code0` varchar(128) default NULL,
  `service_url0` varchar(256) default NULL,
  `service_code1` varchar(128) default NULL,
  `service_url1` varchar(256) default NULL,
  `service_code2` varchar(128) default NULL,
  `service_url2` varchar(256) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_SERVICE_GROUP_CONFIG_I` (`service_group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6812 DEFAULT CHARSET=utf8;

/*Data for the table `tv_service_group_config` */

LOCK TABLES `tv_service_group_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_short_comment_detail` */

DROP TABLE IF EXISTS `tv_short_comment_detail`;

CREATE TABLE `tv_short_comment_detail` (
  `id` bigint(19) NOT NULL auto_increment,
  `comment_id` bigint(19) NOT NULL,
  `content_code` varchar(384) default NULL,
  `summary` varchar(798) default NULL,
  `nickname` varchar(192) default NULL,
  `publish_time` datetime default NULL,
  `movie_id` bigint(19) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短影评信息';

/*Data for the table `tv_short_comment_detail` */

LOCK TABLES `tv_short_comment_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_soft_upgrade` */

DROP TABLE IF EXISTS `tv_soft_upgrade`;

CREATE TABLE `tv_soft_upgrade` (
  `ID` bigint(19) NOT NULL,
  `SOFT_CODE` varchar(128) default NULL,
  `SOFT_NAME` varchar(128) default NULL,
  `SOFT_SIZE` bigint(19) default NULL,
  `STATUS` bigint(2) default NULL,
  `UPGRADE_MODE` bigint(2) default NULL,
  `VERSION` varchar(20) default NULL,
  `FILE_URL` varchar(128) default NULL,
  `FILE_HASH` varchar(128) default NULL,
  `COMPRESS_TYPE` bigint(2) default NULL,
  `CREATE_TIME` date default NULL,
  `VENDOR_ID` varchar(128) default NULL,
  `TV_MODEL` varchar(128) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_soft_upgrade` */

LOCK TABLES `tv_soft_upgrade` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_source_enum` */

DROP TABLE IF EXISTS `tv_source_enum`;

CREATE TABLE `tv_source_enum` (
  `id` bigint(19) NOT NULL auto_increment,
  `name` varchar(32) default NULL COMMENT '枚举名称',
  `value` int(19) default NULL COMMENT '枚举值',
  `type` varchar(32) default NULL COMMENT '枚举类型',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='source枚举表';

/*Data for the table `tv_source_enum` */

LOCK TABLES `tv_source_enum` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_source_seekmode` */

DROP TABLE IF EXISTS `tv_source_seekmode`;

CREATE TABLE `tv_source_seekmode` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(1024) NOT NULL,
  `mode` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tv_source_seekmode` */

LOCK TABLES `tv_source_seekmode` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_sub_cate_filter` */

DROP TABLE IF EXISTS `tv_sub_cate_filter`;

CREATE TABLE `tv_sub_cate_filter` (
  `id` int(11) NOT NULL auto_increment,
  `user_group_code` varchar(1024) default NULL,
  `category_code` varchar(1024) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tv_sub_cate_filter` */

LOCK TABLES `tv_sub_cate_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber` */

DROP TABLE IF EXISTS `tv_subscriber`;

CREATE TABLE `tv_subscriber` (
  `id` bigint(12) NOT NULL auto_increment,
  `customer_id` bigint(12) default NULL,
  `nick_name` varchar(64) default NULL,
  `tvid` varchar(128) default NULL,
  `user_account` varchar(128) default NULL,
  `password` varchar(64) default NULL,
  `status` int(2) default NULL COMMENT '用户状态包括：\r\n            -1：已删除\r\n            0：待开通\r\n            1：已开通\r\n            2：暂停',
  `region_code` varchar(16) default NULL,
  `user_type` varchar(64) default NULL,
  `user_group` varchar(64) default NULL,
  `terminal_model` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `open_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `terminal_provider` varchar(64) default NULL,
  `batch_no` varchar(128) default NULL,
  `rule_id` bigint(20) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `user_kind` int(2) unsigned default '0',
  `series_code` varchar(50) default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  `busi_type` int(2) default '1' COMMENT 'ç»ˆç«¯ä¸šåŠ¡ç±»åž‹  1: ctvã€2:padã€3:æœºé¡¶ç›’',
  `tvprofile` varchar(1024) default NULL COMMENT 'ç»ˆç«¯æäº¤çš„profile',
  `net_operator_code` varchar(256) default NULL COMMENT 'è¿è¡Œå•†Code',
  `package_code` varchar(256) default NULL COMMENT 'å¥—é¤åŒ…Code',
  `distributor` varchar(256) default NULL COMMENT 'æ¸ é“å•†ä¿¡æ¯',
  `subscriber_group_code` varchar(256) default NULL COMMENT 'ç”¨æˆ·åˆ†ç»„Code',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `TV_SUB_L_USER_I` (`user_account`),
  KEY `TV_SUB_L_TVID_I` (`tvid`,`terminal_model`,`terminal_provider`)
) ENGINE=MyISAM AUTO_INCREMENT=2181954 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ä¿¡æ¯';

/*Data for the table `tv_subscriber` */

LOCK TABLES `tv_subscriber` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_group` */

DROP TABLE IF EXISTS `tv_subscriber_group`;

CREATE TABLE `tv_subscriber_group` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(256) default NULL COMMENT '用户分组名称',
  `code` varchar(256) default NULL COMMENT '用户分组编码',
  `descr` varchar(256) default NULL COMMENT '说明信息',
  `net_operator_code` varchar(256) default NULL COMMENT '运营商编码',
  `package_code` varchar(256) default NULL COMMENT '套餐编码',
  `net_operator_name` varchar(256) default NULL COMMENT '运营商名称',
  `package_name` varchar(256) default NULL COMMENT '套餐名称',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '修改时间',
  `subscriber_limit` bigint(20) default '-1' COMMENT '-1：默认值，表示不控制该类用户的数量；其他值表示上限个数',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8 COMMENT='用户分组表';

/*Data for the table `tv_subscriber_group` */

LOCK TABLES `tv_subscriber_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_local` */

DROP TABLE IF EXISTS `tv_subscriber_local`;

CREATE TABLE `tv_subscriber_local` (
  `id` bigint(12) NOT NULL auto_increment,
  `customer_id` bigint(12) default NULL,
  `nick_name` varchar(64) default NULL,
  `tvid` varchar(128) default NULL,
  `user_account` varchar(128) default NULL,
  `password` varchar(64) default NULL,
  `status` int(2) default '1' COMMENT '用户状态包括: -1：已删除  0：待开通 1：已开通 2：暂停',
  `region_code` varchar(16) default NULL,
  `user_type` varchar(64) default NULL,
  `user_group` varchar(64) default NULL,
  `terminal_model` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `open_time` datetime default NULL,
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `terminal_provider` varchar(64) default NULL,
  `batch_no` varchar(128) default NULL,
  `rule_id` bigint(20) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `user_kind` int(2) unsigned default '0',
  `series_code` varchar(50) default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  `busi_type` int(2) default '1' COMMENT 'ç»ˆç«¯ä¸šåŠ¡ç±»åž‹  1: ctvã€2:padã€3:æœºé¡¶ç›’',
  `tvprofile` varchar(1024) default NULL COMMENT 'ç»ˆç«¯æäº¤çš„profile',
  `net_operator_code` varchar(256) default NULL COMMENT 'è¿è¡Œå•†Code',
  `package_code` varchar(256) default NULL COMMENT 'å¥—é¤åŒ…Code',
  `distributor` varchar(256) default NULL COMMENT 'æ¸ é“å•†ä¿¡æ¯',
  `subscriber_group_code` varchar(256) default NULL COMMENT 'ç”¨æˆ·åˆ†ç»„Code',
  `partner_user_id` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `TV_SUB_L_USER_I` (`user_account`),
  KEY `TV_SUB_L_TVID_I` (`tvid`,`terminal_model`,`terminal_provider`),
  KEY `customer_id` (`customer_id`),
  KEY `partner_user_id` (`partner_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9286349 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ä¿¡æ¯';

/*Data for the table `tv_subscriber_local` */

LOCK TABLES `tv_subscriber_local` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_local_20130626` */

DROP TABLE IF EXISTS `tv_subscriber_local_20130626`;

CREATE TABLE `tv_subscriber_local_20130626` (
  `id` bigint(12) NOT NULL default '0',
  `customer_id` bigint(12) default NULL,
  `nick_name` varchar(64) character set utf8 default NULL,
  `tvid` varchar(128) character set utf8 default NULL,
  `user_account` varchar(128) character set utf8 default NULL,
  `password` varchar(64) character set utf8 default NULL,
  `status` int(2) default '1' COMMENT '用户状态包括: -1：已删除  0：待开通 1：已开通 2：暂停',
  `region_code` varchar(16) character set utf8 default NULL,
  `user_type` varchar(64) character set utf8 default NULL,
  `user_group` varchar(64) character set utf8 default NULL,
  `terminal_model` varchar(128) character set utf8 default NULL,
  `ip_address` varchar(250) character set utf8 default NULL,
  `open_time` datetime default NULL,
  `update_time` datetime default NULL,
  `terminal_provider` varchar(64) character set utf8 default NULL,
  `batch_no` varchar(128) character set utf8 default NULL,
  `rule_id` bigint(20) default NULL,
  `terminal_group_code` varchar(128) character set utf8 default NULL,
  `user_kind` int(2) unsigned default '0',
  `series_code` varchar(50) character set utf8 default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  `busi_type` int(2) default '1' COMMENT 'ç»ˆç«¯ä¸šåŠ¡ç±»åž‹  1: ctvã€2:padã€3:æœºé¡¶ç›’',
  `tvprofile` varchar(1024) character set utf8 default NULL COMMENT 'ç»ˆç«¯æäº¤çš„profile',
  `net_operator_code` varchar(256) character set utf8 default NULL COMMENT 'è¿è¡Œå•†Code',
  `package_code` varchar(256) character set utf8 default NULL COMMENT 'å¥—é¤åŒ…Code',
  `distributor` varchar(256) character set utf8 default NULL COMMENT 'æ¸ é“å•†ä¿¡æ¯',
  `subscriber_group_code` varchar(256) character set utf8 default NULL COMMENT 'ç”¨æˆ·åˆ†ç»„Code'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_subscriber_local_20130626` */

LOCK TABLES `tv_subscriber_local_20130626` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_local_ext` */

DROP TABLE IF EXISTS `tv_subscriber_local_ext`;

CREATE TABLE `tv_subscriber_local_ext` (
  `id` bigint(12) NOT NULL auto_increment,
  `customer_id` bigint(12) default NULL,
  `nick_name` varchar(64) default NULL,
  `tvid` varchar(128) default NULL,
  `user_account` varchar(128) default NULL,
  `password` varchar(64) default NULL,
  `status` int(2) default '1' COMMENT '用户状态包括: -1：已删除  0：待开通 1：已开通 2：暂停',
  `region_code` varchar(16) default NULL,
  `user_type` varchar(64) default NULL,
  `user_group` varchar(64) default NULL,
  `terminal_model` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `open_time` datetime default NULL,
  `update_time` datetime default NULL,
  `terminal_provider` varchar(64) default NULL,
  `batch_no` varchar(128) default NULL,
  `rule_id` bigint(20) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `user_kind` int(2) unsigned default '0',
  `series_code` varchar(50) default NULL,
  `busi_type` int(2) default '1',
  `tvprofile` varchar(1024) default NULL,
  `net_operator_code` varchar(256) default NULL,
  `package_code` varchar(256) default NULL,
  `distributor` varchar(256) default NULL,
  `subscriber_group_code` varchar(256) default NULL,
  `partner_user_id` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `TV_SUB_L_USER_I` (`user_account`),
  KEY `TV_SUB_L_TVID_I` (`tvid`,`terminal_model`,`terminal_provider`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13828097 DEFAULT CHARSET=utf8 COMMENT='用户信息新表';

/*Data for the table `tv_subscriber_local_ext` */

LOCK TABLES `tv_subscriber_local_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_rule` */

DROP TABLE IF EXISTS `tv_subscriber_rule`;

CREATE TABLE `tv_subscriber_rule` (
  `id` bigint(20) NOT NULL auto_increment,
  `group_code` varchar(128) default NULL,
  `terminal_model` varchar(4000) default NULL,
  `rule` varchar(512) default NULL,
  `status` int(11) default NULL,
  `money` int(11) default NULL,
  `type` int(11) default NULL,
  `valid_month` int(11) default NULL,
  `valid_time` datetime default NULL,
  `expire_time` datetime default NULL,
  `batch_no` varchar(128) default NULL,
  `terminal_provider_code` varchar(128) default NULL,
  `serial_start` varchar(24) default NULL,
  `serial_end` varchar(24) default NULL,
  `user_start` varchar(64) default NULL,
  `user_end` varchar(64) default NULL,
  `assign_type` int(11) default NULL,
  `match_type` int(11) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `product_group_code` varchar(256) default NULL,
  `user_kind` varchar(1) default NULL,
  `series_code` varchar(4000) default NULL,
  `distributor` varchar(256) default NULL COMMENT '渠道商',
  `subscriber_group_code` varchar(256) default NULL COMMENT '用户分组',
  `net_operator_code` varchar(256) default NULL COMMENT '运营商',
  `report_type` int(11) default '1',
  PRIMARY KEY  (`id`),
  KEY `TV_SUB_TM_TVID_I` (`terminal_model`(255)),
  KEY `series_code` (`series_code`(255)),
  KEY `TV_PROVIDER_TYPE` (`terminal_provider_code`,`report_type`)
) ENGINE=InnoDB AUTO_INCREMENT=541373 DEFAULT CHARSET=utf8 COMMENT='ç»ˆç«¯å¼€æˆ·é…ç½®';

/*Data for the table `tv_subscriber_rule` */

LOCK TABLES `tv_subscriber_rule` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_rule_adjust` */

DROP TABLE IF EXISTS `tv_subscriber_rule_adjust`;

CREATE TABLE `tv_subscriber_rule_adjust` (
  `id` bigint(20) NOT NULL auto_increment,
  `group_code` varchar(128) default NULL,
  `terminal_model` varchar(4000) default NULL,
  `rule` varchar(512) default NULL,
  `status` int(11) default NULL,
  `money` int(11) default NULL,
  `type` int(11) default NULL,
  `valid_month` int(11) default NULL,
  `valid_time` datetime default NULL,
  `expire_time` datetime default NULL,
  `update_time` datetime default NULL,
  `batch_no` varchar(128) default NULL,
  `terminal_provider_code` varchar(128) default NULL,
  `serial_start` varchar(24) default NULL,
  `serial_end` varchar(24) default NULL,
  `user_start` varchar(64) default NULL,
  `user_end` varchar(64) default NULL,
  `assign_type` int(11) default NULL,
  `match_type` int(11) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `product_group_code` varchar(256) default NULL,
  `user_kind` varchar(1) default NULL,
  `series_code` varchar(50) default NULL COMMENT '厂商产品系列',
  `distributor` varchar(256) default NULL COMMENT '渠道商',
  `subscriber_group_code` varchar(256) default NULL COMMENT '用户分组',
  `net_operator_code` varchar(256) default NULL COMMENT '运营商',
  PRIMARY KEY  (`id`),
  KEY `series_code` (`series_code`),
  KEY `TV_SUB_TM_TVID_I` (`terminal_model`(255))
) ENGINE=InnoDB AUTO_INCREMENT=85912 DEFAULT CHARSET=utf8;

/*Data for the table `tv_subscriber_rule_adjust` */

LOCK TABLES `tv_subscriber_rule_adjust` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_session` */

DROP TABLE IF EXISTS `tv_subscriber_session`;

CREATE TABLE `tv_subscriber_session` (
  `id` bigint(12) NOT NULL auto_increment,
  `sub_id` bigint(12) default NULL,
  `tvid` varchar(128) default NULL,
  `token` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `expire_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `user_id` varchar(128) default NULL,
  `mac` varchar(128) default NULL,
  `tvprofile` varchar(1024) default NULL COMMENT 'ç»ˆç«¯æäº¤çš„profile',
  `series_code` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_SUB_SESSION_I` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=15515765 DEFAULT CHARSET=utf8;

/*Data for the table `tv_subscriber_session` */

LOCK TABLES `tv_subscriber_session` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_subscriber_session_ext` */

DROP TABLE IF EXISTS `tv_subscriber_session_ext`;

CREATE TABLE `tv_subscriber_session_ext` (
  `id` bigint(12) NOT NULL auto_increment,
  `sub_id` bigint(12) default NULL,
  `tvid` varchar(128) default NULL,
  `token` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `expire_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `user_id` varchar(128) default NULL,
  `mac` varchar(128) default NULL,
  `tvprofile` varchar(1024) default NULL,
  `series_code` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_SUB_SESSION_EXT_I` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=22375142 DEFAULT CHARSET=utf8;

/*Data for the table `tv_subscriber_session_ext` */

LOCK TABLES `tv_subscriber_session_ext` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_support302_Terminal` */

DROP TABLE IF EXISTS `tv_support302_Terminal`;

CREATE TABLE `tv_support302_Terminal` (
  `id` int(19) default NULL,
  `terminalProvider` varchar(256) default NULL COMMENT '厂商',
  `terminalModel` varchar(1028) default NULL COMMENT '型号',
  `support` int(2) default NULL COMMENT '是否支持302: 0:支持;1:不支持',
  KEY `terminalProvider` (`terminalProvider`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_support302_Terminal` */

LOCK TABLES `tv_support302_Terminal` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal` */

DROP TABLE IF EXISTS `tv_terminal`;

CREATE TABLE `tv_terminal` (
  `id` bigint(19) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `model` varchar(128) NOT NULL,
  `provider_code` varchar(128) default NULL,
  `latest_version` float default NULL,
  `force_update` int(1) default NULL,
  `identify_code` varchar(1024) default NULL,
  `user_group_code` varchar(128) default NULL,
  `terminal_group_code` varchar(128) default NULL,
  `product_group_code` varchar(256) default NULL,
  `tseriesid` bigint(19) default NULL COMMENT 'ç»ˆç«¯äº§å“åºåˆ—id',
  `series_code` varchar(50) default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  PRIMARY KEY  (`id`),
  KEY `TV_TERMINAL_PC_TVID_I` (`provider_code`),
  KEY `TV_TERMINAL_M_TVID_I` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7949 DEFAULT CHARSET=utf8 COMMENT='åž‹å·';

/*Data for the table `tv_terminal` */

LOCK TABLES `tv_terminal` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal_filter` */

DROP TABLE IF EXISTS `tv_terminal_filter`;

CREATE TABLE `tv_terminal_filter` (
  `id` bigint(20) NOT NULL auto_increment,
  `term_code` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tv_terminal_filter` */

LOCK TABLES `tv_terminal_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal_group` */

DROP TABLE IF EXISTS `tv_terminal_group`;

CREATE TABLE `tv_terminal_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `type` int(11) default NULL,
  `service_group_code` varchar(128) default NULL,
  `description` varchar(256) default NULL,
  `cdn` varchar(128) NOT NULL,
  `bsd_flag` varchar(8) default '0',
  PRIMARY KEY  (`id`),
  KEY `TV_TERMINAL_GROUP_I` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

/*Data for the table `tv_terminal_group` */

LOCK TABLES `tv_terminal_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal_module_config` */

DROP TABLE IF EXISTS `tv_terminal_module_config`;

CREATE TABLE `tv_terminal_module_config` (
  `id` bigint(19) NOT NULL auto_increment COMMENT '主键',
  `serial_prefix` varchar(16) default NULL COMMENT '设备序列号前4位',
  `terminal_provider` varchar(128) default NULL COMMENT '设备厂商',
  `terminal_model` varchar(128) default NULL COMMENT '设备型号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='设备型号配置表';

/*Data for the table `tv_terminal_module_config` */

LOCK TABLES `tv_terminal_module_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal_series` */

DROP TABLE IF EXISTS `tv_terminal_series`;

CREATE TABLE `tv_terminal_series` (
  `tseries_id` bigint(19) NOT NULL auto_increment COMMENT 'ç»ˆç«¯äº§å“åºåˆ—id',
  `tseries_nm` varchar(200) default NULL COMMENT 'åºåˆ—åç§°',
  `series_code` varchar(50) default NULL COMMENT 'åŽ‚å•†äº§å“åºåˆ—',
  `provider_id` varchar(32) default NULL COMMENT 'åŽ‚å•†id',
  `provider_code` varchar(50) default NULL COMMENT 'åŽ‚å•†ç¼–ç ',
  `busi_type` int(2) default '1' COMMENT 'ç»ˆç«¯ä¸šåŠ¡ç±»åž‹  1: ctvã€2:padã€3:æœºé¡¶ç›’',
  `series_type` int(1) default NULL COMMENT '0:CLIENT,1:WEB',
  `create_time` datetime default NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime default NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `create_id` varchar(50) default NULL COMMENT 'åˆ›å»ºäºº',
  `mender_id` varchar(50) default NULL COMMENT 'ä¿®æ”¹äºº',
  `del_flag` int(1) default '0' COMMENT '0 æ­£å¸¸ 1 åˆ é™¤',
  `remark` varchar(2000) default NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY  (`tseries_id`),
  KEY `series_code` (`series_code`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8 COMMENT='ç»ˆç«¯äº§å“åºåˆ—--åŽ‚å•†ä¸‹åºåˆ—äº§å“ï¼Œå¯èƒ½åŒ…å«å¤šä';

/*Data for the table `tv_terminal_series` */

LOCK TABLES `tv_terminal_series` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_terminal_version_info` */

DROP TABLE IF EXISTS `tv_terminal_version_info`;

CREATE TABLE `tv_terminal_version_info` (
  `id` bigint(19) NOT NULL auto_increment,
  `tvid` varchar(256) default NULL,
  `user_account` varchar(256) default NULL,
  `version_before` varchar(256) default NULL,
  `version_now` varchar(256) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `terminl_model` varchar(256) default NULL,
  `upgrade_model` int(2) default NULL,
  `identify` varchar(256) default NULL,
  `System_version` varchar(256) default NULL,
  `info_type` int(2) default '0',
  PRIMARY KEY  (`id`),
  KEY `tvid_infotype` (`tvid`(255),`info_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1579953 DEFAULT CHARSET=utf8;

/*Data for the table `tv_terminal_version_info` */

LOCK TABLES `tv_terminal_version_info` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_topic` */

DROP TABLE IF EXISTS `tv_topic`;

CREATE TABLE `tv_topic` (
  `id` int(19) NOT NULL auto_increment,
  `code` varchar(32) NOT NULL COMMENT '专题code',
  `name` varchar(128) default NULL COMMENT '专题名称',
  `poster` varchar(256) default NULL COMMENT '海报URL',
  `bg_pic` varchar(256) default NULL COMMENT '背景图片URL',
  `template_type` int(2) default NULL COMMENT '模板类型，1=影视模板，2=连播模板，3=混合模板，4=直播模板',
  `description` varchar(256) default NULL COMMENT '描述',
  `status` int(2) default NULL COMMENT '状态，0=生效, 1=失效, -1=删除',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`,`code`),
  UNIQUE KEY `id` (`id`),
  KEY `topic_code_status` (`code`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `tv_topic` */

LOCK TABLES `tv_topic` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_topic_category` */

DROP TABLE IF EXISTS `tv_topic_category`;

CREATE TABLE `tv_topic_category` (
  `id` bigint(11) NOT NULL auto_increment,
  `code` varchar(32) NOT NULL COMMENT '栏目唯一标识',
  `parent_code` varchar(32) default NULL COMMENT '父栏目唯一标识',
  `category_path` varchar(128) default NULL COMMENT '栏目路径',
  `name` varchar(128) default NULL COMMENT '栏目名称',
  `description` varchar(512) default NULL COMMENT '栏目描述',
  `icon1` varchar(128) default NULL COMMENT '小图标1',
  `sequence` int(4) default NULL COMMENT '排列顺序',
  `mark_position` int(2) default NULL COMMENT '角标位置：0：左上（默认）；1：右上；2：左下；3：右下',
  `mark_uri` varchar(256) default NULL COMMENT '栏目角标识图片路径',
  `status` int(2) default NULL COMMENT '可视状态',
  `child_number` int(9) default NULL COMMENT '字节点数',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`,`code`),
  UNIQUE KEY `id` (`id`),
  KEY `topic_c_code_status` (`code`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `tv_topic_category` */

LOCK TABLES `tv_topic_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_topic_item` */

DROP TABLE IF EXISTS `tv_topic_item`;

CREATE TABLE `tv_topic_item` (
  `id` int(19) NOT NULL auto_increment,
  `topic_code` varchar(128) NOT NULL COMMENT '专题编码',
  `topic_id` int(19) NOT NULL COMMENT '专题ID',
  `item_type` int(1) NOT NULL default '-1' COMMENT '0：单剧集|多剧集视频(不区分) 2：直播频道   4:直播节目；其他-1',
  `item_code` varchar(128) NOT NULL COMMENT '元素编码',
  `category_code_path` varchar(128) default NULL COMMENT '栏目编码路径',
  `item_uri` varchar(128) NOT NULL COMMENT '元素URI',
  `item_res_uri` varchar(128) default NULL COMMENT '元素ResURI',
  `link_type` int(1) NOT NULL COMMENT '终端接口对应的类型',
  `package_name` varchar(128) default NULL COMMENT 'APP启动包名',
  `show_name` varchar(128) NOT NULL COMMENT '显示名称',
  `status` int(1) NOT NULL COMMENT '状态，0=生效, 1=失效, -1=删除',
  `sequence` int(11) NOT NULL default '999' COMMENT '排序值',
  `begin_time` datetime default NULL COMMENT '直播回看开始时间',
  `end_time` datetime default NULL COMMENT '直播回看结束时间',
  `item_poster` varchar(256) default NULL COMMENT '元素海报',
  `item_suolue` varchar(256) default NULL COMMENT '元素缩略图',
  `director` varchar(256) default NULL COMMENT '导演',
  `actor` varchar(256) default NULL COMMENT '演员',
  `open_look_back` int(1) default NULL COMMENT '是否打开回看，0=否，1=是',
  `update_time` datetime default NULL COMMENT '更新时间',
  `description` varchar(256) default NULL COMMENT '描述',
  `live_poster` varchar(256) default NULL,
  `live_suolue` varchar(256) default NULL,
  `show_type` int(1) NOT NULL default '0' COMMENT '1=影视，2=连播，3=直播/回看，4=分类，5=URI/APP',
  PRIMARY KEY  (`id`,`topic_code`),
  KEY `topic_i_code_status` (`topic_code`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6835 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `tv_topic_item` */

LOCK TABLES `tv_topic_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_down_recorder` */

DROP TABLE IF EXISTS `tv_upgrade_down_recorder`;

CREATE TABLE `tv_upgrade_down_recorder` (
  `id` bigint(19) NOT NULL auto_increment,
  `plan_code` varchar(256) default NULL,
  `insert_time` datetime default NULL,
  `recoder_desc` varchar(2000) default NULL,
  `down_time` int(10) default NULL,
  `mac` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tv_upgrade_down_recorder` */

LOCK TABLES `tv_upgrade_down_recorder` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_filter` */

DROP TABLE IF EXISTS `tv_upgrade_filter`;

CREATE TABLE `tv_upgrade_filter` (
  `ID` bigint(19) NOT NULL,
  `CODE` varchar(128) default NULL,
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(2000) default NULL,
  `net_Operator_id` bigint(19) default NULL,
  `MAC_START` varchar(256) NOT NULL,
  `MAC_END` varchar(256) NOT NULL,
  `INSERT_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_upgrade_filter` */

LOCK TABLES `tv_upgrade_filter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_package` */

DROP TABLE IF EXISTS `tv_upgrade_package`;

CREATE TABLE `tv_upgrade_package` (
  `ID` bigint(19) NOT NULL,
  `CODE` varchar(128) default NULL,
  `NAME` varchar(200) NOT NULL,
  `DES` varchar(2000) default NULL,
  `FILE_SIZE` bigint(20) default NULL,
  `FILE_URL` varchar(256) default NULL,
  `FILE_HASH` varchar(128) default NULL,
  `COMPRESS_TYPE` bigint(2) default NULL,
  `package_version` varchar(128) default NULL,
  `net_operator_id` bigint(19) default NULL,
  `is_first` bigint(1) default NULL,
  `INSERT_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `DEL_STATUS` bigint(2) default NULL,
  `upgrade_info_file` varchar(1000) default NULL,
  `upgrade_info_MD5` varchar(256) default NULL,
  `upgrade_file_type` bigint(1) default NULL,
  `package_type` int(2) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_upgrade_package` */

LOCK TABLES `tv_upgrade_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_plan` */

DROP TABLE IF EXISTS `tv_upgrade_plan`;

CREATE TABLE `tv_upgrade_plan` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(200) NOT NULL,
  `des` varchar(2000) default NULL,
  `sup_version` varchar(4000) default NULL,
  `upgrade_switch` bigint(2) NOT NULL,
  `insert_time` datetime default NULL,
  `update_time` datetime default NULL,
  `group_code` varchar(128) default NULL,
  `package_id` bigint(19) default NULL,
  `plan_type` int(2) default '0',
  `upgrade_model` bigint(2) default NULL,
  `net_operator_id` bigint(19) default NULL,
  `valid_start` datetime default NULL,
  `valid_end` datetime default NULL,
  `down_package_time` int(10) default '5',
  `is_reset` int(2) default '0',
  `premise_plan` varchar(256) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_upgrade_plan` */

LOCK TABLES `tv_upgrade_plan` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_resource_package` */

DROP TABLE IF EXISTS `tv_upgrade_resource_package`;

CREATE TABLE `tv_upgrade_resource_package` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `operator_group_code` varchar(128) default NULL,
  `subscriber_group_code` varchar(2000) default NULL,
  `description` varchar(256) default NULL,
  `power_on_update_mode` int(2) default NULL,
  `power_on_file_version` varchar(128) default NULL,
  `power_on_file_hash` varchar(128) default NULL,
  `power_on_file_url` varchar(256) default NULL,
  `power_on_file_size` bigint(20) default NULL,
  `loading_video_update_mode` int(2) default NULL,
  `loading_video_version` varchar(128) default NULL,
  `loading_video_hash` varchar(128) default NULL,
  `loading_video_url` varchar(256) default NULL,
  `loading_video_size` bigint(20) default NULL,
  `loading_img_upgrade_mode` int(2) default NULL,
  `loading_img_version` varchar(128) default NULL,
  `loading_img_hash` varchar(128) default NULL,
  `loading_img_url` varchar(256) default NULL,
  `loading_img_size` bigint(20) default NULL,
  `insert_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开机资源包表';

/*Data for the table `tv_upgrade_resource_package` */

LOCK TABLES `tv_upgrade_resource_package` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_sub_group` */

DROP TABLE IF EXISTS `tv_upgrade_sub_group`;

CREATE TABLE `tv_upgrade_sub_group` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) default NULL,
  `name` varchar(200) default NULL,
  `description` varchar(2000) default NULL,
  `group_type` bigint(2) default NULL,
  `net_operator_id` bigint(19) default NULL,
  `update_time` datetime default NULL,
  `insert_time` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_upgrade_sub_group` */

LOCK TABLES `tv_upgrade_sub_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_upgrade_sub_group_config` */

DROP TABLE IF EXISTS `tv_upgrade_sub_group_config`;

CREATE TABLE `tv_upgrade_sub_group_config` (
  `id` bigint(19) NOT NULL,
  `code` varchar(128) default NULL,
  `update_time` datetime default NULL,
  `insert_time` datetime default NULL,
  `area_id` varchar(128) default NULL,
  `group_code` varchar(128) default NULL,
  `mac_start` varchar(256) default NULL,
  `mac_end` varchar(256) default NULL,
  `provider_code` varchar(256) default NULL,
  `terminal_code` varchar(256) default NULL,
  `subscriber_group_code` varchar(256) default '*',
  `chip_type` varchar(256) default '*',
  KEY `treecode` (`subscriber_group_code`(255),`provider_code`(255),`terminal_code`(255)),
  KEY `part_mac` (`mac_start`(14),`mac_end`(14))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_upgrade_sub_group_config` */

LOCK TABLES `tv_upgrade_sub_group_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_group` */

DROP TABLE IF EXISTS `tv_user_group`;

CREATE TABLE `tv_user_group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `description` text,
  `site_code` varchar(128) default NULL,
  `type` int(2) default '0' COMMENT '分组类型：0：OTT:1：CTV',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5401 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_group` */

LOCK TABLES `tv_user_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_group_category` */

DROP TABLE IF EXISTS `tv_user_group_category`;

CREATE TABLE `tv_user_group_category` (
  `id` bigint(12) NOT NULL auto_increment,
  `group_code` varchar(64) default NULL,
  `category_code` varchar(128) default NULL,
  `sequence` int(2) default NULL,
  `parent_category_code` varchar(128) default NULL,
  `category_name` varchar(128) default NULL,
  `category_kind` int(2) unsigned default NULL,
  `category_path` varchar(128) default NULL,
  `category_display_name` varchar(128) default NULL,
  `category_child_count` int(11) default '0',
  `bitrate_model_code` varchar(256) default NULL,
  `update_time` datetime default NULL,
  `product_codes` varchar(2048) default NULL,
  `icon` varchar(256) default NULL COMMENT '显示图片',
  `show_way` int(2) default '0' COMMENT '展示方式',
  `hls_start_bitrate` varchar(10) default '700' COMMENT 'èµ·æ’­ç æµ',
  PRIMARY KEY  (`id`),
  KEY `TV_USER_G_CTG_GCP_I` (`group_code`,`category_code`,`parent_category_code`),
  KEY `category_code_for_update` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1197379 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_group_category` */

LOCK TABLES `tv_user_group_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_group_conf` */

DROP TABLE IF EXISTS `tv_user_group_conf`;

CREATE TABLE `tv_user_group_conf` (
  `id` bigint(20) NOT NULL auto_increment,
  `group_code` varchar(128) default NULL,
  `terminal_model` varchar(128) default NULL,
  `region` varchar(128) default NULL,
  `param_code` varchar(128) default NULL,
  `param_value` text,
  `service_code` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_group_conf` */

LOCK TABLES `tv_user_group_conf` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_net_group_config` */

DROP TABLE IF EXISTS `tv_user_net_group_config`;

CREATE TABLE `tv_user_net_group_config` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `update_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `insert_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `mac_start` varchar(256) default NULL,
  `mac_end` varchar(256) default NULL,
  `group_code` varchar(128) default NULL,
  `provider_code` varchar(50) default NULL,
  `terminal_model` varchar(4000) default NULL,
  `del_status` int(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53058 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_net_group_config` */

LOCK TABLES `tv_user_net_group_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_netoperator_group` */

DROP TABLE IF EXISTS `tv_user_netoperator_group`;

CREATE TABLE `tv_user_netoperator_group` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) NOT NULL,
  `name` varchar(200) NOT NULL,
  `des` varchar(2000) default NULL,
  `insert_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `publish_status` int(2) default NULL,
  `del_status` int(2) default NULL,
  `identify_code` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1285 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_netoperator_group` */

LOCK TABLES `tv_user_netoperator_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_order_list` */

DROP TABLE IF EXISTS `tv_user_order_list`;

CREATE TABLE `tv_user_order_list` (
  `id` bigint(20) NOT NULL auto_increment,
  `tv_id` varchar(128) default NULL,
  `user_id` varchar(128) default NULL,
  `package_name` varchar(128) default NULL,
  `package_code` varchar(64) default NULL,
  `price` int(11) default NULL,
  `package_type` int(11) default NULL,
  `cp_code` varchar(64) default 'SMG',
  `content_name` varchar(128) default NULL,
  `content_code` varchar(64) default NULL,
  `content_type` int(11) default NULL COMMENT '0：电影；1：电视剧；2：直播',
  `start_time` datetime default NULL,
  `end_time` datetime default NULL,
  `order_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20363 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_order_list` */

LOCK TABLES `tv_user_order_list` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_user_play_log` */

DROP TABLE IF EXISTS `tv_user_play_log`;

CREATE TABLE `tv_user_play_log` (
  `id` bigint(12) NOT NULL auto_increment,
  `tvid` varchar(128) default NULL,
  `user_account` varchar(128) default NULL,
  `content_code` varchar(128) default NULL,
  `content_name` varchar(128) default NULL,
  `content_type` int(4) default NULL,
  `category_code` varchar(128) default NULL,
  `category_name` varchar(128) default NULL,
  `begin_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `token` varchar(128) default NULL,
  `ip_address` varchar(250) default NULL,
  `product_code` varchar(128) default NULL,
  `trans_no` varchar(128) default NULL,
  `create_time` datetime default NULL,
  `terminal_provider` varchar(128) default NULL,
  `terminal_model` varchar(128) default NULL,
  `service_type` varchar(16) default NULL,
  `load_net` varchar(16) default NULL,
  `episode_num` int(19) default NULL,
  `format` varchar(128) default NULL,
  `source_info` varchar(128) default NULL,
  `category_path` varchar(128) default NULL,
  `mediaDetail_Code` varchar(128) default NULL,
  `terminal_Type` varchar(2) default NULL,
  `cdn_code` varchar(256) default NULL,
  `log_source` varchar(250) default NULL,
  `mediaFile_Code` varchar(384) default NULL,
  `busi_type` int(2) default NULL,
  `task_id` varchar(384) default NULL,
  `bitrate` varchar(256) default NULL,
  `transfer_protocol` varchar(1024) default NULL,
  `tv_profile` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=438470 DEFAULT CHARSET=utf8;

/*Data for the table `tv_user_play_log` */

LOCK TABLES `tv_user_play_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `tv_video` */

DROP TABLE IF EXISTS `tv_video`;

CREATE TABLE `tv_video` (
  `id` bigint(20) NOT NULL auto_increment,
  `play_url` text,
  `content_code` varchar(128) default NULL,
  `content_type` int(11) default NULL,
  `video_code` varchar(128) default NULL,
  `type` int(11) default NULL,
  `order_code` varchar(32) default NULL,
  `price` int(11) default NULL,
  `file_size` bigint(20) default '0',
  `duration` bigint(20) default '0',
  `audio_type` int(11) default NULL,
  `drm_type` int(11) default NULL,
  `can_download` int(11) default NULL,
  `can_onlineplay` int(11) default NULL,
  `screen_type` int(11) default NULL,
  `captioning` int(11) default NULL,
  `bitrate_type` int(11) default NULL,
  `video_encode_type` int(11) default NULL,
  `audio_encode_type` int(11) default NULL,
  `resolution` int(11) default NULL,
  `path` varchar(256) default NULL,
  `episode_index` int(4) NOT NULL default '0',
  `download_url` text COMMENT '下载地址',
  `cp_code` text COMMENT 'cp编码',
  `source` varchar(96) default NULL,
  `is_3d_video` int(11) default '0',
  `format_3d` int(11) default NULL,
  `splittype` varchar(16) default NULL,
  `profile` varchar(32) default NULL,
  `split_duration` varchar(4000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TV_VOD_CODE_I` (`video_code`),
  KEY `TV_VOD_CONTCODE_I` (`content_code`)
) ENGINE=InnoDB AUTO_INCREMENT=260604 DEFAULT CHARSET=utf8;

/*Data for the table `tv_video` */

LOCK TABLES `tv_video` WRITE;

UNLOCK TABLES;

/*Table structure for table `usergroup_category_oper` */

DROP TABLE IF EXISTS `usergroup_category_oper`;

CREATE TABLE `usergroup_category_oper` (
  `id` bigint(19) NOT NULL auto_increment,
  `code` varchar(128) default NULL,
  `oper_type` varchar(50) default NULL,
  `sequence` bigint(19) default NULL,
  `oper_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40733 DEFAULT CHARSET=utf8 COMMENT='业务分组栏目关系操作记录表';

/*Data for the table `usergroup_category_oper` */

LOCK TABLES `usergroup_category_oper` WRITE;

UNLOCK TABLES;

/*Table structure for table `vas_program_table` */

DROP TABLE IF EXISTS `vas_program_table`;

CREATE TABLE `vas_program_table` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `code` varchar(128) default NULL,
  `type` int(11) default NULL,
  `genre` varchar(128) default NULL,
  `keyword` varchar(256) default NULL,
  `tags` varchar(256) default NULL,
  `description` varchar(1024) default NULL,
  `status` int(11) default '1',
  `synckey` varchar(256) default NULL,
  `ORI_NAME` varchar(128) default NULL,
  `NEW_DAY` smallint(6) default NULL,
  `LEFT_DAY` smallint(6) default NULL,
  `ACTOR_DISPLAY` varchar(256) default NULL,
  `WRITER_DISPLAY` varchar(256) default NULL,
  `search_name` varchar(128) default NULL,
  `SORT_NAME` varchar(128) default NULL,
  `ISSUE_YEAR` smallint(6) default NULL,
  `ORIGIN_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `COMPANY` varchar(128) default NULL,
  `REGION` varchar(128) default NULL,
  `RATING` varchar(64) default NULL,
  `STAR_LEVEL` tinyint(4) default NULL,
  `COMMENTS` varchar(512) default NULL,
  `LANGUAGE` varchar(32) default NULL,
  `VIEW_POINT` varchar(256) default NULL,
  `AWARDS` varchar(64) default NULL,
  `SPLITE_INFO` varchar(1024) default NULL,
  `SMALLPIC` varchar(512) default NULL,
  `POSTER` varchar(512) default NULL,
  `STILL` varchar(512) default NULL,
  `RESERVE1` varchar(256) default NULL,
  `RESERVE2` varchar(256) default NULL,
  `RESERVE3` varchar(256) default NULL,
  `RESERVE4` varchar(256) default NULL,
  `RESERVE5` varchar(256) default NULL,
  `last_update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `active_status` int(11) default NULL,
  `length` int(11) default NULL,
  `episode_number` int(11) default '0',
  `domain` varchar(512) default NULL,
  `start_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `country` varchar(128) default NULL,
  `project` varchar(128) default NULL,
  `publish_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `content_type` varchar(128) default NULL,
  `valid_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `expire_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `opt_code` varchar(128) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `union_code_id_program` (`code`),
  KEY `program_code` (`code`),
  KEY `index_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `vas_program_table` */

LOCK TABLES `vas_program_table` WRITE;

UNLOCK TABLES;

/*Table structure for table `wmd_test` */

DROP TABLE IF EXISTS `wmd_test`;

CREATE TABLE `wmd_test` (
  `code` varchar(384) default NULL,
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `wmd_test` */

LOCK TABLES `wmd_test` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
