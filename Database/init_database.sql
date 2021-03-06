-- username: demo password: ***
CREATE DATABASE IF NOT EXISTS 'kuahusg';




-- create table
CREATE TABLE IF NOT EXISTS user(
 user_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
 user_name varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
 user_password_hash varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
 user_email varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
 user_active tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
 user_activation_hash varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s email verification hash string',
 user_password_reset_hash char(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password reset code',
 user_password_reset_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp of the password reset request',
 user_rememberme_token varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s remember-me cookie token',
 user_failed_logins tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s failed login attemps',
 user_last_failed_login int(10) DEFAULT NULL COMMENT 'unix timestamp of last failed login attempt',
 user_registration_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 user_registration_ip varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
 PRIMARY KEY (`user_id`),
 UNIQUE KEY `user_name` (`user_name`),
 UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- create user and grant privileges
CREATE USER demo IDENTIFIED BY '***';

GRANT INSERT, UPDATE, SELECT, DELETE on demo.* TO kuahusg@localhost IDENTIFIED BY '***';


//register
INSERT INTO USER (user_name, user_password_hash, user_email, user_active,
user_activation_hash, user_failed_logins, user_registration_datetime,
user_registration_ip) VALUES ('user_name', 'pwd_hash', 'user_email', DEFAULT, 'active_hash', DEFAULT, DEFAULT, DEFAULT );
