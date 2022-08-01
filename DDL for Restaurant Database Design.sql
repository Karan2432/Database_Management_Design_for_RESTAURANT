create schema `project-Karan-Jangu`;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema project-Karan-Jangu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project-Karan-Jangu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project-Karan-Jangu` DEFAULT CHARACTER SET utf8 ;
USE `project-Karan-Jangu` ;

-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Employee` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Employee` (
  `Employee_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(256) NULL,
  `Salary` FLOAT NULL,
  `Gender` CHAR(1) NULL,
  `SSN` VARCHAR(45) NULL,
  `Start_date` DATETIME NULL,
  `End_date` DATETIME NULL,
  `Occupation` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Customer` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Customer` (
  `Address` VARCHAR(256) NULL,
  `Phone_number` VARCHAR(22) NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Order` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Order` (
  `Order_id` INT NOT NULL,
  `Order_date` DATETIME NULL,
  `Order_Amount` FLOAT NULL,
  `Order_type` VARCHAR(45) NULL,
  `Order_status` VARCHAR(45) NULL,
  `Employee_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_id`, `Employee_id`, `Customer_id`),
  INDEX `fk_Order_Employee1_idx` (`Employee_id` ASC),
  INDEX `fk_Order_Customer1_idx` (`Customer_id` ASC),
  CONSTRAINT `fk_Order_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `project-Karan-Jangu`.`Employee` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `project-Karan-Jangu`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Reservation` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Reservation` (
  `Reservation_date` DATETIME NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `fk_Reservation_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `project-Karan-Jangu`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Review` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Review` (
  `Service_rating` FLOAT NULL,
  `Satisfaction_level` FLOAT NULL,
  `Comments` VARCHAR(1000) NULL,
  `reviewid` INT NOT NULL,
  `Order_id` INT NOT NULL,
  PRIMARY KEY (`reviewid`, `Order_id`),
  INDEX `fk_Review_Order1_idx` (`Order_id` ASC),
  CONSTRAINT `fk_Review_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `project-Karan-Jangu`.`Order` (`Order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Items` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Items` (
  `Item_id` INT NOT NULL,
  `Item_name` VARCHAR(45) NULL,
  `Item_price` FLOAT NULL,
  `Stocked_units` INT NULL,
  PRIMARY KEY (`Item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Supplier` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Supplier` (
  `Supplier_id` INT NOT NULL,
  `SupplierName` VARCHAR(45) NULL,
  PRIMARY KEY (`Supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Supplier_invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Supplier_invoice` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Supplier_invoice` (
  `Item_cost` FLOAT NULL,
  `Order_date` DATETIME NULL,
  `Delivery_date` DATETIME NULL,
  `Item_quantity` INT NULL,
  `Item_id` INT NOT NULL,
  `Supplier_id` INT NOT NULL,
  PRIMARY KEY (`Item_id`, `Supplier_id`),
  INDEX `fk_Supplier_Items1_idx` (`Item_id` ASC),
  INDEX `fk_Supplier_invoice_Supplier1_idx` (`Supplier_id` ASC),
  CONSTRAINT `fk_Supplier_Items1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `project-Karan-Jangu`.`Items` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_invoice_Supplier1`
    FOREIGN KEY (`Supplier_id`)
    REFERENCES `project-Karan-Jangu`.`Supplier` (`Supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`Order_Detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`Order_Detail` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`Order_Detail` (
  `Item_count` FLOAT NULL,
  `Order_id` INT NOT NULL,
  `Item_id` INT NOT NULL,
  INDEX `fk_Order_id_Order1_idx` (`Order_id` ASC),
  INDEX `fk_Order_id_Items1_idx` (`Item_id` ASC),
  CONSTRAINT `fk_Order_id_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `project-Karan-Jangu`.`Order` (`Order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_id_Items1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `project-Karan-Jangu`.`Items` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project-Karan-Jangu`.`food_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project-Karan-Jangu`.`food_rating` ;

CREATE TABLE IF NOT EXISTS `project-Karan-Jangu`.`food_rating` (
  `food_rating` FLOAT NULL,
  `Review_reviewid` INT NOT NULL,
  `Item_id` INT NOT NULL,
  INDEX `fk_foodrating_Review1_idx` (`Review_reviewid` ASC),
  INDEX `fk_foodrating_Items1_idx` (`Item_id` ASC),
  CONSTRAINT `fk_foodrating_Review1`
    FOREIGN KEY (`Review_reviewid`)
    REFERENCES `project-Karan-Jangu`.`Review` (`reviewid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foodrating_Items1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `project-Karan-Jangu`.`Items` (`Item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;