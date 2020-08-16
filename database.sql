-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 16 août 2020 à 18:28
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bonalim`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliments`
--

DROP TABLE IF EXISTS `aliments`;
CREATE TABLE IF NOT EXISTS `aliments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `groupe` int(11) NOT NULL,
  `couleur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupe` (`groupe`),
  KEY `couleur` (`couleur`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`id`, `nom`, `groupe`, `couleur`) VALUES
(1, 'Laitue Boston', 6, 1),
(2, 'Laitue Romaine', 6, 2),
(3, 'Laitue Feuille de Chêne', 6, 3),
(4, 'Laitue Radicchio', 6, 4),
(5, 'Laitue Roquette', 6, 5),
(6, 'Laitue Iceberg', 6, 6),
(7, 'Laitue Mâche', 6, 7),
(8, 'Laitue Cresson', 6, 8),
(9, 'Laitue Frisée', 6, 9),
(10, 'Laitue Scarole', 6, 10),
(11, 'Lentilles vertes', 4, 11),
(12, 'Lentilles corail', 4, 12),
(13, 'Pâtes complètes', 5, 13),
(14, 'Haricots Verts', 6, 14),
(15, 'Pois cassés', 4, 15),
(16, 'Riz brun', 5, 16),
(17, 'Pousses d\'épinards', 6, 17),
(18, 'Maïs', 6, 18),
(19, 'Haricots rouges', 4, 19),
(20, 'Petits épis de maïs', 6, 20),
(21, 'Champignons de Paris', 6, 21),
(22, 'Avocat', 2, 22),
(23, 'Tomates cœur de pigeon', 7, 23),
(24, 'Tomates rondes', 7, 24),
(25, 'Chou rouge', 6, 25),
(26, 'Patates douces', 5, 26),
(27, 'Pousses mungo', 6, 27),
(28, 'Poivrons', 6, 28),
(29, 'Échalote', 8, 29),
(30, 'Coriandre', 8, 30),
(31, 'Persil', 8, 31),
(32, 'Oignons Rouges', 6, 32),
(33, 'Épices de votre choix', 8, 33),
(34, 'Pomme Golden', 7, 34),
(35, 'Pomme Granny Smith', 7, 35),
(36, 'Pomme Pink Lady', 7, 36),
(37, 'Pomme Gala', 7, 37),
(38, 'Pomme Fuji', 7, 38),
(39, 'Pomme Antares', 7, 39),
(40, 'Oseille', 6, 40),
(41, 'Noix de Cajou', 2, 41),
(42, 'Noix de Pécan', 2, 42),
(43, 'Amandes', 2, 43),
(44, 'Noisettes', 2, 44),
(45, 'Grenade', 7, 45),
(46, 'Olive Noires', 7, 46),
(47, 'Olives Vertes', 7, 47),
(48, 'Graines de Chia', 2, 48),
(49, 'Baies de Goji', 7, 49),
(50, 'Clémentines', 7, 50),
(51, 'Fèves de Soja', 4, 51),
(52, 'Oignons Verts', 6, 52),
(54, 'Levure de Bière', 9, 54),
(55, 'Germes de Blé', 9, 55);

-- --------------------------------------------------------

--
-- Structure de la table `bienfaits`
--

DROP TABLE IF EXISTS `bienfaits`;
CREATE TABLE IF NOT EXISTS `bienfaits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bienfaitsaliment`
--

DROP TABLE IF EXISTS `bienfaitsaliment`;
CREATE TABLE IF NOT EXISTS `bienfaitsaliment` (
  `aliment` int(11) NOT NULL,
  `bienfait` int(11) NOT NULL,
  PRIMARY KEY (`aliment`,`bienfait`),
  KEY `bienfait` (`bienfait`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bienfaitssauce`
--

DROP TABLE IF EXISTS `bienfaitssauce`;
CREATE TABLE IF NOT EXISTS `bienfaitssauce` (
  `bienfait` int(11) NOT NULL,
  `sauce` int(11) NOT NULL,
  PRIMARY KEY (`bienfait`,`sauce`),
  KEY `sauce` (`sauce`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
CREATE TABLE IF NOT EXISTS `couleurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `hexCode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `couleurs`
--

INSERT INTO `couleurs` (`id`, `nom`, `hexCode`) VALUES
(1, 'Vert Boston', '#8BD21E'),
(2, 'Vert Romaine', '#97C157'),
(3, 'Vert Feuille de Chêne', '#EDEDED'),
(4, 'Rouge Radicchio', '#A82835'),
(5, 'Vert Roquette', '#76B433'),
(6, 'Vert Iceberg', '#B5C86F'),
(7, 'Vert Mâche', '#619220'),
(8, 'Vert Cresson', '#395C07'),
(9, 'Vert Frisée', '#C0D744'),
(10, 'Vert Lentilles', '#5F7465'),
(11, 'Vert Scarole', '#599A1C'),
(12, 'Orange Corail', '#F2893B'),
(13, 'Marron Complètes', '#C69568'),
(14, 'Vert Haricots', '#3C6736'),
(15, 'Vert Cassés', '#8B9D4A'),
(16, 'Marron Brun', '#774939'),
(17, 'Vert Pousses', '#799A44'),
(18, 'Jaune Maïs', '#EEDA54'),
(19, 'Rouge Haricots', '#70202A'),
(20, 'Jaune Épis', '#E3C263'),
(21, 'Blanc de Paris', '#D8C6BA'),
(22, 'Vert Avocat', '#B8D574'),
(23, 'Rouge Cœur de Pigeon', '#F12F17'),
(24, 'Rouge Tomate', '#D20A14'),
(25, 'Violet Rouge', '#911088'),
(26, 'Orange Patate', '#F37F12'),
(27, 'Jaune Mungo', '#E3C870'),
(28, 'Rouge Poivrons', '#DA1D23'),
(29, 'Rose Échalote', '#DFCCCA'),
(30, 'Vert Coriandre', '#71AE76'),
(31, 'Vert Persil', '#285C09'),
(32, 'Blanc Rouge', '#DDD3D4'),
(33, 'Marron Épices', '#9F3C2D'),
(34, 'Jaune Golden', '#C6B71A'),
(35, 'Vert Granny Smith', '#9FC653'),
(36, 'Rouge Pink Lady', '#F0162B'),
(37, 'Rouge Gala', '#FE4437'),
(38, 'Rouge Fuji', '#F5726C'),
(39, 'Rouge Antares', '#C3443F'),
(40, 'Vert Oseille', '#4C842D'),
(41, 'Blanc Cajou', '#E6CC85'),
(42, 'Marron Pécan', '#C56830'),
(43, 'Marron Amande', '#DE9D58'),
(44, 'Marron Noisette', '#C4794E'),
(45, 'Rouge Grenade', '#B1222F'),
(46, 'Noir Olive', '#050503'),
(47, 'Vert Olive', '#C7B74A'),
(48, 'Noir Chia', '#473C38'),
(49, 'Rouge Goji', '#E2281E'),
(50, 'Orange Clémentine', '#F7901A'),
(51, 'Vert Fève', '#CCE065'),
(52, 'Vert Oignon', '#53AD50'),
(53, 'Jaune Jus de Citron', '#EFE156'),
(54, 'Marron De Bière', '#E0D0B0'),
(55, 'Jaune De Blé', '#EAC568'),
(56, 'Noir Balsamique', '#221309'),
(57, 'Orange Cidre', '#F0B831'),
(58, 'Orange Rouge', '#B52B12'),
(59, 'Beige Vinaigrette', '#E7AA57'),
(60, 'Marron Asiatique', '#763B09'),
(61, 'Blanc César', '#E3D3C4'),
(62, 'Jaune Italienne', '#D7A817'),
(63, 'Beige Française', '#EBA557'),
(64, 'Jaune Olive', '#FEDC21'),
(65, 'Marron Noix', '#9D6936'),
(66, 'Jaune Colza', '#E6D792'),
(67, 'Jaune Soja', '#DDA918'),
(68, 'Jaune Tournesol', '#EFEACC'),
(69, 'Jaune Lin', '#E3C74F');

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) NOT NULL,
  `quantiteQuotidienneRecommandee` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`id`, `intitule`, `quantiteQuotidienneRecommandee`) VALUES
(1, 'Matières grasses', NULL),
(2, 'Fruits à coque et graines', 25),
(3, 'Boissons protéinées', 500),
(4, 'Aliments protéinés', NULL),
(5, 'Féculents', 125),
(6, 'Légumes', 300),
(7, 'Fruits', 250),
(8, 'Condiments', NULL),
(9, 'Compléments alimentaires', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `proprietealiment`
--

DROP TABLE IF EXISTS `proprietealiment`;
CREATE TABLE IF NOT EXISTS `proprietealiment` (
  `aliment` int(11) NOT NULL,
  `propriete` int(11) NOT NULL,
  `valeur` tinyint(1) NOT NULL,
  PRIMARY KEY (`aliment`,`propriete`),
  KEY `propriete` (`propriete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proprietealiment`
--

INSERT INTO `proprietealiment` (`aliment`, `propriete`, `valeur`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1),
(11, 1, 1),
(12, 1, 1),
(13, 1, 1),
(14, 1, 1),
(15, 1, 1),
(16, 1, 1),
(29, 3, 1),
(17, 2, 1),
(18, 2, 1),
(19, 2, 1),
(20, 2, 1),
(21, 2, 1),
(22, 2, 1),
(23, 2, 1),
(24, 2, 1),
(25, 2, 1),
(26, 2, 1),
(27, 2, 1),
(28, 2, 1),
(30, 3, 1),
(31, 3, 1),
(32, 3, 1),
(33, 3, 1),
(34, 3, 1),
(35, 3, 1),
(36, 3, 1),
(37, 3, 1),
(38, 3, 1),
(39, 3, 1),
(40, 3, 1),
(41, 3, 1),
(42, 3, 1),
(43, 3, 1),
(44, 3, 1),
(45, 3, 1),
(46, 3, 1),
(47, 3, 1),
(48, 3, 1),
(49, 3, 1),
(50, 3, 1),
(51, 3, 1),
(52, 3, 1),
(53, 3, 1),
(54, 3, 1),
(55, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `proprietes`
--

DROP TABLE IF EXISTS `proprietes`;
CREATE TABLE IF NOT EXISTS `proprietes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proprietes`
--

INSERT INTO `proprietes` (`id`, `nom`) VALUES
(1, 'Base pour salade'),
(2, 'Accompagnement pour salade'),
(3, 'Assaisonnement pour salade'),
(4, 'Sauce pour salade');

-- --------------------------------------------------------

--
-- Structure de la table `proprietesaliments`
--

DROP TABLE IF EXISTS `proprietesaliments`;
CREATE TABLE IF NOT EXISTS `proprietesaliments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proprietesaliments`
--

INSERT INTO `proprietesaliments` (`id`, `nom`) VALUES
(1, 'Base pour salade'),
(2, 'Accompagnement pour salade'),
(3, 'Assaisonnement pour salade'),
(4, 'Sauce pour salade');

-- --------------------------------------------------------

--
-- Structure de la table `proprietesauce`
--

DROP TABLE IF EXISTS `proprietesauce`;
CREATE TABLE IF NOT EXISTS `proprietesauce` (
  `sauce` int(11) NOT NULL,
  `propriete` int(11) NOT NULL,
  `valeur` tinyint(1) NOT NULL,
  PRIMARY KEY (`sauce`,`propriete`),
  KEY `propriete` (`propriete`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `proprietesauce`
--

INSERT INTO `proprietesauce` (`sauce`, `propriete`, `valeur`) VALUES
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 4, 1),
(5, 4, 1),
(6, 4, 1),
(7, 4, 1),
(8, 4, 1),
(9, 4, 1),
(10, 4, 1),
(11, 4, 1),
(12, 4, 1),
(13, 4, 1),
(14, 4, 1),
(15, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `saisonaliment`
--

DROP TABLE IF EXISTS `saisonaliment`;
CREATE TABLE IF NOT EXISTS `saisonaliment` (
  `aliment` int(11) NOT NULL,
  `saison` int(11) NOT NULL,
  PRIMARY KEY (`aliment`,`saison`),
  KEY `saison` (`saison`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `saisons`
--

DROP TABLE IF EXISTS `saisons`;
CREATE TABLE IF NOT EXISTS `saisons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sauces`
--

DROP TABLE IF EXISTS `sauces`;
CREATE TABLE IF NOT EXISTS `sauces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `recetteUrl` text DEFAULT NULL,
  `couleur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couleur` (`couleur`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sauces`
--

INSERT INTO `sauces` (`id`, `nom`, `recetteUrl`, `couleur`) VALUES
(1, 'Jus de Citron', NULL, 53),
(2, 'Vinaigre Balsamique', NULL, 56),
(3, 'Vinaigre de Cidre', NULL, 57),
(4, 'Vinaigre de Vin Rouge', NULL, 58),
(5, 'Vinaigrette de Base', 'https://www.fraichementpresse.ca/recettes/vinaigrette-base-1.1591152', 59),
(6, 'Vinaigrette Asiatique', 'https://www.fraichementpresse.ca/recettes/vinaigrette-asiatique-1.1591162', 60),
(7, 'Vinaigrette César', 'https://www.fraichementpresse.ca/recettes/vinaigrette-cesar-1.1591171', 61),
(8, 'Vinaigrette Italienne', 'https://www.fraichementpresse.ca/recettes/vinaigrette-italienne-1.1591180', 62),
(9, 'Vinaigrette Française', 'https://www.fraichementpresse.ca/recettes/vinaigrette-francaise-1.1591188', 63),
(10, 'Huile d\'Olive', NULL, 64),
(11, 'Huile de Noix', NULL, 65),
(12, 'Huile de Colza', NULL, 66),
(13, 'Huile de Soja', NULL, 67),
(14, 'Huile de Tournesol', NULL, 68),
(15, 'Huile de Lin', NULL, 69);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
