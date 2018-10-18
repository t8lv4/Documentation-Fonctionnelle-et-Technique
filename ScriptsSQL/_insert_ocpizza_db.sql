START TRANSACTION;

-- -----------------------------------------------------
-- Table `ocpizza`.`geolocalisation`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`geolocalisation`
	(`idgeolocalisation`, `latitude`, `longitude`)
VALUES
	(1, '48.872198', '2.337178'),
	(2, '48.875773', '2.347595'),
	(3, NULL, NULL)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`client`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`client`
	(`numero_client`, `prenom_client`, `nom_client`, `adresse_mail`, `numero_telephone`, `mot_de_passe`, `geolocalisation_idgeolocalisation`)
VALUES
	(1, 'Alan', 'Turing', 'alan.turing@gmail.com', '0601020304', 'crypto', 1),
	(2, 'Grace', 'Hopper', 'grace.hopper@outlook.com', '0701020304', 'compilation', 2),
	(3, 'John', 'Von Neumann', 'john.vonneumann@yahoo.com', '0607080901', 'memoire', 3)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`adresse`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`adresse`
	(`idadresse`, `destinataire`, `numero`, `rue`, `ville`, `code_postal`)
VALUES
	(1, 'Alan Turing', '7', 'rue Poissonière', 'Paris', '75002'),
	(2, 'Grace Hopper', '7', 'boulevard Haussman', 'Paris', '75009'),
	(3, 'John Von Neumann', '3', 'rue Bleue', 'Paris', '75009'),
	(4, 'restaurant Martyrs', '11', 'rue des Martyrs', 'Paris', '75009'),
	(5, 'restaurant Chemin Vert', '45', 'rue du Chemin Vert', 'Paris', '75011'),
	(6, 'restaurant Caulaincourt', '23', 'rue Caulaincourt', 'Paris', '75018')
;

-- -----------------------------------------------------
-- Table `ocpizza`.`restaurant`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`restaurant`
	(`reference_restaurant`, `numero_telephone`, `faq`, `a_propos`, `mention_legale`)
VALUES
	(1, '0123456789', 'Accenderat super his incitatum propositum ad nocendum aliqua mulier vilis, quae ad palatium ut poposcerat intromissa insidias ei latenter obtendi prodiderat a militibus obscurissimis. quam Constantina exultans ut in tuto iam locata mariti salute muneratam vehiculoque inpositam per regiae ianuas emisit in publicum, ut his inlecebris alios quoque ad indicanda proliceret paria vel maiora.', 'Latius iam disseminata licentia onerosus bonis omnibus Caesar nullum post haec adhibens modum orientis latera cuncta vexabat nec honoratis parcens nec urbium primatibus nec plebeiis.', 'Quam ob rem id primum videamus, si placet, quatenus amor in amicitia progredi debeat. Numne, si Coriolanus habuit amicos, ferre contra patriam arma illi cum Coriolano debuerunt? num Vecellinum amici regnum adpetentem, num Maelium debuerunt iuvare?'),
	(2, '0123456789', 'Accenderat super his incitatum propositum ad nocendum aliqua mulier vilis, quae ad palatium ut poposcerat intromissa insidias ei latenter obtendi prodiderat a militibus obscurissimis. quam Constantina exultans ut in tuto iam locata mariti salute muneratam vehiculoque inpositam per regiae ianuas emisit in publicum, ut his inlecebris alios quoque ad indicanda proliceret paria vel maiora.', 'Latius iam disseminata licentia onerosus bonis omnibus Caesar nullum post haec adhibens modum orientis latera cuncta vexabat nec honoratis parcens nec urbium primatibus nec plebeiis.', 'Quam ob rem id primum videamus, si placet, quatenus amor in amicitia progredi debeat. Numne, si Coriolanus habuit amicos, ferre contra patriam arma illi cum Coriolano debuerunt? num Vecellinum amici regnum adpetentem, num Maelium debuerunt iuvare?'),
	(3, '0123456789', 'Accenderat super his incitatum propositum ad nocendum aliqua mulier vilis, quae ad palatium ut poposcerat intromissa insidias ei latenter obtendi prodiderat a militibus obscurissimis. quam Constantina exultans ut in tuto iam locata mariti salute muneratam vehiculoque inpositam per regiae ianuas emisit in publicum, ut his inlecebris alios quoque ad indicanda proliceret paria vel maiora.', 'Latius iam disseminata licentia onerosus bonis omnibus Caesar nullum post haec adhibens modum orientis latera cuncta vexabat nec honoratis parcens nec urbium primatibus nec plebeiis.', 'Quam ob rem id primum videamus, si placet, quatenus amor in amicitia progredi debeat. Numne, si Coriolanus habuit amicos, ferre contra patriam arma illi cum Coriolano debuerunt? num Vecellinum amici regnum adpetentem, num Maelium debuerunt iuvare?')
	;

	-- -----------------------------------------------------
	-- Table `ocpizza`.`commande`
	-- -----------------------------------------------------
	INSERT INTO `ocpizza`.`commande`
		(`numero_commande`, `date_commande`, `valeur_panier`, `bon_reduction`, `livraison`, `client_actif`, `etat_creation`, `etat_paiement`, `etat_preparation`, `etat_livraison`, `client_numero_client`, `adresse_idadresse`)
	VALUES
		(1, '2018-07-14 12:46:28', '25,00', NULL, '1', '1', '1', '0', '1', '0', 1, 1),
		(2, '2018-07-13 13:02:12', '11,00', NULL, '0', '1', '1', '1', '2', '1', 2, 4)
	;

-- -----------------------------------------------------
-- Table `ocpizza`.`article`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`article`
	(`id_article`, `quantite_produit`, `valeur`, `commande_numero_commande`)
VALUES
	(1, '1', '12,00', 1),
	(2, '1', '6,00', 1),
	(3, '2', '7,00', 1),
	(4, '1', '11,00', 2)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`produit`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`produit`
	(`idproduit`, `reference_produit`, `nom_produit`, `type_produit`, `prix_produit_ht`, `disponible`)
VALUES
	(1, '123456', 'pizza napolitaine', 'pizza', '10,00', '1'),
	(2, '789456', 'tiramisu', 'dessert', '4,00', '1'),
	(3, '189000', 'bière Roma', 'boisson alcoolisée', '3,12', '1'),
	(4, '289000', 'Evian', 'boisson non-alcoolisée', '2,60', '1'),
	(5, '123457', 'pizza roma', 'pizza', '9,50', '1')
;

-- -----------------------------------------------------
-- Table `ocpizza`.`ingredient`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`ingredient`
	(`reference_ingredient`, `nom_ingredient`, `grammage`)
VALUES
	(1, 'anchois', '5,0'),
	(2, 'câpres', '3,0'),
	(3, 'mozzarella', '15,0'),
	(4, 'roquette', '10,0'),
	(5, 'champignon', '25,0')
;

-- -----------------------------------------------------
-- Table `ocpizza`.`employe`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`employe`
	(`idemploye`, `prenom_employe`, `fonction`, `restaurant_reference_restaurant`)
VALUES
	(1, 'Richard', '00', 1),
	(2, 'Erlich', '01', 1),
	(3, 'Bertram', '02', 1)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`recette`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`recette`
	(`reference_recette`, `nom_recette`, `temps_estime`, `employe_idemploye`, `commande_numero_commande`)
VALUES
	(1, 'pizza napolitaine', '420', 1, 1),
	(2, 'pizza roma', '450', 1, 2)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`notification`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`notification`
	(`idnotification`, `message`, `date_envoi`, `employe_idemploye`, `client_numero_client`)
VALUES
	(1, 'en cours de livraison', '2018-07-14 12:50:09', 2, 1),
	(2, 'en cours de préparation', '2018-07-16 14:02:45', 1, 2)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`restaurant_has_client`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`restaurant_has_client`
	(`restaurant_reference_restaurant`, `client_numero_client`)
VALUES
	(1, 2),
	(2, 3)
;

-- -----------------------------------------------------
-- Table `ocpizza`.`recette_has_ingredient`
-- -----------------------------------------------------
INSERT INTO `ocpizza`.`recette_has_ingredient`
	(`recette_reference_recette`, `ingredient_reference_ingredient`)
VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(2, 3),
	(2, 4)
	;

	-- -----------------------------------------------------
	-- Table `ocpizza`.`article_has_produit`
	-- -----------------------------------------------------
	INSERT INTO `ocpizza`.`article_has_produit`
		(`article_idarticle`, `produit_idproduit`)
	VALUES
		(1, 1),
		(2, 2),
		(3, 3),
		(4, 5)
	;




	COMMIT;
