-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL,
  `orderDate` VARCHAR(10) NOT NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Client1_idx` (`Client_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `mydb`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `idProducts` INT NOT NULL,
  `productName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderLine` (
  `idOrderLine` INT NOT NULL,
  `amount` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  PRIMARY KEY (`idOrderLine`),
  INDEX `fk_OrderLine_Products_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_OrderLine_Order1_idx` (`Order_idOrder` ASC) VISIBLE,
  CONSTRAINT `fk_OrderLine_Products`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderLine_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
