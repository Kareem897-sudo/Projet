-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 26 oct. 2020 à 17:56
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFDD316867B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `slug`, `contenu`, `created_at`, `updated_at`, `users_id`) VALUES
(3, 'fdfdfd', 'fdffd', 'fdfddf', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22),
(5, 'fdfdfd', 'dffdfd', 'dffdfd', '2015-01-01 00:00:00', '2015-01-01 00:00:00', 20);

-- --------------------------------------------------------

--
-- Structure de la table `articles_categories`
--

DROP TABLE IF EXISTS `articles_categories`;
CREATE TABLE IF NOT EXISTS `articles_categories` (
  `articles_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`articles_id`,`categories_id`),
  KEY `IDX_DE004A0E1EBAF6CC` (`articles_id`),
  KEY `IDX_DE004A0EA21214B7` (`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles_categories`
--

INSERT INTO `articles_categories` (`articles_id`, `categories_id`) VALUES
(5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `articles_mots_cles`
--

DROP TABLE IF EXISTS `articles_mots_cles`;
CREATE TABLE IF NOT EXISTS `articles_mots_cles` (
  `articles_id` int(11) NOT NULL,
  `mots_cles_id` int(11) NOT NULL,
  PRIMARY KEY (`articles_id`,`mots_cles_id`),
  KEY `IDX_2927AB461EBAF6CC` (`articles_id`),
  KEY `IDX_2927AB46C0BE80DB` (`mots_cles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `slug`) VALUES
(1, 'Comédie', ''),
(2, 'Drame', ''),
(3, 'Action', ''),
(4, 'Western', ''),
(5, 'Historique', ''),
(6, 'Thriller', ''),
(7, 'Fantastique', ''),
(8, 'Thriller', ''),
(9, 'Fantastique', ''),
(10, 'Thriller', ''),
(11, 'Fantastique', '');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rgpd` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9BEC0C41EBAF6CC` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200804185444', '2020-08-04 18:54:54', 1160),
('DoctrineMigrations\\Version20200910080031', '2020-09-10 08:00:39', 680),
('DoctrineMigrations\\Version20200910094703', '2020-09-10 09:47:13', 831),
('DoctrineMigrations\\Version20201013124956', '2020-10-13 12:50:10', 790),
('DoctrineMigrations\\Version20201013130918', '2020-10-13 13:09:22', 62),
('DoctrineMigrations\\Version20201013132213', '2020-10-13 13:22:22', 77),
('DoctrineMigrations\\Version20201013133540', '2020-10-13 13:35:49', 186),
('DoctrineMigrations\\Version20201013133946', '2020-10-13 13:39:53', 190),
('DoctrineMigrations\\Version20201013134222', '2020-10-13 13:42:30', 215),
('DoctrineMigrations\\Version20201021174902', '2020-10-21 17:49:12', 491),
('DoctrineMigrations\\Version20201022092038', '2020-10-22 09:20:46', 777),
('DoctrineMigrations\\Version20201022094117', '2020-10-22 09:41:25', 73),
('DoctrineMigrations\\Version20201022094345', '2020-10-22 09:44:02', 69),
('DoctrineMigrations\\Version20201022094544', '2020-10-22 09:45:48', 71),
('DoctrineMigrations\\Version20201022095031', '2020-10-22 09:50:37', 71),
('DoctrineMigrations\\Version20201022095742', '2020-10-22 09:57:47', 165),
('DoctrineMigrations\\Version20201022100156', '2020-10-22 10:02:00', 159),
('DoctrineMigrations\\Version20201022100550', '2020-10-22 10:05:59', 478),
('DoctrineMigrations\\Version20201022132428', '2020-10-22 13:24:36', 296),
('DoctrineMigrations\\Version20201022143949', '2020-10-22 14:39:53', 49);

-- --------------------------------------------------------

--
-- Structure de la table `mots_cles`
--

DROP TABLE IF EXISTS `mots_cles`;
CREATE TABLE IF NOT EXISTS `mots_cles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot_cle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `nom`, `prenom`, `telephone`, `roles`, `password`, `reset_token`) VALUES
(10, 'kareemferrah06@gmail.com', 'Ferrah', 'Kareem', '0760935250', '{\"1\": \"ROLE_USER\", \"2\": \"ROLE_ADMIN\"}', '$2y$13$1T0IiDaLxlVjUb815fY6IeaWesqI9OkNLlr2GFMf5sS3u02vSpxKC', NULL),
(20, 'jeandupont@hotmail.com', 'Dupont', 'Jean', '0651414189', '[\"ROLE_ADMIN\"]', '$2y$13$WCzDBFVFZFGCcTNtFr9AA.sCwb17CWBS2A0487JzAskZIGkL5ip2O', NULL),
(21, 'ilan@gmail.com', 'Ferrah', 'Ilan', '0621315878', '[\"ROLE_EDITOR\"]', '$2y$13$AMNoY63H29vDlxz5RjCCf.kEGIpjN09mA.7lKp83Irv1r/LW7bbky', NULL),
(22, 'jeanpikar@gmail.com', 'Pikar', 'Jean', '0741365896', '[\"ROLE_ADMIN\"]', '$2y$13$QntvTVhWjtTzymiN/DTgrO5UzrAs7ez9eg05BldTXRspt5cBcu9Pe', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `FK_BFDD316867B3B43D` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `articles_categories`
--
ALTER TABLE `articles_categories`
  ADD CONSTRAINT `FK_DE004A0E1EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DE004A0EA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `articles_mots_cles`
--
ALTER TABLE `articles_mots_cles`
  ADD CONSTRAINT `FK_2927AB461EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2927AB46C0BE80DB` FOREIGN KEY (`mots_cles_id`) REFERENCES `mots_cles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `FK_D9BEC0C41EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
