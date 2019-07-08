-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.14-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- template 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `template` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `template`;

-- 테이블 template.sv_common_codes 구조 내보내기
CREATE TABLE IF NOT EXISTS `sv_common_codes` (
  `group_id` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `code_value` varchar(100) NOT NULL,
  `code_order` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `create_user_id` varchar(300) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `update_user_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`code_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 template.sv_common_codes:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sv_common_codes` DISABLE KEYS */;
INSERT INTO `sv_common_codes` (`group_id`, `code_name`, `code_value`, `code_order`, `create_datetime`, `create_user_id`, `update_datetime`, `update_user_id`) VALUES
	('QUESTION', '기타', '기타', 6, NULL, NULL, NULL, NULL),
	('QUESTION', '인턴쉽', '인턴쉽', 5, '2019-04-29 14:34:20', NULL, '2019-04-29 14:34:21', NULL),
	('QUESTION', '전형절차', '전형절차', 3, '2019-04-29 14:34:36', NULL, '2019-04-29 14:34:36', NULL),
	('QUESTION', '지원서작성', '지원서작성', 2, '2019-04-29 14:33:48', NULL, '2019-04-29 14:33:48', NULL),
	('QUESTION', '직무교육', '직무교육', 4, '2019-04-29 14:34:03', NULL, '2019-04-29 14:34:03', NULL),
	('QUESTION', '참여자격', '참여자격', 1, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sv_common_codes` ENABLE KEYS */;

-- 테이블 template.sv_faqs 구조 내보내기
CREATE TABLE IF NOT EXISTS `sv_faqs` (
  `faq_seq` int(11) NOT NULL AUTO_INCREMENT,
  `faq_category` varchar(20) DEFAULT NULL,
  `faq_question` varchar(300) DEFAULT NULL,
  `faq_answer` varchar(300) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `create_user_id` varchar(300) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `update_user_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`faq_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- 테이블 데이터 template.sv_faqs:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sv_faqs` DISABLE KEYS */;
INSERT INTO `sv_faqs` (`faq_seq`, `faq_category`, `faq_question`, `faq_answer`, `create_datetime`, `create_user_id`, `update_datetime`, `update_user_id`) VALUES
	(4, '참여자격', '경력사원도 지원 가능한가요?', '타 회사 경력 사항이 있는 분도 지원 가능하며, 협의를 통해 인턴 과정없이 채용을 진행할 예정입니다. 많은 지원 바랍니다. 알겠습니다.', '2019-05-13 19:07:42', 'ADMIN', '2019-05-23 13:49:53', NULL),
	(9, '지원서작성', '지원서 제출이 정상적으로 되었는지 확인할 수 있나요?', '채용 홈페이지 마이페이지에서 확인 가능합니다.', '2019-05-15 15:42:17', 'ADMIN', NULL, NULL),
	(10, '전형절차', '서류전형의 기준은 어떻게 되나요?', '서류전형에는 자기소개서를 중심으로 지원자의 가치관 및 직무역량 등을 종합적으로 판단하여,  이번 SK주식회사 행복성장캠퍼스 프로그램에 참여 대상으로 적합한 대상인지 여부를 판단하게 됩니다. ', '2019-05-15 15:42:22', 'ADMIN', NULL, NULL),
	(14, '직무교육', '직무교육 과정은 어떻게 운영되나요?', '8주간 실시되며, 직무공통과정, 웹개발과정, Digital Transformation 과정(Cloud특화) 순차적으로 진행될 예정입니다.', '2019-05-15 15:42:21', 'ADMIN', NULL, NULL),
	(20, '인턴십', '인턴십 이후 참여 채용희망사로의 취업 기회가 있을 수 있다고 하는데, 이 경우 별도의 전형이 있나요? ', '기본적으로 동일 직무, 동일 부서로 채용이 결정될 경우 별도의 전형은 없을 예정이나, 채용희망사 사정에 따라 추가 전형이 있을 수도 있습니다.', '2019-05-15 15:42:29', 'ADMIN', NULL, NULL),
	(21, '기타', '기타 문의는 어떻게 요청할 수 있나요?', '이메일(lee.sangil@sk.com) 또는 전화(02-6400-8724)로 문의 부탁 드립니다.', '2019-05-15 15:42:30', 'ADMIN', NULL, NULL),
	(27, '참여자격', '123123123', '123123123', '2019-05-24 10:38:38', NULL, '2019-05-24 10:38:38', NULL),
	(28, '전형절차', '1232222222222222222', '2222222222222222222222222', '2019-05-24 10:40:09', NULL, '2019-05-24 10:40:09', NULL),
	(29, '기타', 'saddddddddddddd', 'asddddddddddddddd', '2019-05-24 10:42:37', NULL, '2019-05-24 10:42:37', NULL),
	(30, '전형절차', '44444444444444', '444444444444444444', '2019-05-24 10:45:59', NULL, '2019-05-24 10:45:59', NULL),
	(31, '지원서작성', '122132131233333333333', '33321312333333333333', '2019-05-24 10:48:13', NULL, '2019-05-24 10:48:13', NULL),
	(32, '참여자격', 'asdsadsad', 'asdsadsad', '2019-05-24 10:50:47', NULL, '2019-05-24 10:50:47', NULL),
	(33, '참여자격', '테스트', '답변', '2019-05-24 16:09:27', NULL, '2019-05-24 16:09:27', NULL);
/*!40000 ALTER TABLE `sv_faqs` ENABLE KEYS */;

-- 테이블 template.sv_recruit_notices 구조 내보내기
CREATE TABLE IF NOT EXISTS `sv_recruit_notices` (
  `serial_number` varchar(12) NOT NULL,
  `notice_name` varchar(500) NOT NULL,
  `notice_start_datetime` varchar(10) DEFAULT NULL,
  `notice_end_datetime` varchar(10) DEFAULT NULL,
  `study_start_date` varchar(10) DEFAULT NULL,
  `study_end_date` varchar(10) DEFAULT NULL,
  `intern_start_date` varchar(10) DEFAULT NULL,
  `intern_end_date` varchar(10) DEFAULT NULL,
  `document_result_date` varchar(10) DEFAULT NULL,
  `interview_result_date` varchar(10) DEFAULT NULL,
  `notice_status` varchar(100) NOT NULL DEFAULT '시작전',
  `notice_image_path` varchar(500) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `create_user_id` varchar(300) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `update_user_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 template.sv_recruit_notices:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sv_recruit_notices` DISABLE KEYS */;
INSERT INTO `sv_recruit_notices` (`serial_number`, `notice_name`, `notice_start_datetime`, `notice_end_datetime`, `study_start_date`, `study_end_date`, `intern_start_date`, `intern_end_date`, `document_result_date`, `interview_result_date`, `notice_status`, `notice_image_path`, `create_datetime`, `create_user_id`, `update_datetime`, `update_user_id`) VALUES
	('1', '‘19년도 행복성장 캠퍼스 지원자 모집', '20190517', '20190531', NULL, NULL, NULL, NULL, '20190603', '20190613', '진행중', 'https://res.cloudinary.com/dlpg5kdj1/image/upload/v1557301273/skhappycampus/company_logo/noticeImage_it1jra.jpg', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sv_recruit_notices` ENABLE KEYS */;

-- 테이블 template.sv_users 구조 내보내기
CREATE TABLE IF NOT EXISTS `sv_users` (
  `user_id` varchar(300) NOT NULL,
  `user_password` varchar(300) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT 'N',
  `create_datetime` datetime DEFAULT NULL,
  `create_user_id` varchar(300) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `update_user_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 template.sv_users:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sv_users` DISABLE KEYS */;
INSERT INTO `sv_users` (`user_id`, `user_password`, `user_type`, `create_datetime`, `create_user_id`, `update_datetime`, `update_user_id`) VALUES
	('dnjstjdtlr1@gmail.com', 'H2dN9FmI1N19VmIdHdnlhW5oyqiOlEhThLal6tLnoCrvHr0z3PL8dCE3nBPq6+zxeKUoK1N2xGwpKLefzJiYkQ==', 'N', '2019-05-23 09:04:34', 'dnjstjdtlr1@gmail.com', '2019-05-23 09:04:34', 'dnjstjdtlr1@gmail.com'),
	('killsky1004@gmail.com', 'AsAJzAtZugy0KiAC+/czyUTC/2vrPVflJYdXrU6L1stlkjJiVxUs//HxqggMC30r2UrPhIxtO72Mksm5+GN2BA==', 'N', '2019-05-24 10:37:07', 'killsky1004@gmail.com', '2019-05-24 10:37:07', 'killsky1004@gmail.com'),
	('tjdtlrdnjs123@gmail.com', 'H2dN9FmI1N19VmIdHdnlhW5oyqiOlEhThLal6tLnoCrvHr0z3PL8dCE3nBPq6+zxeKUoK1N2xGwpKLefzJiYkQ==', 'N', '2019-05-23 10:53:52', 'tjdtlrdnjs123@gmail.com', '2019-05-23 10:53:52', 'tjdtlrdnjs123@gmail.com');
/*!40000 ALTER TABLE `sv_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
