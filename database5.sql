-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici5` ;
USE `Exercici5` ;

-- -----------------------------------------------------
-- Table `Exercici5`.`TipusVehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`TipusVehicle` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Clients` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(15) NULL,
  `Poblacio` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  `Usuari` VARCHAR(50) NULL,
  `Contrasenya` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Vehicles` (
  `id` INT NOT NULL,
  `NumeroMatricula` VARCHAR(25) NULL,
  `Marca` VARCHAR(50) NULL,
  `Matricula` VARCHAR(20) NULL,
  `TipusVehicle_id` INT NOT NULL,
  `Clients_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vehicles_TipusVehicle1_idx` (`TipusVehicle_id` ASC) VISIBLE,
  INDEX `fk_Vehicles_Clients1_idx` (`Clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicles_TipusVehicle1`
    FOREIGN KEY (`TipusVehicle_id`)
    REFERENCES `Exercici5`.`TipusVehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicles_Clients1`
    FOREIGN KEY (`Clients_id`)
    REFERENCES `Exercici5`.`Clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Cites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Cites` (
  `id` INT NOT NULL,
  `Usuaris` VARCHAR(45) NULL,
  `SeleccioVehicles` VARCHAR(45) NULL,
  `Dia` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Vehicles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cites_Vehicles1_idx` (`Vehicles_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cites_Vehicles1`
    FOREIGN KEY (`Vehicles_id`)
    REFERENCES `Exercici5`.`Vehicles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
