/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : photo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-08 13:41:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` text,
  `content` varchar(255) DEFAULT NULL,
  `content_type` enum('multi','single') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`album_id`),
  KEY `user_id_fk` (`user_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of albums
-- ----------------------------
INSERT INTO `albums` VALUES ('1', 'chất', 'chất', 'single', '1', '2016-12-29 16:06:01');
INSERT INTO `albums` VALUES ('20', 'sida', 'thật', 'multi', '2', '2016-12-30 14:46:41');
INSERT INTO `albums` VALUES ('21', 'gym nhé', 'đấy', 'multi', '4', '2016-12-30 23:28:24');
INSERT INTO `albums` VALUES ('22', '', null, 'single', '3', '2017-01-11 16:22:27');
INSERT INTO `albums` VALUES ('23', 'Zoro', null, 'single', '5', '2017-01-11 17:02:00');

-- ----------------------------
-- Table structure for albums_tags
-- ----------------------------
DROP TABLE IF EXISTS `albums_tags`;
CREATE TABLE `albums_tags` (
  `album_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`tag_id`),
  KEY `album_id` (`album_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `album_id_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of albums_tags
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_to` int(11) DEFAULT NULL,
  `comment` text,
  `is_album` bit(1) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `user_cm_fk` (`user_id`),
  CONSTRAINT `user_cm_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '0', 'lịt pẹ', '', '21', '1', '2017-01-04 11:17:47');
INSERT INTO `comments` VALUES ('2', '1', 'như lìn', '', '21', '2', '2017-01-04 11:47:55');
INSERT INTO `comments` VALUES ('4', '0', 'không được', '', '20', '1', '2017-01-04 16:58:49');
INSERT INTO `comments` VALUES ('5', '0', 'giờ thì sao?', '', '1', '1', '2017-01-04 17:03:17');
INSERT INTO `comments` VALUES ('6', '0', 'được chưa', '', '20', '1', '2017-01-04 17:06:28');
INSERT INTO `comments` VALUES ('7', '0', 'được ko', '', '20', '1', '2017-01-04 17:07:08');
INSERT INTO `comments` VALUES ('8', '0', 'gì đây', '', '1', '1', '2017-01-04 17:08:39');
INSERT INTO `comments` VALUES ('9', '0', 'lạc trôi', '', '20', '1', '2017-01-04 17:10:44');
INSERT INTO `comments` VALUES ('10', '0', 'ngu ngốc', '', '1', '1', '2017-01-04 17:12:35');
INSERT INTO `comments` VALUES ('11', '0', 'e cũng chỉ con gái thôi', '', '1', '1', '2017-01-04 17:13:48');
INSERT INTO `comments` VALUES ('19', '1', 'abc', '', '21', '1', '2017-01-05 11:17:14');
INSERT INTO `comments` VALUES ('20', '1', 'vai ca lon luon', '', '21', '1', '2017-01-05 14:17:49');
INSERT INTO `comments` VALUES ('50', '0', 'sao', '', '21', '2', '2017-01-06 10:15:04');
INSERT INTO `comments` VALUES ('51', '0', 'zoro', '\0', '31', '5', '2017-01-15 12:47:06');
INSERT INTO `comments` VALUES ('52', '0', 'thợ săn hải tặc', '\0', '31', '2', '2017-01-15 12:58:36');
INSERT INTO `comments` VALUES ('53', '0', 'one piece', '\0', '31', '1', '2017-01-15 14:26:43');
INSERT INTO `comments` VALUES ('54', '0', 'ngầu vãi', '\0', '31', '4', '2017-01-15 14:26:57');
INSERT INTO `comments` VALUES ('55', '54', 'đúng', '\0', '31', '5', '2017-01-15 15:24:59');
INSERT INTO `comments` VALUES ('56', '0', 'going merry', '\0', '30', '1', '2017-01-16 09:55:19');
INSERT INTO `comments` VALUES ('57', '0', 'abc', '\0', '30', '1', '2017-01-16 10:04:08');
INSERT INTO `comments` VALUES ('58', '0', 'đéo tin được', '', '30', '1', '2017-01-16 10:10:39');
INSERT INTO `comments` VALUES ('59', '0', 'abc', '', '30', '1', '2017-01-16 10:12:57');
INSERT INTO `comments` VALUES ('60', '0', 'a', '', '30', '1', '2017-01-16 10:13:43');
INSERT INTO `comments` VALUES ('61', '0', 'àa', '', '30', '1', '2017-01-16 10:18:04');
INSERT INTO `comments` VALUES ('62', '0', 'sadsađasađâsdá', '', '31', '1', '2017-01-16 10:20:17');
INSERT INTO `comments` VALUES ('63', '0', 'sad', '', '31', '1', '2017-01-16 10:23:37');
INSERT INTO `comments` VALUES ('64', '0', 'ád', '', '31', '1', '2017-01-16 10:23:57');
INSERT INTO `comments` VALUES ('65', '0', 'áda', '', '31', '1', '2017-01-16 10:24:13');
INSERT INTO `comments` VALUES ('66', '0', 'ád', '', '31', '1', '2017-01-16 10:24:22');
INSERT INTO `comments` VALUES ('67', '0', 'sss', '', '31', '1', '2017-01-16 10:24:43');
INSERT INTO `comments` VALUES ('68', '0', 'ád', '', '31', '1', '2017-01-16 10:24:58');
INSERT INTO `comments` VALUES ('69', '0', 'dm doi', '\0', '31', '1', '2017-01-16 10:25:35');
INSERT INTO `comments` VALUES ('70', '0', 'phich thu', '\0', '31', '1', '2017-01-16 10:26:56');
INSERT INTO `comments` VALUES ('71', '0', 'phich thu', '', '23', '1', '2017-01-16 10:27:18');
INSERT INTO `comments` VALUES ('72', '0', 'tàu mới', '\0', '30', '1', '2017-01-16 10:36:18');
INSERT INTO `comments` VALUES ('73', '0', 'rất đẹp', '\0', '30', '1', '2017-01-16 10:37:22');
INSERT INTO `comments` VALUES ('74', '0', 'luffy', '\0', '30', '1', '2017-01-16 10:41:10');
INSERT INTO `comments` VALUES ('75', '0', 'sanji', '\0', '30', '1', '2017-01-16 10:42:17');
INSERT INTO `comments` VALUES ('76', '0', 'tàu này đẹp vkl ông ạ dm đẹp thật đấy', '\0', '30', '1', '2017-01-16 10:55:32');
INSERT INTO `comments` VALUES ('77', '0', 'ussop', '\0', '30', '1', '2017-01-16 10:57:08');
INSERT INTO `comments` VALUES ('79', '0', 'asdasdasd', '\0', '31', '5', '2017-01-16 13:49:00');
INSERT INTO `comments` VALUES ('80', '51', 'chuẩn', '\0', '31', '5', '2017-01-16 14:15:58');
INSERT INTO `comments` VALUES ('81', '52', 'đúng rồi đó', '\0', '31', '5', '2017-01-16 14:21:37');
INSERT INTO `comments` VALUES ('82', '53', 'quá chuẩn', '\0', '31', '5', '2017-01-16 14:22:16');
INSERT INTO `comments` VALUES ('83', '70', 'sơn tùng mtp', '\0', '31', '5', '2017-01-16 14:23:51');
INSERT INTO `comments` VALUES ('84', '79', 'bộ film dài nhất', '\0', '31', '5', '2017-01-16 14:25:50');
INSERT INTO `comments` VALUES ('85', '79', 'dài thật', '\0', '31', '5', '2017-01-16 14:28:18');
INSERT INTO `comments` VALUES ('86', '70', 'tùng sơn', '\0', '31', '5', '2017-01-16 14:29:37');
INSERT INTO `comments` VALUES ('87', '0', 'nice', '\0', null, '5', '2017-01-16 14:31:43');
INSERT INTO `comments` VALUES ('88', '0', 'nice', '\0', null, '5', '2017-01-16 14:32:18');
INSERT INTO `comments` VALUES ('89', '0', 'sađá', '\0', null, '5', '2017-01-16 15:51:59');
INSERT INTO `comments` VALUES ('90', '0', 'sađá', '\0', null, '5', '2017-01-16 15:51:59');
INSERT INTO `comments` VALUES ('91', '0', 'adssad', '\0', '31', '5', '2017-01-16 16:04:58');
INSERT INTO `comments` VALUES ('92', '0', '', '\0', null, '5', '2017-01-16 16:05:36');
INSERT INTO `comments` VALUES ('93', '0', 'adsad\n\n\nád\náđa', '\0', null, '5', '2017-01-16 16:12:08');
INSERT INTO `comments` VALUES ('94', '0', 'adsad\n\n\nád\náđa', '\0', null, '5', '2017-01-16 16:12:08');
INSERT INTO `comments` VALUES ('95', '0', 'adsad\n\n\nád\náđa', '\0', null, '5', '2017-01-16 16:12:09');
INSERT INTO `comments` VALUES ('96', '0', 'adsad\n\n\nád\náđa', '\0', null, '5', '2017-01-16 16:12:09');
INSERT INTO `comments` VALUES ('97', '0', 'adsad\n\n\nád\náđa', '\0', null, '5', '2017-01-16 16:12:09');
INSERT INTO `comments` VALUES ('98', '0', 'đẹp', '\0', null, '5', '2017-01-17 09:56:54');
INSERT INTO `comments` VALUES ('99', '0', 'clgt', '\0', '31', '5', '2017-01-17 09:57:10');
INSERT INTO `comments` VALUES ('100', '0', 'địt mẹ e tôm', '\0', '28', '5', '2017-01-17 10:22:12');
INSERT INTO `comments` VALUES ('101', '0', 'Hùng mới tháng lương đầu', '\0', '29', '5', '2017-01-17 10:25:02');
INSERT INTO `comments` VALUES ('102', '0', 'bánh như shit', '\0', '26', '5', '2017-01-17 10:26:13');
INSERT INTO `comments` VALUES ('103', '0', 'làm sao', '\0', '28', '5', '2017-01-17 10:31:41');
INSERT INTO `comments` VALUES ('104', '0', 'yeah', '\0', '29', '5', '2017-01-17 10:35:13');
INSERT INTO `comments` VALUES ('105', '101', 'yeppp', '\0', '29', '5', '2017-01-17 10:44:59');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `caption` text,
  `album_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `view` int(11) DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `album_image_fk` (`album_id`),
  CONSTRAINT `album_image_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('26', null, 'images/albums/banh_my.jpg', null, '20', '2016-12-30 14:46:41', '2000');
INSERT INTO `images` VALUES ('27', null, 'images/albums/sida.jpg', null, '20', '2016-12-30 14:46:41', '2001');
INSERT INTO `images` VALUES ('28', null, 'images/albums/mens-health-siBnm9-pullupchallenge__square.jpg', 'đẹp trai', '21', '2016-12-30 23:28:24', '3000');
INSERT INTO `images` VALUES ('29', null, 'images/albums/squat-713x481.jpg', 'khỏe', '21', '2016-12-30 23:28:24', '500');
INSERT INTO `images` VALUES ('30', null, 'images/albums/one-piece.jpg', 'One Piece', '22', '2017-01-11 16:22:27', '600');
INSERT INTO `images` VALUES ('31', null, 'images/albums/zoro.jpg', 'Zoro', '23', '2017-01-11 17:02:00', '2500');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_album` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL COMMENT '0',
  `obj_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  KEY `user_like_fk` (`user_id`),
  CONSTRAINT `user_like_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES ('165', '\0', '', '31', '5', '2017-01-13 16:20:28');
INSERT INTO `likes` VALUES ('166', '', '', '23', '5', '2017-01-13 16:22:07');
INSERT INTO `likes` VALUES ('167', '', '', '22', '5', '2017-01-13 16:24:48');
INSERT INTO `likes` VALUES ('168', '', '', '21', '5', '2017-01-13 16:24:49');
INSERT INTO `likes` VALUES ('169', '', '', '20', '5', '2017-01-13 16:24:51');
INSERT INTO `likes` VALUES ('170', '', '', '1', '5', '2017-01-13 16:24:52');
INSERT INTO `likes` VALUES ('171', '\0', '\0', '30', '5', '2017-01-13 17:29:26');
INSERT INTO `likes` VALUES ('172', '\0', '', '31', '1', '2017-01-16 09:39:20');
INSERT INTO `likes` VALUES ('173', '\0', '', '28', '5', '2017-01-16 14:56:31');
INSERT INTO `likes` VALUES ('174', '\0', '\0', '29', '5', '2017-01-16 14:59:43');
INSERT INTO `likes` VALUES ('175', '', '\0', '20', '1', '2017-02-07 15:46:29');
INSERT INTO `likes` VALUES ('176', '', '', '22', '1', '2017-02-07 15:46:32');
INSERT INTO `likes` VALUES ('177', '', '', '23', '1', '2017-02-07 15:46:39');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '#goingmerry');
INSERT INTO `tags` VALUES ('2', '#onepiece');
INSERT INTO `tags` VALUES ('3', '#luffy');
INSERT INTO `tags` VALUES ('4', '#zoro');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `fullname` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '$2y$10$.eaiJ5fFsVQ5SD9cDyLXE.2Gmt44vQ4mD99avWuVUA78ug9uclgOC', 'admin@gmail.com', 'images/users/anonymous.png', 'Admin', '2016-12-28 10:04:15');
INSERT INTO `users` VALUES ('2', 'hungthai1401', '$2y$10$8fysyxsoKfQj.EDWVK9rbOlQ5PU9qGd.S3kFEyQg6ubyz6bPlO9ke', 'hungthai1401@gmail.com', 'images/users/anonymous.png', 'Hưng Thái', '2016-12-28 15:46:57');
INSERT INTO `users` VALUES ('3', 'mhthuong', '$2y$10$OQ1e9ZiLjvzOVmu3eBjVwutsY6k6kHZeuAty6FlF.dyYRhiALEzba', 'thuongmh@gmail.com', 'images/users/anonymous.png', 'Huy Thưởng', '2016-12-28 15:57:15');
INSERT INTO `users` VALUES ('4', 'phamluong90', '$2y$10$aoJo2OON1c8a1YHAf146Oe9.Xyrd0q4SmknjiUWW66zAe17DnYeni', 'luongpham@gmail.com', 'images/users/anonymous.png', 'Lương Phạm', '2016-12-28 16:58:03');
INSERT INTO `users` VALUES ('5', '114940686872131556944', '', 'hungthai1401.it@gmail.com', 'https://lh3.googleusercontent.com/-D6KGdJlVixo/AAAAAAAAAAI/AAAAAAAAADQ/o3N4WjU1WiY/photo.jpg', 'Nguyễn Hưng Thái', '2017-01-09 12:17:20');
INSERT INTO `users` VALUES ('6', '104028613763320313624', '', 'hungthai1401@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', 'Hưng Thái Nguyễn', '2017-01-09 12:31:06');
INSERT INTO `users` VALUES ('20', 'minhml', '$2y$10$xYK3Gg9GFlr2eSpBlSTHPOb2UWMp9RbHCqSRiT/IFh20HxLa.WnY2', 'minhml@gmail.com', 'images/users/anonymous.png', 'Minh Nhựa', '2017-01-10 16:52:04');
INSERT INTO `users` VALUES ('21', 'cuongdl', '$2y$10$T6T8skJ87nq95QiBWEqilOdBA59scIy7S8arn.OhlGwqbDzFo9A1O', 'cuongdl@gmail.com', 'images/users/anonymous.png', 'Cường Đô La', '2017-01-10 16:56:32');
INSERT INTO `users` VALUES ('22', 'ssssssssssssss', '$2y$10$alnCbmjHMYTYsUI7goAOhOV9UtYGCImj1GMWct/eXbXzMXGgwnzSK', 'sss@ddd.com', 'images/users/anonymous.png', 'sssssss sssssss', '2017-01-10 17:00:17');
INSERT INTO `users` VALUES ('23', 'ssssssss', '$2y$10$sNg9iTqnhhN9uzQwhOIXr.jyrKd5xYC2bb1Ikm6SSGgzIAPAKWsEK', 'sssssss@gm.com', 'images/users/anonymous.png', 'ssssssss ssssssss', '2017-01-10 17:01:35');
INSERT INTO `users` VALUES ('24', 'results', '$2y$10$ziMhE3.DgDBj/7EMr7c9jOLlZx.NgiYcd9KBFwJpQHxvWEzN3AU46', 'results@gm.com', 'images/users/anonymous.png', 'results results', '2017-01-10 17:03:32');
