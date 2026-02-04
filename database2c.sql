-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2C` ;
USE `Exercici2C` ;

-- -----------------------------------------------------
-- Table `Exercici2C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Alumne` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NULL,
  `DNI` VARCHAR(9) NULL,
  `Direcció` VARCHAR(100) NULL,
  `Telefon` VARCHAR(14) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Departament` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Modul`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Modul` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Professor` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Especialitat` VARCHAR(100) NULL,
  `Departament_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Professor_Departament1_idx` (`Departament_id` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_id`)
    REFERENCES `Exercici2C`.`Departament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Matricula` (
  `id` INT NOT NULL,
  `CursAcademic` VARCHAR(45) NULL,
  `Alumne_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_id` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_id`)
    REFERENCES `Exercici2C`.`Alumne` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`ModulsMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`ModulsMatricula` (
  `id` INT NOT NULL,
  `Matricula_id` INT NOT NULL,
  `Modul_id` INT NOT NULL,
  `Professor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ModulsMatricula_Matricula1_idx` (`Matricula_id` ASC) VISIBLE,
  INDEX `fk_ModulsMatricula_Modul1_idx` (`Modul_id` ASC) VISIBLE,
  INDEX `fk_ModulsMatricula_Professor1_idx` (`Professor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ModulsMatricula_Matricula1`
    FOREIGN KEY (`Matricula_id`)
    REFERENCES `Exercici2C`.`Matricula` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulsMatricula_Modul1`
    FOREIGN KEY (`Modul_id`)
    REFERENCES `Exercici2C`.`Modul` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulsMatricula_Professor1`
    FOREIGN KEY (`Professor_id`)
    REFERENCES `Exercici2C`.`Professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
