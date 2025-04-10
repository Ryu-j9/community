-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: community
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bbsid` int NOT NULL COMMENT '테이블 관리 board_admin 연동',
  `ref` bigint DEFAULT '0' COMMENT '그룹',
  `step` int DEFAULT '0' COMMENT '그룹의 순번',
  `depth` int DEFAULT '0' COMMENT '답변의 깊이',
  `writer` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `comment` int DEFAULT '0' COMMENT '코멘트 테이블 id와 연동',
  `sec` tinyint DEFAULT '0',
  `category` varchar(45) DEFAULT NULL,
  `hit` int DEFAULT '0',
  `wdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,1,0,0,'운영자','admin','123456','공지사항 입니다.','<p>첫 번째 글을 올려 봅니다. 잘되면 좋겠어요</p>',0,0,'공지',0,'2025-03-12 09:15:30'),(2,1,0,0,0,'홍길동','guest','1234','비밀글','<p>1234</p>',0,1,'공지',0,'2025-03-27 11:23:24'),(3,1,0,0,0,'멤버1','mem1',NULL,'비밀공지','<p>비밀공지</p>',0,1,'공지',0,'2025-03-27 14:09:24'),(4,1,0,0,0,'관리자','admin',NULL,'1234','<p><img src=\"/community/res/upload/1/d9c4efa6-7703-44a6-a97a-9f2c475f3cc2.png\" data-filename=\"001.png\" style=\"width: 913px;\"><br></p>',0,0,'공지',0,'2025-04-01 14:28:07'),(8,1,0,0,0,'관리자','admin',NULL,'사진','<p><img src=\"/community/res/upload/1/36c600b1-5c39-4c75-913c-2dc2cb534eaf.png\" data-filename=\"001.png\" style=\"width: 913px;\"><br></p>',0,0,'공지',0,'2025-04-02 15:48:47'),(9,1,0,0,0,'홍길동','guest','1234','123123123','<p>123<img src=\"/community/res/upload/1/b76f0e9e-bbb6-41b8-add5-ef90d2984ae7.png\" data-filename=\"004.png\" style=\"width: 913px;\"><img src=\"/community/res/upload/1/936ca88d-2d5f-4961-8e3f-3f2a7aafe0fd.png\" data-filename=\"001.png\" style=\"width: 913px;\"></p>',0,0,'공지',0,'2025-04-04 14:33:29'),(10,1,0,0,0,'홍길동','guest','1234','dogs','<p><img src=\"/community/res/upload/1/cf3ec7f4-0a5b-40bb-8499-a1604ffcea52.webp\" data-filename=\"보더콜리.webp\" style=\"width: 312px;\"><img src=\"/community/res/upload/1/2f11d63d-dfa8-49a1-83e9-488f3b22c915.webp\" data-filename=\"포메.webp\" style=\"width: 780px;\"><br></p>',0,0,'공지',0,'2025-04-04 15:01:56'),(11,1,0,0,0,'홍길동','admin',NULL,'sea','                   	<p><img src=\"/community/res/upload/1/56c66f22-5293-42eb-9fcc-8a3cec65675e.jpg\" data-filename=\"island-5783440_1280.jpg\" style=\"width: 913px;\"><br></p>\r\n                   ',0,0,'공지',0,'2025-04-04 15:38:46');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_admin`
--

DROP TABLE IF EXISTS `board_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `btitle` varchar(100) NOT NULL COMMENT '게시판 제목',
  `skin` varchar(45) DEFAULT 'bbs' COMMENT 'bbs, gallery, article, section',
  `category` tinyint DEFAULT '0' COMMENT '0 : 카테고리 사용 안함, 1 : 카테고리 사용',
  `listcount` tinyint DEFAULT '15' COMMENT '게시판에서 한 번에 보여줄 목록 수',
  `pagecount` tinyint DEFAULT '15' COMMENT '한 페이지에 보일 페이지 수',
  `lgrade` tinyint DEFAULT '0' COMMENT '0 목록은 누구나 보기 1, 2, 3~ 회원단계에 따라 권한 부여',
  `vgrade` tinyint DEFAULT '0' COMMENT '세부페이지 보기 권한',
  `rgrade` tinyint DEFAULT '0' COMMENT '글쓰기 권한',
  `fgrade` tinyint DEFAULT '0' COMMENT '파일업로드 권한',
  `fdgrade` tinyint DEFAULT '0',
  `cgrade` tinyint DEFAULT '0' COMMENT '코멘트 권한',
  `regrade` tinyint DEFAULT '0' COMMENT '답글쓰기 권한',
  `upload` tinyint DEFAULT '0' COMMENT '업로드 가능1 / 불가능 0',
  `filesize` int DEFAULT '1000000' COMMENT '업도르 사이즈 1M',
  `allfilesize` int DEFAULT '3000000' COMMENT '전체 업로드 사이즈 3M',
  `thimgsize` varchar(40) DEFAULT '150|' COMMENT '썸네일 가로 150',
  `filechar` tinyint DEFAULT '0' COMMENT '0 : 이미지만 업로드 혀용 1 : 모든 업로드 허용',
  `sec` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_admin`
--

LOCK TABLES `board_admin` WRITE;
/*!40000 ALTER TABLE `board_admin` DISABLE KEYS */;
INSERT INTO `board_admin` VALUES (1,'자유게시판','bbs',1,20,10,0,0,0,0,0,0,0,1,3000000,8000000,'150|',0,1),(2,'회원게시판','diary',1,15,15,0,0,0,0,0,0,0,0,3000000,8000000,'150|',0,0),(4,'자유갤러리','gallery',0,15,15,0,0,0,0,0,0,0,0,1000000,3000000,'150|',0,0),(5,'일상의 틈','article',0,15,15,0,0,0,0,0,0,0,0,1000000,3000000,'150|',0,0);
/*!40000 ALTER TABLE `board_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL COMMENT 'board_admin 의 아이디',
  `category_text` varchar(45) DEFAULT NULL,
  `category_num` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'공지',1),(2,1,'질문',2),(3,1,'답변',3),(4,1,'잡담',4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bid` bigint DEFAULT NULL COMMENT 'board의 아이디',
  `ofilename` varchar(100) DEFAULT NULL COMMENT '원래 파일의 이름',
  `nfilename` varchar(100) DEFAULT NULL COMMENT '변경된 파일의 이름',
  `ext` varchar(10) DEFAULT NULL COMMENT '파일의 확장자',
  `filesize` bigint DEFAULT NULL COMMENT '파일의 크기',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,1743134368844,'001.png','016a4e72-412e-428a-8161-1c8e2b57bd99.png','png',4559774),(2,1743134386368,'001.png','bcbcb232-0f17-44b0-86a7-1d49c7bfcee8.png','png',4559774),(3,1743134386368,'001.png','ca837729-a41b-4723-b050-86167d370762.png','png',4559774),(4,1743134487583,'001.png','87cb101b-0cce-48e2-8b1e-45760baa4be7.png','png',4559774),(5,1743484893404,'001.png','a137ff3c-7a20-4cb4-8800-1713883b6a42.png','png',4559774),(9,1743571582560,'001.png','0e4ddec7-aa05-49fd-bbd8-e124ae99ee22.png','png',4559774),(10,1743572164318,'001.png','cfcc91eb-613f-4571-96e1-a6113f8bd39a.png','png',4559774),(11,1743572164318,'001.png','d1fe15ac-5b4e-4f5c-ae7c-08e73c4e3cde.png','png',4559774),(12,1743572224197,'002.png','ae956b0e-e4ac-465a-9976-c44bd6b7db98.png','png',4226712),(13,1743572276410,'003.png','bde9df04-cc2c-45a7-95d6-3ff8be3aa686.png','png',3779958),(18,10,'보더콜리.webp','cf3ec7f4-0a5b-40bb-8499-a1604ffcea52.webp','webp',21112),(19,10,'포메.webp','2f11d63d-dfa8-49a1-83e9-488f3b22c915.webp','webp',98916),(20,11,'island-5783440_1280.jpg','56c66f22-5293-42eb-9fcc-8a3cec65675e.jpg','jpg',668856);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_keyword`
--

DROP TABLE IF EXISTS `search_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `search_count` int DEFAULT '1',
  `last_search_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_keyword`
--

LOCK TABLES `search_keyword` WRITE;
/*!40000 ALTER TABLE `search_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `userpass` varchar(150) NOT NULL,
  `username` varchar(45) NOT NULL,
  `useremail` varchar(100) NOT NULL,
  `usertel` varchar(20) NOT NULL,
  `zipcode` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `extra_address` varchar(255) DEFAULT NULL,
  `userimg` varchar(255) DEFAULT NULL,
  `userprofile` text,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `edit_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `userip` varchar(45) DEFAULT NULL,
  `grade` int DEFAULT '1',
  `role` varchar(45) DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$KdgJe.YT7hA8K.MZR.D6vO7oh.5mM44/7B6..BEcsNwI8Gnr.ScqW','관리자','admin@admin.com','010-1234-1234',10083,'경기 김포시 장기동 1604','이젠아카데미','',NULL,'관리자입니다.','2025-03-14 12:26:10','2025-03-14 12:26:10','0:0:0:0:0:0:0:1',99,'ADMIN'),(2,'mem1','$2a$10$CAFePZVBxKvyWyU8QMqOeOzeDnWJP1ArUj3SV/jzHr/YyDFQUUrfq','멤버1','mem1@mem1.com','010-1111-1111',10083,'경기 김포시 장기동 1604','이젠아카데미','',NULL,'멤버1입니다.','2025-03-14 12:26:48','2025-03-14 12:26:48','0:0:0:0:0:0:0:1',1,'USER'),(3,'mem2','$2a$10$ojLG7byn4OwDAG6pusVxJexeRntUKt5qmYKsxE508zkIyCA03y5yq','멤버2','mem2@mem2.com','010-2222-2222',10083,'경기 김포시 김포한강4로 125','이젠아카데미',' (장기동)',NULL,'멤버2입니다.','2025-03-14 12:28:03','2025-03-14 12:28:03','0:0:0:0:0:0:0:1',2,'USER'),(4,'mem4','$2a$10$G8a7w5sdam4VV/nQWhVYU.XHcdUqt1jIlvy2aKFmX1RuK1ZoCbTF2','멤버4','010-4444-4444','010-4444-4444',0,'','','','aa7069c1-b5eb-465c-a0af-5c586b79ef79.png','멤버4입니다.\r\n        \r\n        \r\n        ','2025-03-17 09:53:48','2025-03-17 09:53:48','0:0:0:0:0:0:0:1',1,'USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL COMMENT 'users의 아이디와 연결',
  `user_role` varchar(11) DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
INSERT INTO `users_role` VALUES (1,1,'ADMIN'),(2,2,'USER'),(3,3,'USER'),(4,4,'USER');
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10 14:18:30
