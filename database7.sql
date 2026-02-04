-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Empleat` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `DataNaixement` VARCHAR(45) NULL,
  `Edat` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `id` INT NOT NULL,
  `CodiIntern` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  `PreuUnitari` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `PreuVenda` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Vendedor` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `DataNaixement` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Tiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Tiquet` (
  `id` INT NOT NULL,
  `NumFactura` VARCHAR(45) NULL,
  `DataVenda` VARCHAR(45) NULL,
  `HoraVenda` VARCHAR(45) NULL,
  `TotalIVA` VARCHAR(45) NULL,
  `Empleat_id` INT NOT NULL,
  `Vendedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Tiquet_Empleat1_idx` (`Empleat_id` ASC) VISIBLE,
  INDEX `fk_Tiquet_Vendedor1_idx` (`Vendedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tiquet_Empleat1`
    FOREIGN KEY (`Empleat_id`)
    REFERENCES `Exercici7`.`Empleat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tiquet_Vendedor1`
    FOREIGN KEY (`Vendedor_id`)
    REFERENCES `Exercici7`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`LiniaTiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`LiniaTiquet` (
  `id` INT NOT NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Unitats` VARCHAR(45) NULL,
  `Descompte` VARCHAR(45) NULL,
  `Producte_id` INT NOT NULL,
  `Tiquet_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LiniaTiquet_Producte_idx` (`Producte_id` ASC) VISIBLE,
  INDEX `fk_LiniaTiquet_Tiquet1_idx` (`Tiquet_id` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaTiquet_Producte`
    FOREIGN KEY (`Producte_id`)
    REFERENCES `Exercici7`.`Producte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaTiquet_Tiquet1`
    FOREIGN KEY (`Tiquet_id`)
    REFERENCES `Exercici7`.`Tiquet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
