-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatger` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(20) NOT NULL,
  `Nom` VARCHAR(50) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Telefon` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Direccio` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avio` (
  `id` INT NOT NULL,
  `Model` VARCHAR(50) NOT NULL,
  `Fabricant` VARCHAR(255) NOT NULL,
  `Capacitat` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vol` (
  `id` INT NOT NULL,
  `NumVol` INT NOT NULL,
  `Origen` VARCHAR(50) NOT NULL,
  `Desti` VARCHAR(50) NOT NULL,
  `DataSortida` DATE NOT NULL,
  `DataArribada` DATE NOT NULL,
  `HoraSortida` TIME NOT NULL,
  `HoraArribada` TIME NOT NULL,
  `Avio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_id`)
    REFERENCES `Exercici6`.`Avio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `id` INT NOT NULL,
  `PassatgerDNI` VARCHAR(20) NOT NULL,
  `NumVol` INT NOT NULL,
  `DataReserva` DATE NULL,
  `ImportTotal` DECIMAL(10,2) NOT NULL,
  `Vol_id` INT NOT NULL,
  `Passatger_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reserva_Vol1_idx` (`Vol_id` ASC) VISIBLE,
  INDEX `fk_Reserva_Passatger1_idx` (`Passatger_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_id`)
    REFERENCES `Exercici6`.`Vol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Passatger1`
    FOREIGN KEY (`Passatger_id`)
    REFERENCES `Exercici6`.`Passatger` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
