
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inmobiliaria` DEFAULT CHARACTER SET utf8 ;
USE `inmobiliaria` ;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente` (
  `idcliente` INT NOT NULL,
  `tipoDoc` VARCHAR(3) NOT NULL,
  `numDoc` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmueble` (
  `idinmueble` INT NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `area` VARCHAR(8) NOT NULL,
  `antiguedad` VARCHAR(45) NOT NULL,
  `arri_vent` VARCHAR(10) NOT NULL,
  `precio` BIGINT(15) NOT NULL,
  `amoblado` VARCHAR(2) NOT NULL,
  `patio` VARCHAR(2) NULL,
  `piscina` VARCHAR(2) NULL,
  `descripcion` VARCHAR(150) NULL,
  `idcl` INT NULL,
  PRIMARY KEY (`idinmueble`),
  INDEX `fk_inmueble_cliente1_idx` (`idcl` ASC) VISIBLE,
  CONSTRAINT `fk_inmueble_cliente1`
    FOREIGN KEY (`idcl`)
    REFERENCES `inmobiliaria`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`Solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`Solicitud` (
  `idSolicitud` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `idinmueble` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `tiempo` VARCHAR(45) NULL,
  `tipo_tran` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  INDEX `fk_Solicitud_cliente1_idx` (`idcliente` ASC) VISIBLE,
  INDEX `fk_Solicitud_inmueble1_idx` (`idinmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Solicitud_cliente1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `inmobiliaria`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_inmueble1`
    FOREIGN KEY (`idinmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET GLOBAL time_zone = '+8:00';
SET GLOBAL time_zone = 'Europe/Helsinki';
SET @@global.time_zone = '+00:00';


