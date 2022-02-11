-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 09 fév. 2022 à 11:27
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `biblio2022`
--

DELIMITER $$
--
-- Fonctions
--
DROP FUNCTION IF EXISTS `adhesion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `adhesion` (`numa` INT(4)) RETURNS INT(4) begin
declare nbjours int(4);
select Datediff(curdate(),dateadh) into nbjours from adherent
where num=numa;
return nbjours;
end$$

DROP FUNCTION IF EXISTS `auth`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `auth` (`adr` VARCHAR(30), `pw` VARCHAR(40)) RETURNS INT(1) begin
if exists(select *from adherent where email=adr and mdp=pw) then
    return 1;
    else return 0;
end if;
end$$

DROP FUNCTION IF EXISTS `edit`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `edit` (`cotelivre` INT(4)) RETURNS VARCHAR(30) CHARSET utf8 begin
declare nom varchar(30);
select nomedit into nom
from editeur
inner join livre
on  editeur.code=livre.codedit
where cote=cotelivre;

return nom;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `num` int(4) NOT NULL AUTO_INCREMENT,
  `nomadh` varchar(20) NOT NULL,
  `prenadh` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mdp` varchar(40) NOT NULL,
  `dateadh` date DEFAULT NULL,
  `cotisation` int(3) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`num`, `nomadh`, `prenadh`, `email`, `mdp`, `dateadh`, `cotisation`) VALUES
(1, 'DORESCUELLE', 'Ella', 'eldor@gmail.com', 'DOREll', '2020-05-03', 305),
(2, 'DORESCUELLE', 'Elsa', 'eldort@free.fr', 'DOREls', '2020-04-27', 303),
(3, 'DORESCUELLE', 'Hila', 'hildor@yahoo.com', 'DORHil', '2020-03-21', 193),
(4, 'FRINPOT', 'Joe', 'jofr@free.fr', 'FRIJoe', '2019-04-01', 189),
(5, 'TERNET', 'Alain', 'alter@gmail.com', 'TERAla', '2019-11-28', 238),
(6, 'TERIEUR', 'Alex', 'alter@free.fr', 'TERAle', '2019-01-14', 164),
(7, 'TERIEUR', 'Alain', 'alter@yahoo.com', 'TERAla', '2019-03-07', 243),
(8, 'DIKUL', 'Thierry', 'thidy@free.fr', 'DIKThi', '2019-11-04', 292),
(9, 'EPADALGO', 'Jennifer', 'jennep@yahoo.com', 'EPAJen', '2020-01-22', 342),
(10, 'MANTERT', 'Rudy', 'rudma@gmail.com', 'MANRud', '2019-10-07', 230),
(11, 'DELUNE', 'Claire', 'clade@gmail.com', 'DELCla', '2020-04-25', 161),
(12, 'MATIK', 'Otto', 'otma@free.fr', 'MATOtt', '2019-11-05', 252),
(13, 'MIKOTON', 'Mylene', 'mylmi@yahoo.com', 'MIKMyl', '2019-12-04', 343),
(14, 'PAGESSUIPRESSET', 'Johnatan', 'johpa@free.fr', 'PAGJoh', '2018-12-25', 356),
(15, 'MEDUR', 'Sara', 'sarme@gmail.com', 'MEDSar', '2020-02-09', 367),
(16, 'ZIEUVERRE', 'Bruno', 'bruzi@free.fr', 'ZIEBru', '2019-04-04', 383),
(17, 'TANCIL', 'Luce', 'luta@gmail.com', 'TANLuc', '2019-11-25', 188),
(18, 'MANFASSILE', 'Estelle', 'esma@yahoo.com', 'MANEst', '2019-02-16', 380),
(19, 'EBILE', 'Ted', 'tedeb@gmail.com', 'EBITed', '2019-06-03', 233),
(20, 'DOIZO', 'Lenny', 'ledo@free.fr', 'DOILen', '2020-06-07', 304),
(21, 'TRANET', 'Alex', 'altra@gmail.com', 'TRAAle', '2020-05-18', 191),
(22, 'ZARELLA', 'Maud', 'maza@yahoo.com', 'ZARMau', '2020-08-23', 179);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` varchar(3) NOT NULL,
  `nomcateg` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nomcateg`) VALUES
('c1', 'Programmation'),
('c2', 'Analyse'),
('c3', 'SQL'),
('c4', 'Développement');

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `code` varchar(3) NOT NULL,
  `nomedit` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`code`, `nomedit`) VALUES
('e1', 'EYROLLES'),
('e2', 'DUNOD'),
('e3', 'ELLIPSES'),
('e4', 'ENI'),
('e5', 'OREILLY'),
('e6', 'PEARSON');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `num` int(6) NOT NULL AUTO_INCREMENT,
  `numadh` int(4) NOT NULL,
  `cotelivre` int(4) NOT NULL,
  `datemp` date NOT NULL,
  `dateretour` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `numadh` (`numadh`),
  KEY `cotelivre` (`cotelivre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`num`, `numadh`, `cotelivre`, `datemp`, `dateretour`) VALUES
(4, 10, 125, '2021-10-23', '2021-10-21'),
(5, 7, 123, '2021-10-23', '2021-10-21'),
(6, 8, 124, '2021-10-23', NULL),
(7, 11, 127, '2021-10-23', NULL),
(8, 6, 121, '2021-11-06', '2021-11-03'),
(9, 1, 125, '2021-10-08', '2021-10-07'),
(10, 1, 123, '2021-11-07', NULL),
(11, 1, 137, '2021-11-08', NULL),
(12, 1, 135, '2021-11-08', NULL),
(13, 1, 129, '2021-11-09', NULL),
(14, 1, 122, '2021-11-18', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `cote` int(4) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) NOT NULL,
  `annee` int(4) NOT NULL,
  `etat` int(1) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `commentaire` text NOT NULL,
  `idcateg` varchar(3) NOT NULL,
  `codedit` varchar(3) NOT NULL,
  PRIMARY KEY (`cote`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`cote`, `titre`, `annee`, `etat`, `photo`, `commentaire`, `idcateg`, `codedit`) VALUES
(121, 'Init.prog.Objet', 2012, 0, '121', 'Cet ouvrage permet d\'approcher la programmation objet progressivement', 'c1', 'e1'),
(122, 'Algorithmes', 2013, 1, '122', 'Ce livre sur l\'algorithmique s\'adresse aux débutants', 'c1', 'e4'),
(123, 'UML.Initiation', 2011, 1, '123', 'Ce livre sur UML 2 s\'adresse tout autant aux novices qu\'aux experts', 'c2', 'e4'),
(124, 'Pratique d\'UML', 2010, 1, '124', 'UML est le langage de modélisation le plus utilisé en entreprise', 'c2', 'e6'),
(125, 'Mysql. Guide', 2013, 0, '125', 'Ce livre sur MySQL 5 s\'adresse aux débutants', 'c3', 'e4'),
(126, 'Sql pour Oracle', 2013, 0, '126', 'Puissant outil pour ceux qui travaillent sur Oracle', 'c3', 'e1'),
(127, 'Jquery-Ajax-Php', 2013, 1, '127', 'JQuery est un ensemble de fonctions, procédures et classes écrites en javascript', 'c4', 'e1'),
(128, 'Java 7', 2013, 0, '128', 'Très  bon ouvrage sur la dernière version de Java', 'c4', 'e6'),
(129, 'HTML5-CSS3', 2013, 1, '129', 'Pour les designers Web, la conception des sites Web passe par la maîtrise de ces langages', 'c4', 'e4'),
(130, 'Java-Eclipse', 2012, 0, '130', 'e livre sur Java et Eclipse s\'adresse aux débutants et confirmés', 'c4', 'e4'),
(131, 'Java Spring', 2015, 0, '131', 'Ce livre apporte les éléments clés pour se repérer dans les différentes technologies utilisées dans les projets basés sur Spring. ', 'c4', 'e4'),
(132, 'Architectures java', 2015, 0, '132', 'Cet ouvrage s\'adresse aux ingénieurs logiciel, développeurs, architectes et chefs de projet.\r\n\r\nLongtemps les applications réparties ont été réservées à de grands systèmes, mais aujourd\'hui les besoins se diversifient et les plus petits objets doivent maintenant communiquer. Le langage Java apporte une simplification importante qui met cette technologie à la portée de tous, notamment dans le monde industriel, et fournit de nombreux outils et concepts pour le middleware.', 'c1', 'e2'),
(133, 'Jquery', 2014, 0, '133', 'Ce livre sur jQuery s\'adresse à des experts ou des candidats experts dans la création de sites Web. La connaissance, sinon la maîtrise du JavaScript, des feuilles de style CSS, du DOM et de l\'AJAX sont des pré-requis ndispensables à la compréhension et à la mise en pratique de cet ouvrage.', 'c4', 'e4'),
(134, 'Jquery Mobile', 2012, 0, '134', 'L\'avenir appartient aux applications web mobiles ! Découvrez jQuery Mobile ou approfondissez vos connaissances, et explorez les dernières nouveautés de la version 1.2 pour développer des applications web mobiles cross-platform en toute simplicité.\r\njQuery Mobile est le framework optimisé pour les interactions tactiles et les interfaces mobiles, qui permet de créer des applications web qui se comportent et se présentent de la même manière sur une grande variété de tablettes et de smartphones. Cet ouvrage synthétique et précis s\'articule autour d\'exemples de codes complets en HTML5, CSS3 et JavaScript, et vous guide pas à pas dans la création d\'une application fonctionnelle avec jQuery Mobile.', 'c4', 'e6'),
(135, 'UML. Apprentissage-pratique', 2014, 1, '135', 'Ce livre s\'adresse \r\n. aux étudiants en informatique qui suivent un cursus comportant du génie logiciel, de la modélisation UML ou de la programmation objet\r\n. aux professeurs désirant s\'appuyer sur un support de cours précis et complet\r\n. aux professionnels informaticiens utilisant UML dans leurs projets', 'c2', 'e6'),
(136, 'Mento UML', 2015, 0, '136', 'Indéchirables et imperméables, les mémentos Eyrolles sont des aide-mémoires pratiques pour le travail quotidien : chaque mémento reprend l\'essentiel d\'une technologie sous la forme d\'un dépliant de 14 pages.\r\nLe langage de modélisation unifié - ou Unified Modeling Language (UML) - est un langage de modélisation graphique à base de pictogrammes conçu pour fournir une méthode normalisée pour visualiser la conception d\'un système ou d\'un projet. Il est couramment utilisé en développement logiciel et en conception orientée objet. ', 'c2', 'e1'),
(137, 'Programmer avec Mysql', 2015, 1, '137', 'Particulièrement destiné aux débutants, cet ouvrage permet de découvrir tous les aspects de la programmation SQL (création de tables, évolution, mises à jour et extractions) par le biais du système de gestion de bases de données MySQL. Les concepts du langage procédural de MySQL y sont décrits avec précision : variables, structure de contrôle, interactions avec la base, ', 'c3', 'e1'),
(138, 'Php_MySql_JavaScript', 2015, 0, '138', 'Construisez des sites web interactifs, pilotés par les données avec la puissante combinaison des technologies en source ouverte et des normes du Web, même si vous n\'avez que des connaissances de base du HTML. Avec ce guide plébiscité en mains, vous abordez la programmation web dynamique à laide des technologies de base d\'aujourd\'hui : PHP, MySQL, JavaScript, jQuery, CSS3 et HTML5.', 'c4', 'e5'),
(139, 'JavaScript', 2021, 0, ' ', 'simple', 'C1', 'e2');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `livredit`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `livredit`;
CREATE TABLE IF NOT EXISTS `livredit` (
`cote` int(4)
,`codedit` varchar(3)
,`nomedit` varchar(30)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_adherent`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_adherent`;
CREATE TABLE IF NOT EXISTS `v_adherent` (
`nomadh` varchar(20)
,`prenadh` varchar(20)
,`date_adhesion` varchar(8)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_emprunt`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_emprunt`;
CREATE TABLE IF NOT EXISTS `v_emprunt` (
`num_emprunt` int(6)
,`date_emprunt` varchar(8)
,`nomadh` varchar(20)
,`titre` varchar(30)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_nompren`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_nompren`;
CREATE TABLE IF NOT EXISTS `v_nompren` (
`num` int(4)
,`nom_prenom` varchar(41)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_retards`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_retards`;
CREATE TABLE IF NOT EXISTS `v_retards` (
`num_emprunt` int(6)
,`date_emprunt` varchar(10)
,`nomadh` varchar(20)
,`prenadh` varchar(20)
,`jours_retard` int(7)
);

-- --------------------------------------------------------

--
-- Structure de la vue `livredit`
--
DROP TABLE IF EXISTS `livredit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livredit`  AS  select `livre`.`cote` AS `cote`,`livre`.`codedit` AS `codedit`,`editeur`.`nomedit` AS `nomedit` from (`livre` join `editeur` on((`livre`.`codedit` = `editeur`.`code`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_adherent`
--
DROP TABLE IF EXISTS `v_adherent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_adherent`  AS  select `adherent`.`nomadh` AS `nomadh`,`adherent`.`prenadh` AS `prenadh`,date_format(`adherent`.`dateadh`,'%d/%m/%y') AS `date_adhesion` from `adherent` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_emprunt`
--
DROP TABLE IF EXISTS `v_emprunt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_emprunt`  AS  select `emprunt`.`num` AS `num_emprunt`,date_format(`emprunt`.`datemp`,'%d/%m/%y') AS `date_emprunt`,`adherent`.`nomadh` AS `nomadh`,`livre`.`titre` AS `titre` from ((`emprunt` join `adherent` on((`emprunt`.`numadh` = `adherent`.`num`))) join `livre` on((`emprunt`.`cotelivre` = `livre`.`cote`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_nompren`
--
DROP TABLE IF EXISTS `v_nompren`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nompren`  AS  select `adherent`.`num` AS `num`,concat(`adherent`.`nomadh`,' ',`adherent`.`prenadh`) AS `nom_prenom` from `adherent` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_retards`
--
DROP TABLE IF EXISTS `v_retards`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_retards`  AS  select `emprunt`.`num` AS `num_emprunt`,date_format(`emprunt`.`datemp`,'%d/%m/%Y') AS `date_emprunt`,`adherent`.`nomadh` AS `nomadh`,`adherent`.`prenadh` AS `prenadh`,(to_days(curdate()) - to_days((`emprunt`.`datemp` + interval 15 day))) AS `jours_retard` from (`emprunt` join `adherent` on((`emprunt`.`numadh` = `adherent`.`num`))) where (`emprunt`.`dateretour` is not null) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`numadh`) REFERENCES `adherent` (`num`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`cotelivre`) REFERENCES `livre` (`cote`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
