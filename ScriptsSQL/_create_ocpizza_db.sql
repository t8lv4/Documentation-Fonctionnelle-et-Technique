-- MySQL Script generated by MySQL Workbench
-- Fri Aug 17 12:29:29 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ocpizza
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `ocpizza`
-- -----------------------------------------------------
-- Schema ocpizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ocpizza` DEFAULT CHARACTER SET utf8 ;
USE `ocpizza` ;

-- -----------------------------------------------------
-- Table `ocpizza`.`geolocalisation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`geolocalisation` (
  `idgeolocalisation` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(10,6) NULL,
  `longitude` DECIMAL(10,6) NULL,
  PRIMARY KEY (`idgeolocalisation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`client` (
  `numero_client` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prenom_client` VARCHAR(45) NOT NULL,
  `nom_client` VARCHAR(45) NOT NULL,
  `adresse_mail` VARCHAR(45) NOT NULL,
  `numero_telephone` VARCHAR(10) NOT NULL,
  `mot_de_passe` VARCHAR(45) NOT NULL,
  `geolocalisation_idgeolocalisation` INT UNSIGNED NULL,
  PRIMARY KEY (`numero_client`),
  INDEX `fk_client_geolocalisation_idx` (`geolocalisation_idgeolocalisation` ASC),
  UNIQUE INDEX `adresse_mail_UNIQUE` (`adresse_mail` ASC),
  UNIQUE INDEX `numero_telephone_UNIQUE` (`numero_telephone` ASC),
  CONSTRAINT `fk_client_geolocalisation`
    FOREIGN KEY (`geolocalisation_idgeolocalisation`)
    REFERENCES `ocpizza`.`geolocalisation` (`idgeolocalisation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`restaurant` (
  `reference_restaurant` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_telephone` VARCHAR(10) NOT NULL,
  `faq` TEXT NOT NULL,
  `a_propos` TEXT NOT NULL,
  `mention_legale` TEXT NOT NULL,
  PRIMARY KEY (`reference_restaurant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`adresse` (
  `idadresse` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `destinataire` VARCHAR(45) NOT NULL,
  `numero` SMALLINT UNSIGNED NOT NULL,
  `rue` VARCHAR(45) NOT NULL,
  `ville` VARCHAR(45) NOT NULL,
  `code_postal` MEDIUMINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`idadresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`produit` (
  `idproduit` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_produit` VARCHAR(45) NOT NULL,
  `nom_produit` VARCHAR(45) NOT NULL,
  `type_produit` VARCHAR(45) NOT NULL,
  `prix_produit_ht` TINYINT UNSIGNED NOT NULL,
  `disponible` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`idproduit`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`commande` (
  `numero_commande` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_commande` DATETIME NOT NULL,
  `valeur_panier` DECIMAL(5,2) UNSIGNED NOT NULL,
  `bon_reduction` VARCHAR(45) NULL,
  `livraison` TINYINT(1) UNSIGNED NOT NULL,
  `client_actif` TINYINT(1) UNSIGNED NOT NULL,
  `etat_creation` TINYINT(1) UNSIGNED NOT NULL,
  `etat_paiement` TINYINT(1) UNSIGNED NOT NULL,
  `etat_preparation` TINYINT(1) UNSIGNED NOT NULL,
  `etat_livraison` TINYINT(1) UNSIGNED NOT NULL,
  `client_numero_client` INT UNSIGNED NOT NULL,
  `adresse_idadresse` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`numero_commande`),
  INDEX `fk_panier_client1_idx` (`client_numero_client` ASC),
  INDEX `fk_commande_adresse1_idx` (`adresse_idadresse` ASC),
  CONSTRAINT `fk_panier_client1`
    FOREIGN KEY (`client_numero_client`)
    REFERENCES `ocpizza`.`client` (`numero_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_adresse1`
    FOREIGN KEY (`adresse_idadresse`)
    REFERENCES `ocpizza`.`adresse` (`idadresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`article` (
  `id_article` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantite_produit` TINYINT UNSIGNED NOT NULL,
  `valeur` DECIMAL(5,2) UNSIGNED NOT NULL,
  `commande_numero_commande` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_article`),
  INDEX `fk_article_commande1_idx` (`commande_numero_commande` ASC),
  CONSTRAINT `fk_article_commande1`
    FOREIGN KEY (`commande_numero_commande`)
    REFERENCES `ocpizza`.`commande` (`numero_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`ingredient` (
  `reference_ingredient` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_ingredient` VARCHAR(45) NOT NULL,
  `grammage` DECIMAL(4,1) UNSIGNED NOT NULL,
  PRIMARY KEY (`reference_ingredient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`employe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`employe` (
  `idemploye` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prenom_employe` VARCHAR(45) NOT NULL,
  `fonction` TINYINT(2) ZEROFILL NOT NULL,
  `restaurant_reference_restaurant` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idemploye`),
  INDEX `fk_employe_restaurant1_idx` (`restaurant_reference_restaurant` ASC),
  CONSTRAINT `fk_employe_restaurant1`
    FOREIGN KEY (`restaurant_reference_restaurant`)
    REFERENCES `ocpizza`.`restaurant` (`reference_restaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`recette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`recette` (
  `reference_recette` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_recette` VARCHAR(45) NOT NULL,
  `temps_estime` SMALLINT UNSIGNED NOT NULL,
  `employe_idemploye` INT UNSIGNED NOT NULL,
  `commande_numero_commande` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reference_recette`, `employe_idemploye`, `commande_numero_commande`),
  INDEX `fk_recette_employe1_idx` (`employe_idemploye` ASC),
  INDEX `fk_recette_commande1_idx` (`commande_numero_commande` ASC),
  CONSTRAINT `fk_recette_employe1`
    FOREIGN KEY (`employe_idemploye`)
    REFERENCES `ocpizza`.`employe` (`idemploye`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recette_commande1`
    FOREIGN KEY (`commande_numero_commande`)
    REFERENCES `ocpizza`.`commande` (`numero_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`notification` (
  `idnotification` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(45) NOT NULL,
  `date_envoi` DATETIME NOT NULL,
  `employe_idemploye` INT UNSIGNED NOT NULL,
  `client_numero_client` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idnotification`, `employe_idemploye`, `client_numero_client`),
  INDEX `fk_notification_employe1_idx` (`employe_idemploye` ASC),
  INDEX `fk_notification_client1_idx` (`client_numero_client` ASC),
  CONSTRAINT `fk_notification_employe1`
    FOREIGN KEY (`employe_idemploye`)
    REFERENCES `ocpizza`.`employe` (`idemploye`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_client1`
    FOREIGN KEY (`client_numero_client`)
    REFERENCES `ocpizza`.`client` (`numero_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`restaurant_has_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`restaurant_has_client` (
  `restaurant_reference_restaurant` TINYINT UNSIGNED NOT NULL,
  `client_numero_client` INT UNSIGNED NULL,
  PRIMARY KEY (`restaurant_reference_restaurant`, `client_numero_client`),
  INDEX `fk_restaurant_has_client_client1_idx` (`client_numero_client` ASC),
  INDEX `fk_restaurant_has_client_restaurant1_idx` (`restaurant_reference_restaurant` ASC),
  CONSTRAINT `fk_restaurant_has_client_restaurant1`
    FOREIGN KEY (`restaurant_reference_restaurant`)
    REFERENCES `ocpizza`.`restaurant` (`reference_restaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_client_client1`
    FOREIGN KEY (`client_numero_client`)
    REFERENCES `ocpizza`.`client` (`numero_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`recette_has_ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`recette_has_ingredient` (
  `recette_reference_recette` INT UNSIGNED NOT NULL,
  `ingredient_reference_ingredient` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`recette_reference_recette`, `ingredient_reference_ingredient`),
  INDEX `fk_recette_has_ingredient_ingredient1_idx` (`ingredient_reference_ingredient` ASC),
  INDEX `fk_recette_has_ingredient_recette1_idx` (`recette_reference_recette` ASC),
  CONSTRAINT `fk_recette_has_ingredient_recette1`
    FOREIGN KEY (`recette_reference_recette`)
    REFERENCES `ocpizza`.`recette` (`reference_recette`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recette_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_reference_ingredient`)
    REFERENCES `ocpizza`.`ingredient` (`reference_ingredient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocpizza`.`article_has_produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocpizza`.`article_has_produit` (
  `article_idarticle` INT UNSIGNED NOT NULL,
  `produit_idproduit` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`article_idarticle`, `produit_idproduit`),
  INDEX `fk_ligne_article_has_article_ligne_article1_idx` (`article_idarticle` ASC),
  INDEX `fk_ligne_article_has_article_article1_idx` (`produit_idproduit` ASC),
  CONSTRAINT `fk_ligne_article_has_article_ligne_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `ocpizza`.`article` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ligne_article_has_article_article1`
    FOREIGN KEY (`produit_idproduit`)
    REFERENCES `ocpizza`.`produit` (`idproduit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;