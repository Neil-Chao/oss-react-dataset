/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : oss

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 05/01/2024 23:05:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for close
-- ----------------------------
DROP TABLE IF EXISTS `close`;
CREATE TABLE `close`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_time` datetime NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close` int(1) NULL DEFAULT NULL COMMENT '1 is close, 0 is reopen.',
  `lock` int(1) NULL DEFAULT 0 COMMENT '1 is lock, 0 is unlock',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`operate_time`, `user`, `url`, `close`, `lock`) USING BTREE,
  INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16912 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NULL DEFAULT NULL,
  `user_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 is owner; 1 is author; 2 is collaborator; 3 is member; 4 is contributor.',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `heart` int(11) NULL DEFAULT 0,
  `rocket` int(11) NULL DEFAULT 0,
  `down` int(11) NULL DEFAULT 0,
  `up` int(11) NULL DEFAULT 0,
  `laugh` int(11) NULL DEFAULT 0,
  `hooray` int(11) NULL DEFAULT 0,
  `confused` int(11) NULL DEFAULT 0,
  `eyes` int(11) NULL DEFAULT 0,
  `off_topic` int(11) NULL DEFAULT 0 COMMENT '1 is off_topic.',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comment_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `at` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `quotes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`datetime`, `author`, `url`) USING BTREE,
  INDEX `query_by_author`(`author`) USING BTREE,
  INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144677 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for comment_typeful
-- ----------------------------
DROP TABLE IF EXISTS `comment_typeful`;
CREATE TABLE `comment_typeful`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NULL DEFAULT NULL,
  `user_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 is owner; 1 is author; 2 is collaborator; 3 is member; 4 is contributor.',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `heart` int(11) NULL DEFAULT 0,
  `rocket` int(11) NULL DEFAULT 0,
  `down` int(11) NULL DEFAULT 0,
  `up` int(11) NULL DEFAULT 0,
  `laugh` int(11) NULL DEFAULT 0,
  `hooray` int(11) NULL DEFAULT 0,
  `confused` int(11) NULL DEFAULT 0,
  `eyes` int(11) NULL DEFAULT 0,
  `off_topic` int(11) NULL DEFAULT 0 COMMENT '1 is off_topic.',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comment_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `at` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `quotes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`datetime`, `author`, `url`) USING BTREE,
  INDEX `query_by_author`(`author`) USING BTREE,
  INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21783 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commit_time` datetime NULL DEFAULT NULL,
  `pr_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `query_by_url`(`pr_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42092 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0 is close, and 1 is open.',
  `open_time` datetime NULL DEFAULT NULL,
  `close_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11307 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for issue_pr
-- ----------------------------
DROP TABLE IF EXISTS `issue_pr`;
CREATE TABLE `issue_pr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pr_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_time` datetime NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_link` int(11) NULL DEFAULT NULL COMMENT '0 is unlink, 1 is link',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`issue_url`, `pr_url`, `link_time`) USING BTREE,
  INDEX `query_by_issue`(`issue_url`) USING BTREE,
  INDEX `query_by_pr`(`pr_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 787 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label_time` datetime NULL DEFAULT NULL,
  `delete` int(11) NULL DEFAULT 0 COMMENT '0 is add, 1 is delete.',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`label`, `url`, `user`, `label_time`, `delete`) USING BTREE,
  INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35900 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for mention
-- ----------------------------
DROP TABLE IF EXISTS `mention`;
CREATE TABLE `mention`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mention_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`source`, `target`, `user`, `mention_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for merge
-- ----------------------------
DROP TABLE IF EXISTS `merge`;
CREATE TABLE `merge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pr_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merge_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`user`, `pr_url`, `merge_time`) USING BTREE,
  INDEX `query_by_url`(`pr_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8190 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pr
-- ----------------------------
DROP TABLE IF EXISTS `pr`;
CREATE TABLE `pr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_time` datetime NULL DEFAULT NULL,
  `close_time` datetime NULL DEFAULT NULL,
  `reviewers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `query_by_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13345 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for quote
-- ----------------------------
DROP TABLE IF EXISTS `quote`;
CREATE TABLE `quote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NULL DEFAULT NULL,
  `target` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unique`(`source`, `target`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for repo_manager
-- ----------------------------
DROP TABLE IF EXISTS `repo_manager`;
CREATE TABLE `repo_manager`  (
  `repo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`repo`, `field`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_time` datetime NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pr_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dismiss` int(1) NULL DEFAULT 0 COMMENT '0 is review, 1 is dimiss review.',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`review_time`, `user`, `pr_url`, `dismiss`) USING BTREE,
  INDEX `query_by_url`(`pr_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13702 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for url_manager
-- ----------------------------
DROP TABLE IF EXISTS `url_manager`;
CREATE TABLE `url_manager`  (
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_crawed` int(1) NULL DEFAULT 0,
  `type` int(1) NULL DEFAULT 0 COMMENT '0 is issue, 1 is pr',
  `is_handled` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18976 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
