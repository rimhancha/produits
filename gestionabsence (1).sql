-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 08 fév. 2022 à 22:41
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionabsence`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoirabscence`
--

CREATE TABLE `avoirabscence` (
  `idabs` int(11) NOT NULL,
  `dateabs` date NOT NULL,
  `semestre` int(11) NOT NULL,
  `annuniv` int(11) NOT NULL,
  `codee` int(11) NOT NULL,
  `codemat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `avoirabscence`
--

INSERT INTO `avoirabscence` (`idabs`, `dateabs`, `semestre`, `annuniv`, `codee`, `codemat`) VALUES
(1, '2022-01-02', 1, 2021, 1, 1),
(2, '2022-01-04', 1, 2021, 2, 2),
(3, '2022-01-04', 1, 2021, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `codee` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `nbreabs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`codee`, `nom`, `prenom`, `nbreabs`) VALUES
(1, 'RIM', 'HANCHA', 2),
(2, 'WASSIM', 'SNEN', 4),
(3, 'CHAYMA', 'GHACHEM', 3),
(4, 'NESRINE', 'ACHOUR', 6),
(5, 'HANEN', 'NAIMA', 3);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `codemat` int(11) NOT NULL,
  `lib` varchar(25) NOT NULL,
  `vhs` int(11) NOT NULL,
  `coef` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`codemat`, `lib`, `vhs`, `coef`) VALUES
(1, 'POO', 20, 2),
(2, 'SGBD', 15, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avoirabscence`
--
ALTER TABLE `avoirabscence`
  ADD PRIMARY KEY (`idabs`),
  ADD KEY `codee` (`codee`),
  ADD KEY `codemat` (`codemat`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`codee`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`codemat`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoirabscence`
--
ALTER TABLE `avoirabscence`
  ADD CONSTRAINT `codee` FOREIGN KEY (`codee`) REFERENCES `etudiant` (`codee`),
  ADD CONSTRAINT `codemat` FOREIGN KEY (`codemat`) REFERENCES `matiere` (`codemat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
