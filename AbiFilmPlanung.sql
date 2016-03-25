-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 20. Mrz 2016 um 04:59
-- Server-Version: 10.1.10-MariaDB
-- PHP-Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `AbiFilmPlanung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `connector_schauspieler_takes`
--

CREATE TABLE `connector_schauspieler_takes` (
  `id` int(11) NOT NULL,
  `id_take` int(11) NOT NULL,
  `id_schauspieler` int(11) NOT NULL,
  `schauspieler_anweisung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `connector_schauspieler_takes`
--

INSERT INTO `connector_schauspieler_takes` (`id`, `id_take`, `id_schauspieler`, `schauspieler_anweisung`) VALUES
(1, 101, 6, 'Sonnenbrille, aufreizend'),
(2, 102, 6, ''),
(3, 201, 6, ''),
(4, 201, 11, 'edel gekleidet'),
(5, 201, 12, 'edel gekleidet'),
(6, 301, 6, 'Sonnenbrille Handtasche, im Auto, andere Kleidung als in Szene 1'),
(7, 302, 6, 'Sonnenbrille Handtasche, im Auto, andere Kleidung als in Szene 1'),
(8, 303, 6, ''),
(9, 303, 4, ''),
(10, 401, 6, ''),
(11, 401, 9, 'altmodisch gekleidet'),
(12, 501, 6, 'Sonnenbrille und Tasche'),
(13, 501, 13, 'Bläser, vornehm'),
(14, 501, 36, 'normale Schulkleidung, ca 10-20'),
(15, 601, 6, ''),
(16, 601, 14, 'Arztkostüm'),
(17, 701, 6, ''),
(18, 701, 13, 'normale Schülerkleidung'),
(19, 701, 36, 'normale Kleidung, ca. 10-20'),
(20, 801, 6, ''),
(21, 801, 26, ''),
(22, 901, 6, 'Strandmode'),
(23, 901, 4, 'Fahrrad mit Anfängerhelm'),
(24, 901, 36, 'Sommerkleidung und Autos mitbringen, ca 10-15'),
(25, 1001, 4, ''),
(26, 1001, 26, ''),
(27, 1101, 6, ''),
(28, 1103, 6, ''),
(29, 1103, 16, ''),
(30, 1103, 15, ''),
(31, 1103, 36, 'ca. 10-20 Schüler'),
(32, 1104, 6, ''),
(33, 1105, 6, ''),
(34, 1106, 6, 'mit Sonnenbrille'),
(35, 1107, 36, ''),
(36, 1107, 6, ''),
(37, 1201, 26, ''),
(38, 1201, 27, ''),
(39, 1201, 10, ''),
(40, 1202, 26, ''),
(41, 1301, 1, ''),
(42, 1302, 1, ''),
(43, 1302, 36, 'ca. 10-20 Schüler'),
(44, 1401, 5, ''),
(45, 1402, 5, ''),
(46, 1402, 24, 'überlegen wie Villa Szene gemacht wird'),
(47, 1403, 5, ''),
(48, 1403, 17, 'Makeup'),
(49, 1403, 24, 'überlegen Bühnenshow, Bühnenmodell'),
(50, 1404, 24, 'überlegen Bühnenshow, Bühnenmodell'),
(51, 1404, 17, ''),
(52, 1406, 36, 'ca. 10-20 Schüler'),
(53, 1408, 24, ''),
(54, 1408, 18, ''),
(55, 1405, 5, ''),
(56, 1501, 6, ''),
(57, 1501, 9, ''),
(58, 1601, 6, ''),
(59, 1601, 36, 'ca. 10-20 Schüler'),
(60, 1602, 6, ''),
(61, 1602, 36, 'ca. 10-20 Schüler'),
(62, 1701, 6, ''),
(63, 1701, 13, ''),
(64, 1701, 36, 'ca. 10-20 Schüler'),
(65, 1702, 6, ''),
(66, 1703, 6, ''),
(67, 1703, 36, 'ca. 10-20 Schüler'),
(68, 1703, 13, 'nur anwesend'),
(69, 1703, 35, ''),
(70, 1801, 2, 'militärkleidung'),
(71, 1801, 36, 'Sportkleidung'),
(72, 1901, 6, 'förmlich, geschäftlich'),
(73, 1901, 19, 'Anzug'),
(74, 2001, 3, ''),
(75, 2001, 20, ''),
(76, 2101, 6, ''),
(77, 2101, 7, 'alter Sportanzug'),
(78, 2101, 36, 'Sportkleidung'),
(79, 2201, 36, 'ca. 30-50 Schüler'),
(80, 2301, 36, 'wirklich ALLE Mitwirkenden'),
(81, 2301, 26, ''),
(82, 2301, 4, ''),
(83, 2304, 27, 'mit Sakko'),
(85, 2302, 21, 'Polizeiuniform'),
(86, 2302, 20, 'normal'),
(87, 2303, 20, ''),
(88, 2303, 21, 'Polizeiuniform'),
(89, 2305, 6, 'Sonnenbrille'),
(90, 2306, 14, 'Artztkostüm'),
(91, 2303, 8, ''),
(92, 1701, 28, ''),
(93, 1701, 29, ''),
(94, 1703, 30, ''),
(95, 1801, 31, ''),
(96, 2101, 32, ''),
(97, 2101, 33, ''),
(98, 2101, 34, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schauspieler`
--

CREATE TABLE `schauspieler` (
  `id` int(11) NOT NULL,
  `abkuerzung` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `schauspieler`
--

INSERT INTO `schauspieler` (`id`, `abkuerzung`, `name`) VALUES
(0, '', ''),
(1, 'HRE', 'Herr Essmueller'),
(2, 'FRKULL', 'Table Maggiore'),
(3, 'HRB', 'Herr Buerger'),
(4, 'FRA', 'Frau Armbruster'),
(5, 'HRS', 'Herr Schwind'),
(6, 'FRK', 'Cynthia'),
(7, 'HRD', 'Herr Denfeld'),
(8, 'HRM', 'Herr Mueller'),
(9, 'FRROE', 'Anna Donauer'),
(10, 'FRR', 'Frau Rock'),
(11, 'VL', 'Julian'),
(12, 'SM', 'Verena'),
(13, 'STR', 'Marleen'),
(14, 'CHI', 'Mattis'),
(15, 'VS', 'Jakob'),
(16, 'MS', 'Katharina'),
(17, 'GAGA', 'Roman'),
(18, 'BUTL', 'Mika'),
(19, 'AAS', 'Yves'),
(20, 'LO', 'Lucas'),
(21, 'POL', 'Mathias'),
(22, 'TEK_ton', 'Mika'),
(23, 'TEK_cam', 'Jojo'),
(24, 'TEK_blend', 'Timo'),
(25, 'Main_Director', 'Julian'),
(26, 'FRF', 'Frau Frankenstein'),
(27, 'SI', 'Nicolaj'),
(28, 'S1', 'Arne'),
(29, 'S2', 'Hanna'),
(30, 'S3', 'Anne'),
(31, 'S4', 'Anna Kapper'),
(32, 'S5', 'Kai'),
(33, 'S6', 'Juri'),
(34, 'S7', 'Elena'),
(35, 'THAI', 'Thai'),
(36, 'STAT', 'Satisten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `szene`
--

CREATE TABLE `szene` (
  `id` int(11) NOT NULL,
  `beschreibung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `szene`
--

INSERT INTO `szene` (`id`, `beschreibung`) VALUES
(1, 'FRK rueckwaerts mit auto vom schulgelaende , kommt zu hause an.'),
(2, 'FRK, VL und SM unterhaltung'),
(3, 'FRK kommt am lehrerparkplattz an und unterhaelt sich mit FRA'),
(4, 'FRK, FRROE essen in mensa.'),
(5, 'FRK erster Unterricht'),
(6, 'Schounheitsklinik.'),
(7, 'FRK erfaert von autowschaktion'),
(8, 'FRK redet mit FRF.'),
(9, 'Autowaschaktion.'),
(10, 'Schuelertoilette FRF und FRK.'),
(11, 'Elternabend + zusammenschnitt.'),
(12, 'Der Schulinspector kommt'),
(13, 'essmueller erfaert vom bonus.'),
(14, 'Herr schwind erfaert vom Bonus.'),
(15, 'FRK und freu roedle fahren im auto FRK erfaehr vom Bonus.'),
(16, 'FRA erfaehrt vom Bonus.'),
(17, 'FRK strengt sich an guten Unterrricht zu machen.'),
(18, 'Frau kullmann feuert ihren kurs zu besseren leistungen an.'),
(19, 'Frau Ketterer trifft den abituraufgabensteller.'),
(20, 'HRB und LU hacken den landesserver un haenfgen afd plakate auf.'),
(21, 'FRK praegt ihren schuelern in der Sporthalle die loesungen ein. Bekommt besuch von Dehnfeld.'),
(22, 'Tag des Abiturs.'),
(23, 'Riesen Endszene. Verkuendung des gewinnders des bonusses. \r\nUnterhaltung FRF und SI.\r\nVerhaftung LO.\r\n');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `takes`
--

CREATE TABLE `takes` (
  `id` int(11) NOT NULL,
  `beschreibung` text NOT NULL,
  `id_scene` int(11) NOT NULL,
  `datum` date NOT NULL,
  `uhrzeit` time NOT NULL,
  `ort` text NOT NULL,
  `orts_austattung` text NOT NULL,
  `dauer` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `takes`
--

INSERT INTO `takes` (`id`, `beschreibung`, `id_scene`, `datum`, `uhrzeit`, `ort`, `orts_austattung`, `dauer`) VALUES
(101, 'Cynthia fährt mit slk (mercedes) vom Lehrerparkplatz.', 1, '2016-04-18', '15:45:00', 'THG_parkplatz', 'slk (mercedes)\r\n"HERS" nummernschuld\r\nKiste mit schulsachen', '01:00:00'),
(102, 'Cynthia fährt mit slk in Carport.', 1, '2016-04-18', '17:00:00', 'haus julian', 'SLK, Carport', '00:30:00'),
(103, 'Backdrop Auto für Szene 1', 1, '2016-04-16', '11:00:00', 'THG_parkplatz', 'Auto', '00:30:00'),
(201, 'FRK wird von VL und SM raus geworfen', 2, '2016-04-23', '15:00:00', 'haus anna', 'luxus Wohnzimmer', '02:00:00'),
(301, 'FRK fährt auf parkplatz', 3, '2016-04-23', '17:30:00', 'THG_parkplatz', 'Cynthias Auto', '00:20:00'),
(302, 'FRK läuft frustriert durch Gang', 3, '2016-04-23', '18:00:00', 'THG_gaenge', '', '00:20:00'),
(303, 'FRK trifft auf FRA', 3, '2016-04-30', '15:00:00', 'THG_klassenzimmer', 'Äpfel auf jedem Tisch. Auf jedem Tisch ein Atlas.', '01:00:00'),
(401, 'FRK und FROE essen zusammen', 4, '2016-04-30', '10:00:00', 'THG_mensa', 'Essen', '00:20:00'),
(501, 'FRK erste Unterrichtsstunde. Spuckt Kekse aus.', 5, '2016-04-30', '10:30:00', 'THG_klassenzimmer', 'trist, leer', '00:30:00'),
(601, 'FRK unterhält sich mit CHI', 6, '2016-04-18', '18:00:00', 'haus julian', 'Transparent-Wand, Beamer, Tisch, iMac, Blumen', '01:00:00'),
(701, 'Schüler schauen Film, Gong, FRK unterhält sich mit STR', 7, '2016-04-30', '12:30:00', 'THG_klassenzimmer', 'Film laufend + Fernbedienung + Klatschmagazin', '00:20:00'),
(801, 'FRK und FRF unterhalten sich', 8, '2016-05-07', '11:00:00', 'THG_frankensteinbuero', '', '00:20:00'),
(901, 'Autowasch Aktion, Hausmeister fragen', 9, '2016-05-13', '15:00:00', 'THG_parkplatz', 'Autos, Wasser, Schaum, Schwämme, Schlauch, Schild', '03:00:00'),
(1001, 'FRA redet mit FRF', 10, '2016-04-30', '16:05:00', 'THG_klo', '', '00:20:00'),
(1101, 'Glas auf Tisch, wird mit Geld gefüllt (3x)\r\nFRK schreibt eine Rechnung.', 11, '2016-04-18', '20:00:00', 'haus julian', 'Tisch, Glas, viel Geld, Rechnung', '00:10:00'),
(1102, 'Zettel am Haupteingang', 11, '2016-04-18', '15:40:00', 'THG_haupteingang', 'Zettel: "Wilkommen Eltern"', '00:05:00'),
(1103, 'Elternabend', 11, '2016-04-30', '13:00:00', 'THG_klassenzimmer', 'tristes Klassenzimmer', '02:00:00'),
(1104, 'FRK klaut Fundsachen', 11, '2016-04-23', '18:30:00', 'THG_mensa', 'Fundsachenschrank', '00:15:00'),
(1105, 'FRK verkauft Fundsachen', 11, '0000-00-00', '00:00:00', 'secondhand Shop', 'Altkleider + Theke', '00:20:00'),
(1106, 'FRK klaut Pfandflaschen', 11, '2016-04-23', '18:45:00', 'THG_gaenge', 'Pfandflaschen (Säcke)', '00:20:00'),
(1107, 'Klasse schaut Film. FRK schläft auf Pult', 11, '2016-04-30', '12:15:00', 'THG_klassenzimmer', 'Film', '00:10:00'),
(1201, 'SI kommt and die Schule', 12, '2016-05-07', '10:15:00', 'THG_frankensteinbuero', '', '00:40:00'),
(1202, 'FRF mach Briefe in Fächer', 12, '2016-05-07', '10:00:00', 'THG_lehrerzimmer', 'Briefe', '00:10:00'),
(1301, 'HRE liest Brief', 13, '2016-05-07', '13:10:00', 'THG_klassenzimmer', '', '00:15:00'),
(1302, 'HRE beeinflusst Schueler', 13, '2016-05-07', '13:30:00', 'THG_klassenzimmer', '', '00:30:00'),
(1401, 'HRS liest Brief', 14, '2016-04-14', '11:00:00', 'THG_klassenzimmer', '', '00:15:00'),
(1402, 'HRS + Villa', 14, '2016-04-14', '10:00:00', 'buehnenraum', 'Greenscreen', '00:30:00'),
(1403, 'HRS redet mit Roman (Meth)', 14, '2016-04-14', '11:30:00', 'buehnenraum', 'Greenscreen, Buehne, Licht, Geschichtsbuch, Tüte mit Zucker', '00:30:00'),
(1404, 'Buehnenshow', 14, '2016-04-14', '12:00:00', 'buehnenraum', 'Buehne, Licht', '00:45:00'),
(1405, 'HRS mischt Meth in Getränke und schlägt Hände über Kopf zusammen', 14, '2016-04-14', '10:45:00', 'THG_klassenzimmer', 'Gläser, Zuckertüte', '00:10:00'),
(1406, 'Klasse drehen durch', 14, '2016-04-14', '13:30:00', 'THG_klassenzimmer', 'Papier, Golfschläger, Baseballschläger, werfbare Gegenstände', '00:20:00'),
(1407, 'Backdrop Fenster', 14, '2016-04-14', '13:00:00', 'THG_klassenzimmer', 'Klassenzimmer neben dem Computerraum', '00:20:00'),
(1408, 'Schüler aus dem Fenster', 14, '2016-04-18', '20:30:00', 'haus julian', 'Greenscreen', '00:20:00'),
(1501, 'FRK und FRROE erfährt im Auto vom Bonus', 15, '2016-05-13', '20:00:00', 'THG_parkplatz', 'Cynthias Auto, Kammera auf Motorhaube', '00:30:00'),
(1601, 'FRA liest Brief im Klassenzimmer', 16, '2016-04-30', '17:00:00', 'THG_klassenzimmer', 'Brief', '00:15:00'),
(1602, 'FRA redet mit Schuelern', 16, '2016-04-30', '16:30:00', 'THG_klassenzimmer', 'Bücher etc.', '00:20:00'),
(1701, 'FRK macht disziplinierten Unterricht', 17, '2016-04-30', '11:30:00', 'THG_klassenzimmer', 'Blätter, Agnes', '00:40:00'),
(1702, 'FRK korrigiert die Tests', 17, '2016-05-07', '11:30:00', 'THG_klassenzimmer', 'Tests, Rotstift', '00:20:00'),
(1703, 'FRK gibt Test zurück', 17, '2016-04-30', '11:00:00', 'THG_klassenzimmer', 'Tests (oder Blätter), stark Buch', '00:30:00'),
(1801, 'FRKULL mit Sportkurs im Käfig', 18, '2016-04-16', '12:00:00', 'THG_sportkaefig', 'Peitsch, Pfeife', '00:40:00'),
(1901, 'FRK holt sich Lösungen bei AAS', 19, '2016-05-07', '12:00:00', 'THG_karaschbuero', 'Weingläser, Weinflasche, Keycard, Schlafmittel', '01:00:00'),
(2001, 'HRB und LO hacken', 20, '2016-04-16', '14:00:00', 'THG_computerraum', '', '00:20:00'),
(2101, 'FRK prägt Schülern Lösungen ein, HRD unterbricht', 21, '0000-00-00', '17:00:00', 'THG_turnhalle', 'Bälle, Ballwagen, Lösungen', '01:00:00'),
(2201, 'Tag des Abiturs', 22, '2016-04-06', '13:15:00', 'THG_turnhalle', 'Abiprüfung in der Turnhalle', '00:20:00'),
(2301, 'FRF gibt Gewinner bekannt', 23, '2016-05-27', '16:00:00', 'THG_aula', 'Buehne, Rednerpult. UMschlag mit Ergebnissen', '00:30:00'),
(2302, 'LO wird verhaftet', 23, '2016-05-27', '17:00:00', 'THG_aula', 'wie bei Take 2301', '00:10:00'),
(2303, 'LO in Zelle mit HRM', 23, '2016-04-15', '11:00:00', 'buehnenraum', 'Greenscreen, Bank', '00:30:00'),
(2304, 'FRF spricht mit SI', 23, '2016-05-27', '16:45:00', 'THG_aula', '', '00:10:00'),
(2305, 'FRK telefoniert mit CHI', 23, '2016-05-27', '17:20:00', 'THG_aula', 'Handy', '00:10:00'),
(2306, 'CHI nimmt Telefon ab', 23, '2016-04-18', '18:30:00', 'haus julian', 'siehe Take 601', '00:10:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `connector_schauspieler_takes`
--
ALTER TABLE `connector_schauspieler_takes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `schauspieler`
--
ALTER TABLE `schauspieler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `szene`
--
ALTER TABLE `szene`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
