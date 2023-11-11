/*
 Navicat Premium Data Transfer

 Source Server         : 11
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/10/2022 20:08:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add customer', 7, 'add_customer');
INSERT INTO `auth_permission` VALUES (26, 'Can change customer', 7, 'change_customer');
INSERT INTO `auth_permission` VALUES (27, 'Can delete customer', 7, 'delete_customer');
INSERT INTO `auth_permission` VALUES (28, 'Can view customer', 7, 'view_customer');
INSERT INTO `auth_permission` VALUES (29, 'Can add room', 8, 'add_room');
INSERT INTO `auth_permission` VALUES (30, 'Can change room', 8, 'change_room');
INSERT INTO `auth_permission` VALUES (31, 'Can delete room', 8, 'delete_room');
INSERT INTO `auth_permission` VALUES (32, 'Can view room', 8, 'view_room');
INSERT INTO `auth_permission` VALUES (33, 'Can add warning info', 9, 'add_warninginfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change warning info', 9, 'change_warninginfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete warning info', 9, 'delete_warninginfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view warning info', 9, 'view_warninginfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add order', 10, 'add_order');
INSERT INTO `auth_permission` VALUES (38, 'Can change order', 10, 'change_order');
INSERT INTO `auth_permission` VALUES (39, 'Can delete order', 10, 'delete_order');
INSERT INTO `auth_permission` VALUES (40, 'Can view order', 10, 'view_order');
INSERT INTO `auth_permission` VALUES (41, 'Can add user', 11, 'add_user');
INSERT INTO `auth_permission` VALUES (42, 'Can change user', 11, 'change_user');
INSERT INTO `auth_permission` VALUES (43, 'Can delete user', 11, 'delete_user');
INSERT INTO `auth_permission` VALUES (44, 'Can view user', 11, 'view_user');
INSERT INTO `auth_permission` VALUES (45, 'Can add face', 12, 'add_face');
INSERT INTO `auth_permission` VALUES (46, 'Can change face', 12, 'change_face');
INSERT INTO `auth_permission` VALUES (47, 'Can delete face', 12, 'delete_face');
INSERT INTO `auth_permission` VALUES (48, 'Can view face', 12, 'view_face');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `face_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `live_time` datetime(6) NULL,
  `is_ruzhu` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '廉七按', '45812120100421177734', '1001', '男', '2022-09-29 18:36:02.539136', 1);
INSERT INTO `customer` VALUES (2, '马六学', '35832419941219237x', '1003', '女', '2022-09-29 18:37:54.424256', 1);
INSERT INTO `customer` VALUES (3, '穆九套', '223430197206075113', '', '男', '2022-09-29 18:37:54.432274', 0);
INSERT INTO `customer` VALUES (4, '尹九算', '502348197210069176', '', '女', '2022-09-29 18:37:54.439850', 0);
INSERT INTO `customer` VALUES (5, '郎三接', '50410819961010825x', '', '男', '2022-09-29 18:37:54.443760', 0);
INSERT INTO `customer` VALUES (6, '殷七果', '464832199305066864', '', '男', '2022-09-29 18:37:54.447670', 0);
INSERT INTO `customer` VALUES (7, '郝三却', '379289198205099787', '', '男', '2022-09-29 18:37:54.451779', 0);
INSERT INTO `customer` VALUES (8, '葛二神', '378954197109191272', '', '男', '2022-09-29 18:37:54.455720', 1);
INSERT INTO `customer` VALUES (9, '柏八忆', '829476195604224572', '', '男', '2022-09-29 18:37:54.460301', 0);
INSERT INTO `customer` VALUES (10, '冯五包', '219607195310171667', '', '女', '2022-09-29 18:37:54.464125', 0);
INSERT INTO `customer` VALUES (11, '梁八洗', '455908201005181563', '', '女', '2022-09-29 18:37:54.468194', 0);
INSERT INTO `customer` VALUES (12, '朱二物', '371684195201074737', '', '女', '2022-09-29 18:37:54.472577', 1);
INSERT INTO `customer` VALUES (13, '张三', '1111', '', '男', '2022-10-02 08:56:24.910764', 1);
INSERT INTO `customer` VALUES (14, '张三丰', '320012345678900011', '', '男', '2022-10-05 20:56:47.896529', 1);
INSERT INTO `customer` VALUES (16, '测试人员2', '650103199912101312', '1005', '男', '2022-10-13 14:32:20.210123', 0);
INSERT INTO `customer` VALUES (17, '测试者001', '650102199612101324', '1006', '男', '2022-10-13 14:58:31.134116', 0);
INSERT INTO `customer` VALUES (18, 'test', '650193333322223333', '1007', '男', '2022-10-13 19:55:07.114109', 1);
INSERT INTO `customer` VALUES (19, 'test3', '699115822718872323', '1008', '男', '2022-10-13 20:06:00.356540', 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'customer');
INSERT INTO `django_content_type` VALUES (12, 'app', 'face');
INSERT INTO `django_content_type` VALUES (10, 'app', 'order');
INSERT INTO `django_content_type` VALUES (8, 'app', 'room');
INSERT INTO `django_content_type` VALUES (9, 'app', 'warninginfo');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (11, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-09-29 15:30:41.979944');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-09-29 15:30:43.585401');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-09-29 15:30:43.919553');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-09-29 15:30:43.946474');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-29 15:30:43.961434');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2022-09-29 15:30:44.846315');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2022-09-29 15:30:45.040998');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2022-09-29 15:30:45.146509');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2022-09-29 15:30:45.251737');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2022-09-29 15:30:45.264424');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2022-09-29 15:30:45.359743');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2022-09-29 15:30:45.368115');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2022-09-29 15:30:45.387170');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2022-09-29 15:30:45.822597');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2022-09-29 15:30:45.917728');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2022-09-29 15:30:46.004306');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2022-09-29 15:30:46.020754');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2022-09-29 15:30:46.108646');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-09-29 15:30:46.198688');
INSERT INTO `django_migrations` VALUES (20, 'user', '0001_initial', '2022-09-29 15:30:46.252773');
INSERT INTO `django_migrations` VALUES (21, 'app', '0002_auto_20220929_1834', '2022-09-29 18:34:56.750239');
INSERT INTO `django_migrations` VALUES (22, 'app', '0003_customer_is_ruzhu', '2022-09-30 13:15:51.148825');
INSERT INTO `django_migrations` VALUES (23, 'app', '0004_face', '2022-10-01 22:15:09.143902');
INSERT INTO `django_migrations` VALUES (24, 'app', '0005_alter_face_table', '2022-10-01 22:20:35.137255');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5vps1361kq90r5k7oypd5mk25apcuevh', 'eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6MywidXNlcl9pZCI6MX0:1odptF:jP_sQ8WNmDOOI5yz5HsUNulpOTt5jb3QdM5Q6vkRR_w', '2022-10-13 17:31:33.366370');
INSERT INTO `django_session` VALUES ('f8ongu0ce3u3dmrktwaf34ft6bgga3yh', 'eyJyb2xlIjozLCJ1c2VyX2lkIjoxfQ:1oenMS:y6YTx6U8AsAmiz5IJccstaePRtjhNPZ1nU9G_9LXfeA', '2022-10-16 09:01:40.321335');
INSERT INTO `django_session` VALUES ('j03gna6lapkavb9z67m33lkp07d90cry', 'eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6MywidXNlcl9pZCI6MX0:1oiwnO:1Eug7kxa3ZDyo-jU13US9u5yxiOGasjDEaY_ZIMI_uE', '2022-10-27 19:54:38.376256');
INSERT INTO `django_session` VALUES ('kfr0dt4ole74rprhjzfsdlpk89e5t3z5', 'eyJyb2xlIjozLCJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6ImFkbWluIn0:1og43Y:7rZe-bz8lT8MvG-6v8PpafhjuFvICUFklFHz9Qcvmgw', '2022-10-19 21:03:24.396012');

-- ----------------------------
-- Table structure for face
-- ----------------------------
DROP TABLE IF EXISTS `face`;
CREATE TABLE `face`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `face_feature` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of face
-- ----------------------------
INSERT INTO `face` VALUES ('1002', '李四', '<memory at 0x000002990BE1F7C8>');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NULL,
  `end_time` datetime(6) NULL,
  `status` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_customer_id_9da9253f_fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_room_id_634da463_fk_room_id`(`room_id`) USING BTREE,
  CONSTRAINT `order_customer_id_9da9253f_fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_room_id_634da463_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '2022-10-03 00:00:00.000000', '2022-10-08 11:04:18.000000', 1, 1, 349);
INSERT INTO `order` VALUES (2, '2022-10-01 00:00:00.000000', '2022-10-06 08:45:21.000000', 1, 2, 350);
INSERT INTO `order` VALUES (3, '2022-09-01 00:00:00.000000', '2022-10-05 20:53:14.764188', 1, 1, 349);
INSERT INTO `order` VALUES (4, '2022-09-01 00:00:00.000000', '2022-10-05 20:57:00.385129', 1, 12, 351);
INSERT INTO `order` VALUES (5, '2022-09-01 00:00:00.000000', '2022-10-05 20:59:19.161259', 1, 13, 353);
INSERT INTO `order` VALUES (6, '2022-09-01 00:00:00.000000', '2022-10-05 21:01:35.705597', 1, 14, 355);
INSERT INTO `order` VALUES (7, '2022-09-01 00:00:00.000000', '2022-10-05 21:03:35.246051', 1, 8, 357);
INSERT INTO `order` VALUES (8, '2022-10-13 00:00:00.000000', '2022-10-13 20:03:33.773422', 1, 18, 352);
INSERT INTO `order` VALUES (9, '2022-10-07 00:00:00.000000', '2022-10-13 20:06:43.505011', 1, 19, 354);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL,
  `room_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime(6) NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 463 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (349, '1001', 210, '大床房', '../static/picture/pic31.jpg', '入住', '2022-09-29 18:04:40.069757', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (350, '1002', 450, '标准房', '../static/picture/pic221.jpg', '入住', '2022-09-29 18:04:40.074241', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (351, '1003', 288, '电竞房', '../static/picture/pic31.jpg', '入住', '2022-09-29 18:04:40.078793', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (352, '1004', 450, '电竞房', '../static/picture/pic111.jpg', '入住', '2022-09-29 18:04:40.083439', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (353, '1005', 450, '单人房', '../static/picture/pic31.jpg', '入住', '2022-09-29 18:04:40.087806', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (354, '1006', 450, '大床房', '../static/picture/pic221.jpg', '入住', '2022-09-29 18:04:40.092014', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (355, '1007', 310, '单人房', '../static/picture/pic111.jpg', '入住', '2022-09-29 18:04:40.097239', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (356, '1008', 150, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.102508', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (357, '1009', 288, '单人房', '../static/picture/pic13.jpg', '入住', '2022-09-29 18:04:40.108019', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (358, '1010', 288, '大床房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.112672', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (359, '1011', 288, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.118924', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (360, '1012', 150, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.124709', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (361, '1013', 450, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.130122', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (362, '1014', 210, '单人房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.135736', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (363, '1015', 150, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.141691', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (364, '1016', 288, '电竞房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.146708', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (365, '1017', 288, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.152445', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (366, '1018', 288, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.156777', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (367, '1019', 450, '单人房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.161757', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (368, '2001', 150, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.166748', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (369, '2002', 288, '大床房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.170977', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (370, '2003', 450, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.174797', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (371, '2004', 288, '标准房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.180210', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (372, '2005', 310, '家庭房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.185194', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (373, '2006', 150, '单人房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.188297', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (374, '2007', 310, '单人房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.193308', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (375, '2008', 288, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.197271', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (376, '2009', 150, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.201246', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (377, '2010', 310, '家庭房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.206234', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (378, '2011', 210, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.210221', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (379, '2012', 288, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.215210', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (380, '2013', 150, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.220195', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (381, '2014', 210, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.223188', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (382, '2015', 210, '电竞房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.227177', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (383, '2016', 310, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.232165', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (384, '2017', 210, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.238147', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (385, '2018', 288, '电竞房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.242136', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (386, '2019', 150, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.247127', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (387, '3001', 310, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.252110', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (388, '3002', 310, '单人房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.257097', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (389, '3003', 210, '家庭房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.261087', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (390, '3004', 450, '单人房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.266073', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (391, '3005', 310, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.270061', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (392, '3006', 310, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.274053', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (393, '3007', 150, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.283028', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (394, '3008', 150, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.286012', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (395, '3009', 150, '单人房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.292016', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (396, '3010', 150, '大床房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.295507', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (397, '3011', 450, '单人房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.300046', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (398, '3012', 150, '大床房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.305035', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (399, '3013', 150, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.309012', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (400, '3014', 150, '电竞房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.313001', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (401, '3015', 450, '标准房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.318985', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (402, '3016', 210, '家庭房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.324121', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (403, '3017', 210, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.327694', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (404, '3018', 450, '单人房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.333678', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (405, '3019', 450, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.339354', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (406, '4001', 210, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.342999', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (407, '4002', 288, '单人房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.345918', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (408, '4003', 150, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.351903', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (409, '4004', 450, '电竞房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.356019', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (410, '4005', 150, '单人房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.360363', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (411, '4006', 310, '家庭房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.365739', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (412, '4007', 310, '大床房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.370726', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (413, '4008', 288, '单人房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.375713', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (414, '4009', 450, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.379702', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (415, '4010', 310, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.385687', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (416, '4011', 450, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.405632', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (417, '4012', 450, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.409622', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (418, '4013', 150, '标准房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.416603', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (419, '4014', 288, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.420592', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (420, '4015', 210, '家庭房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.424234', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (421, '4016', 150, '家庭房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.428388', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (422, '4017', 150, '标准房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.433312', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (423, '4018', 450, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.437306', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (424, '4019', 210, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.441293', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (425, '5001', 310, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.446280', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (426, '5002', 450, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.451268', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (427, '5003', 210, '单人房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.455257', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (428, '5004', 310, '标准房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.460243', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (429, '5005', 310, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.465231', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (430, '5006', 450, '单人房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.469220', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (431, '5007', 450, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.475203', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (432, '5008', 450, '大床房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.479193', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (433, '5009', 210, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.484221', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (434, '5010', 450, '电竞房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.488168', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (435, '5011', 150, '标准房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.493154', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (436, '5012', 150, '标准房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.498143', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (437, '5013', 450, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.502131', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (438, '5014', 450, '单人房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.506121', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (439, '5015', 210, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.511108', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (440, '5016', 288, '大床房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.515096', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (441, '5017', 288, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.520082', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (442, '5018', 288, '电竞房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.527064', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (443, '5019', 210, '单人房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.532052', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (444, '6001', 288, '单人房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.536040', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (445, '6002', 210, '标准房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.540030', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (446, '6003', 310, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.544018', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (447, '6004', 310, '大床房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.549006', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (448, '6005', 210, '标准房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.552995', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (449, '6006', 150, '家庭房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.556986', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (450, '6007', 210, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.560973', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (451, '6008', 288, '电竞房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.564963', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (452, '6009', 210, '单人房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.569950', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (453, '6010', 150, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.573939', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (454, '6011', 288, '电竞房', '../static/picture/pic111.jpg', '空房', '2022-09-29 18:04:40.577927', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (455, '6012', 450, '家庭房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.582915', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (456, '6013', 310, '大床房', '../static/picture/pic221.jpg', '空房', '2022-09-29 18:04:40.587901', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (457, '6014', 150, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.592888', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (458, '6015', 450, '家庭房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.596879', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (459, '6016', 210, '大床房', '../static/picture/pic21.jpg', '空房', '2022-09-29 18:04:40.601863', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (460, '6017', 310, '单人房', '../static/picture/pic31.jpg', '空房', '2022-09-29 18:04:40.605853', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (461, '6018', 450, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.609842', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');
INSERT INTO `room` VALUES (462, '6019', 450, '大床房', '../static/picture/pic13.jpg', '空房', '2022-09-29 18:04:40.615827', '空调、淋浴、床、毛巾、吹风机、LED电视、Wifi');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime(6) NULL,
  `modify_time` datetime(6) NULL,
  `role` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '123456', '123456', '2021-10-23 15:30:05.000000', '2022-09-29 17:11:39.000000', 3, '管理员');

-- ----------------------------
-- Table structure for warning_info
-- ----------------------------
DROP TABLE IF EXISTS `warning_info`;
CREATE TABLE `warning_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `create_time` datetime(6) NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `warning_info_room_id_5422473b_fk_room_id`(`room_id`) USING BTREE,
  CONSTRAINT `warning_info_room_id_5422473b_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warning_info
-- ----------------------------
INSERT INTO `warning_info` VALUES (1, 4, '2022-10-02 08:15:10.445537', 349);
INSERT INTO `warning_info` VALUES (2, 2, '2022-10-13 20:06:57.240493', 354);

SET FOREIGN_KEY_CHECKS = 1;
