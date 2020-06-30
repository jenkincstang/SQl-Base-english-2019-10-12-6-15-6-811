SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

drop table if exists student;
create table if not exists student(
    `id` char(3) not null,
    `name` varchar(255) default null,
    `age` int(3) default 0,
    `sex` varchar(255),
    primary key (`id`)
    )ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

drop table if exists subject;
create table if not exists subject(
	`id` char(4) not null,
	`subject` varchar(255) not null,
	`teacher` varchar(255) not null,
	`description` varchar(255) not null,
	primary key (`id`) 
	)engine = InnoDB character set = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

drop table if exists score;
create table if not exists score(
	`id` int(255) not null auto_increment,
	`student_id` char(3) not null,
	`subject_id` char(4) not null,
	`score` double(255,2) default 0.0,
	primary key (`id`),
	index `subject_fk` (`subject_id`) using btree,
	index `student_fk` (`student_id`) using btree,
	constraint `subject_fk` foreign key (`subject_id`) references subject(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	constraint `student_fk` foreign key (`student_id`) references student(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
	)engine = InnoDB character set = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


INSERT INTO `student` VALUES ('001', 'zhangsan', 18, 'male');
INSERT INTO `student` VALUES ('002', 'lisi', 20, 'female');

INSERT INTO `subject` VALUES ('1001', 'Chinese', 'Mr. Wang', 'the exam is easy');
INSERT INTO `subject` VALUES ('1002', 'math', 'Miss Liu', 'the exam is difficult');

INSERT INTO `score` VALUES (1, '001', '1001', 80.00);
INSERT INTO `score` VALUES (2, '002', '1002', 60.00);
INSERT INTO `score` VALUES (3, '001', '1001', 70.00);
INSERT INTO `score` VALUES (4, '002', '1002', 60.50);

SET FOREIGN_KEY_CHECKS = 1;
