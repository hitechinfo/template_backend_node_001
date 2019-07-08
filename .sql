


-- template 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS `template` ;

-- template.sv_common_codes 생성
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

-- template.sv_faqs 생성
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

-- template.sv_recruit_notices 생성
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

-- template.sv_users 생성
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
