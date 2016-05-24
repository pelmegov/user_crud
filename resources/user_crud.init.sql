-- удаление существующей базы данных
DROP SCHEMA IF EXISTS `user_crud` ;

-- создание базы данных
CREATE SCHEMA IF NOT EXISTS `user_crud` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

-- использовать только что созданную базу данных
USE `user_crud` ;

-- удаление существующей таблицы
DROP TABLE IF EXISTS `user_crud`.`user` ;

-- создание таблицы с полями id, first_name, last_name, age
CREATE TABLE IF NOT EXISTS `user_crud`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

-- добавление начальных тестовых данных
START TRANSACTION;

USE `user_crud`;

INSERT INTO `user_crud`.`user` 
	(`id`, `first_name`, `last_name`, `age`) 
    VALUES (1, 'Stepan', 'Pelmegov', 22);
INSERT INTO `user_crud`.`user` 
	(`id`, `first_name`, `last_name`, `age`) 
    VALUES (2, 'Sanya', 'Ivanov', 20);
INSERT INTO `user_crud`.`user` 
	(`id`, `first_name`, `last_name`, `age`) 
    VALUES (3, 'Test', 'Test', 40);
INSERT INTO `user_crud`.`user` 
	(`id`, `first_name`, `last_name`, `age`) 
    VALUES (4, 'Vasya', 'Pupkin', 28);

COMMIT;