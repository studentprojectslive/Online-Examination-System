-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2022 at 02:07 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineexamination`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `certificateid` int(10) NOT NULL,
  `examid` int(11) NOT NULL,
  `scoredmarks` float(10,2) NOT NULL,
  `result` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseid` int(10) NOT NULL,
  `coursename` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseid`, `coursename`, `description`, `status`) VALUES
(1, BCA, Computer Application, Enabled),
(16, MCA, Master Of Computer Application, Enabled),
(24, BE, Engineering, Enabled),
(30, BSC, Science, Enabled),
(32, MSC, Science, Enabled),
(33, BBM, Business Management, Enabled),
(35, MBA, Master Of Business Administration, Enabled);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `examid` int(10) NOT NULL,
  `regno` int(10) NOT NULL,
  `subjectcode` varchar(25) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`examid`, `regno`, `subjectcode`, `datetime`, `status`) VALUES
(20, 2014111, BCA201, 2014-03-18 12:00:00, Enabled),
(23, 2014400, BCA203, 2014-03-22 12:59:00, Enabled),
(27, 2014126, BCA202, 2014-03-27 12:00:00, Enabled),
(28, 2014134, BCA202, 2014-03-26 12:00:00, Select),
(32, 1001, BBM-BIZLAW, 2020-06-27 07:21:00, Enabled),
(33, 7894566, BBM-BIZLAW, 2020-06-27 07:21:00, Enabled),
(34, 1001, BBM-BIZLAW, 2020-06-28 01:00:00, Enabled),
(38, 1001, BBM-ECONOMICS, 2020-06-28 13:00:00, Enabled),
(39, 7894566, BBM-ECONOMICS, 2020-06-28 13:00:00, Enabled);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `queid` int(10) NOT NULL,
  `subjectcode` varchar(15) NOT NULL,
  `question` text NOT NULL,
  `uploads` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `answer` int(5) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`queid`, `subjectcode`, `question`, `uploads`, `option1`, `option2`, `option3`, `option4`, `answer`, `description`, `status`) VALUES
(14, 1,  BCA stands for, 1381766034_compass.png, Bachelor of computer application, Bachelor of computer apply, Bachelor of compas application, Bachelor of comp application, 1, test desc, Enabled),
(15, 1,  DS, 1381766034_compass.png, Data Store, Data Struct, Date Structure, Data Structure, 4, test desc, Enabled),
(16, BCA202, Php Means, 1381766034_compass.png, hyper table, Hyper text preprocessor, Hyper timet preprocessor, Hyper text processor, 2, test desc, Enabled),
(17, BCA202, SE Means, 1381766034_compass.png, Software enginearing, Soft enginearing, Software energy, Software engine, 1, test desc, Enabled),
(18, BCA202,  C is, 1381766034_compass.png, program, program language, program lang, program line, 2, test desc, Enabled),
(19, BCA202, C++ is, 1381766034_compass.png, object oriented, on oriented, object or, oral orient, 1, test desc, Enabled),
(20, BCA202, 1 Byte, 1381766034_compass.png, 8BIT, 4 BIT, 2 BIT, 4 .5BIT, 1, test desc, Enabled),
(21, BCA202, Airithmetic optr, 1381766034_compass.png, +, =, >, ?, 1, test desc, Enabled),
(22, BCA202, Relation operator, 1381766034_compass.png, +, -, *, <, 4, test desc, Enabled),
(23, BCA202, Asignment oprator, 1381766034_compass.png, -, =, +, %, 3, test desc, Enabled),
(24, BCA202, increment oprator, 1381766034_compass.png, ((, **, __, ++, 4, test desc, Enabled),
(25, BCA202, logical oprator, 1381766034_compass.png, #, &, @, *, 2, test desc, Enabled),
(26, BCA202, JVM, 1381766034_compass.png, java virtual  mail, java virtual  machine, jain virtual  mail, java virat  mail, 2, test desc, Enabled),
(27, BCA203, decimal represent, 1381766034_compass.png, 0-9, 0-1, 0-3, 0-4, 1, test desc, Enabled),
(28, BCA203, octal represent, 1381766034_compass.png, 0-1, 0-4, 0-8, 0-5, 3, test desc, Enabled),
(29, BCA203, single chr enclosed, 1381766034_compass.png, double quotes,  quotes, double , double quotes, 4, test desc, Enabled),
(30, BCA203, backslash char, 1381766034_compass.png, \\n, //, aa, <>, 1, test desc, Enabled),
(31, BCA203, kloc, 1381766034_compass.png, thousand lines of code, thousand lines of comma, thousand links of code, thousand linee of code, 1, test desc, Enabled),
(32, BCA203, CG means, 1381766034_compass.png, computer graph, computer gram, computer graphics, company graphics, 3, test desc, Enabled),
(33, BCA204, DM means, 1381766034_compass.png, data memory, data memo, data main, data maining, 4, test desc, Enabled),
(34, BCA204, TELNET means, 1381766034_compass.png, terminal network, term network, terminal net, terminal neting, 1, test desc, Enabled),
(35, BCA204, HTTP stands for, 1381766034_compass.png, hyper text transfer program, hyper text transfer protocol, hyper table transfer program, hyper text trans protocol, 2, test desc, Enabled),
(36, BCA205, Len means, 1381766034_compass.png,  a no of charcter in a string, returns a no of charcter , returns a no of charcter in a string, returns a no of char in a string, 3, test desc, Enabled),
(38, BCA205,  Expand XML, 1381766034_compass.png, extension markup lang, extensible markup lang, extensible mark lanuage, extensible markup lanuage, 4, test desc, Enabled),
(39, BCA205,  which is  first computer, 1381766034_compass.png, abacus, calculator, intel, mainframe, 1, test desc, Enabled),
(40, BCA205,  outputdevice, 1381766034_compass.png, printer, mouse, keyboard, joystick, 1, test desc, Enabled),
(41, BCA205,  Input device, 1381766034_compass.png, keyboard, omr, line printer, printer, 1, test desc, Enabled),
(42, BCA205, ROM, 1381766034_compass.png, read only memo, red only memo, read only memory, right only memory, 3, test desc, Enabled),
(43, BCA205,  CD means, 1381766034_compass.png, compact data, compact diary, computer disk, compact disk, 4, test desc, Enabled),
(44, BCA206, correct HTML tag for the largest heading, 1381766034_compass.png, <h1>\n, <head>, <html>, <h6>, 1, test desc, Enabled),
(45, BCA206, What is the correct HTML tag for inserting a line break, 1381766034_compass.png, <lb>, <br>, <break>, <b>, 2, test desc, Enabled),
(46, BCA206, Choose the correct HTML tag to make a text bold, 1381766034_compass.png, <bold>, <br>, <b>, <lb>, 3, test desc, Enabled),
(47, BCA206, What does CSS stand for, 1381766034_compass.png, Computer Stay Sheets, Companey Style Sheets, Computer Style Set, Computer Style Sheets, 4, test desc, Enabled),
(48, BCA206, TR means, 1381766034_compass.png, table row, table ram, table ro, tab row, 1, test desc, Enabled),
(49, BCA206, TH means, 1381766034_compass.png, table head, table headder, tab header, table harm, 2, test desc, Enabled),
(50, BCA207, TD means, 1381766034_compass.png, table data, tab description, table description, table drive, 3, test desc, Enabled),
(51, BCA206, TCP stands for, 1381766034_compass.png, transparent control protocol, transparent control program, transparent control proto, time control protocol, 1, test desc, Enabled),
(52, BCA205, IP stands for, 1381766034_compass.png, internet protocol, internet proto, inter protocol, internet programing, 4, test desc, Enabled),
(53, BCA205, OL is, 1381766034_compass.png, creating order line, creating order list, creating order link, creating odd list, 2, test desc, Enabled),
(54, BCA205, coaxial cable contain, 1381766034_compass.png, very thick, very strong, very thick copper wire, very strong copper wire, 3, test desc, Enabled),
(55, BCA205, which is heiarchical n\\w topology, 1381766034_compass.png, mesh, bus, tree, star, 3, test desc, Enabled),
(56, BCA205,  CGI, 1381766034_compass.png, common gateway, common gateway inter, common gateway interface, comma gateway interface, 3, test desc, Enabled),
(57, BCA206, GUI stands, 1381766034_compass.png, graphuser internet, graphical user internet, graph user interface, graphical user interface, 4, test desc, Enabled),
(58, BCA207,  MTP, 1381766034_compass.png, message transfer protocol, message transfer program, msg transfer protocol, message trans protocol, 1, test desc, Enabled),
(59, BCA207, ASP, 1381766034_compass.png, active side page, act side page, active set page, active server page, 4, test desc, Enabled),
(60, BCA207,  ecommerce means, 1381766034_compass.png, buying, buying and selling, buying goods, selling, 2, test desc, Enabled),
(61, BCA207, hub means, 1381766034_compass.png, left, right, cener, up, 3, test desc, Enabled),
(62, BCA207, IETF, 1381766034_compass.png, inter task force, internet task force, internet task fork, int task force, 2, test desc, Enabled),
(63, BCA207, Tdma stands for, 1381766034_compass.png, time division multiple access, track division multiple access, time division multti access, total division multiple access, 1, test desc, Enabled),
(64, BCA205, FDMA stands, 1381766034_compass.png, frequent division multiple access, frequency division mute access, frequency divide multiple access, frequency division multiple access, 4, test desc, Enabled),
(65, BCA205, VSAT stands, 1381766034_compass.png, very small apply term, very small apparture terminal, very small apparture term, very style apparture terminal, 2, test desc, Enabled),
(66, BCA207, php start symbol, 1381766034_compass.png, ?, *, %, $, 1, test desc, Enabled),
(67, BCA207, MAN stands for, 1381766034_compass.png, metro area net, metropolitian area network, metro area network, metropolitian area net, 4, test desc, Enabled),
(68, BCA207, 1 GB means, 1381766034_compass.png, 1020 bytes,  1024 bytes,  1014 bytes,  1021 bytes, 3, test desc, Enabled),
(69, BCA207, SAD means, 1381766034_compass.png, system and data, system and daigram, system and design, system and descrption, 3, test desc, Enabled),
(70, BCA206, Os, compass.png, operating program, operating system, operating , operating symbol, 2, test desc, Enabled),
(71, BCA205, E-mail, 424SUNIL.png, electronic mail, element mail, elect mail, echo mail, 1, test description, Enabled),
(72, BCA205, WAN, 15357SUNIL.png, WIDE aim network, WIDE area network, word aim network, wide areanetwork, 2, ewe, Enabled),
(73, BCA205, LAN, 25411SUNIL.png, local aim network, local aim netw, local area network, load aim network, 3, test desc, Enabled),
(74, BCA205, who is the father of computer?, 6241, einstien, charles babbage, newton, michel, 2, computer, Enabled),
(75, BCA205, DS, 28085SUNIL.png, DATA STAND, DATA STRUCTURE, DATA STORE, DATA STAR, 1, grgfgf, Enabled),
(76, BCA207, 1kb, 7783SUNIL.png, 1024kb, 1024mb, 1024b, 1024tb, 2, computer, Enabled),
(77, BCA207, 1mb, 1213, 1034mb, 1024kb, 1024gb, 1111mb, 2, , Select),
(78, BCA205, DES, 8308, Data electornic standard, Data electornic stand, Data elect standard, Data electornic store, 1, , Select),
(79, BCA205, RAM means, 13233SUNIL.png, random aim memory, random aim memo, random acess memory, randomly aim memory, 3, no hints, Enabled),
(80, BCA205, strcat(), 18915SUNIL.png, concatenate two string, concatenate  string, compare two string, concatenate two signs, 1, computer, Enabled),
(81, BCA205, null means, 28843SUNIL.png, 0, 1, 2, 3, 1, no, Enabled),
(82, BCA205, www stands, 1972SUNIL.png, world wide web, world web, world wide wonder, world wide work, 1, no hints, Enabled),
(83, BCA207, URL means, 1874SUNIL.png, uniform resource location, uniform resource line, unicast resource location, uniform rest location, 1, des, Enabled),
(84, BCA206, printf means, 3289SUNIL.png, inputing values, insert, delete, update, 1, des, Enabled),
(85, BCA207, c stand for?, 25983SUNIL.png, computer, comp, co, puter, 1, currect, Enabled),
(86, BCA207, expand atm, 7573SUNIL.png, automatic t m, automatic teller machine, a tell, asynchronus tell ma, 2, des, Enabled),
(87, BCA207, fit stands for, 31030SUNIL.png, fundamental inform technology, fundamental information technology, fund information technology, fundamental information tech, 2, des, Enabled),
(88, BCA205, AI stands for, 32273SUNIL.png, airtel idea, artifical intel, airtech intel, artifical inteligence, 4, des, Enabled),
(89, BCA205, DD stand for, 1399SUNIL.png, data dictionary, data date,  data derive, data, 3, des, Enabled),
(90, BCA207, DBMS stands for, 27213SUNIL.png, database mananagement software, database mailsoftware, database mananagement system, data mananagement software, 3, des, Enabled),
(91, BCA205, SMTP, 23632SUNIL.png, system mail transfer progam, simple mail transfer program, simple mail transfer protocol, simple mail transfer program, 3, desc, Enabled),
(92, BCA207, FTP, 4942Koala.jpg, File tata protocol, File transfer protocol, File trans protocol, Fire transfer protocol, 2, desc, Enabled),
(93, BCA204, What IS SCM, 28028Desert.jpg, supply car , Supply management, Supply chain management, Supply card management, 3, desc, Enabled),
(94, BCA207, B2C, 5722Hydrangeas.jpg, Business to Customer, Business to casheier, Business to commands, Business to contact, 1, descr, Enabled),
(95, BCA204, B2B MEANS, 25960Chrysanthemum.jpg, Bus to bus, Business to business, buyer to busines, busines to buyer, 2, desc, Enabled),
(96, BCA207, what is cipher text, 15910Lighthouse.jpg, send msg, Secret text, screen, picture, 2, des, Enabled),
(97, BCA207, Define EDI, 189Jellyfish.jpg, elecronic data ink, elecronic dynamic incharge, elecronic data incharge, elecronic data ink, 3, desc, Enabled),
(98, BCA207, EC stands for, 32275Jellyfish.jpg, Electronic comma, Electronic commerce, Electronic camera, Elect comman, 2, desc, Enabled),
(99, BCA205, DB stands for, 14921Koala.jpg, Distrubuted since, Data Bar , Data Base, Data bind, 3, desc, Disabled),
(100, BCA207, DC stands for, 21907Desert.jpg, Distrubuted computer, Distrubuted compas, Direct computer, Distd computer, 1, test desc, Enabled),
(101, BBM-BIZLAW, how to biz, 1530058051Database Schema Diagram.png, ab, ac, an, a, 2, a, Enabled),
(102, BBM-BIZLAW, How business law, 424350715Chrysanthemum.jpg, rent, ab, raan, ken, 3, hello, Enabled),
(103, BBM-ECONOMICS, cccv, , sd, vb, sd, we, 3, fg, Enabled),
(104, BBM-ECONOMICS, Have questions?, , Feel , free, rite to us, Paytmmall.com/care, 3, , Enabled);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `resultid` int(10) NOT NULL,
  `examid` int(11) NOT NULL,
  `queid` int(11) NOT NULL,
  `answerid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`resultid`, `examid`, `queid`, `answerid`) VALUES
(497, 33, 101, 2),
(498, 33, 102, 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `regno` int(10) NOT NULL,
  `password` varchar(25) NOT NULL,
  `courseid` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `contactnumber` varchar(20) NOT NULL,
  `createdat` date NOT NULL,
  `lastlogin` datetime NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`regno`, `password`, `courseid`, `name`, `dob`, `address`, `contactnumber`, `createdat`, `lastlogin`, `status`) VALUES
(1001, 123456789, 33, Anand, 1982-06-04, 3rd floor, 789456123, 2020-06-27, 2022-08-17 01:54:08, Enabled),
(2014111, 456, 1, mayur, 1993-12-30, Bangalore, 789456123, 0000-00-00, 2014-03-17 04:14:45, Enabled),
(2014115, 123, 30, haspiya, 1992-03-04, mangalore, 1234578900, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(2014123, 122111, 1, sabeeda, 1993-03-20, udupi, 134567658, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(2014126, technology, 1, Jack, 1994-12-31, melkar, 9876543210, 2014-03-05, 2014-03-17 03:54:56, Enabled),
(2014128, 11, 1, arun, 1992-12-30, mumbai, 7894561230, 0000-00-00, 2014-03-14 04:06:55, Enabled),
(2014134, hhg, 16, preethi, 1992-03-10, sajipa, 912123456, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(2014232, 123, 16, johnson, 1993-03-14, bantwal, 923345555, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(2014305, 111111, 1, ayan, 1992-12-31, puttur, 9876543210, 2014-03-05, 0000-00-00 00:00:00, Enabled),
(2014400, 123, 24, anson, 1993-03-05, modankap, 987654321, 0000-00-00, 2014-03-14 05:08:20, Enabled),
(2014456, 123, 1, jahfar, 1991-01-09, mangalore, 7894561230, 2014-01-01, 2014-03-05 07:39:01, Enabled),
(2014458, 123, 1, harshiya, 1993-03-24, mangalore, 945678900, 0000-00-00, 2014-03-14 05:20:50, Enabled),
(2014472, technology, 30, haziq, 1994-12-31, udupi, 9876543210, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(7894566, q1w2e3r4, 33, Ganesh kumar S, 2005-05-26, 3rd floor, 7894561233, 0000-00-00, 2020-06-27 01:32:57, Enabled);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subjectcode` varchar(25) NOT NULL,
  `courseid` int(11) NOT NULL,
  `subjectname` varchar(25) NOT NULL,
  `rules` text NOT NULL,
  `totalmarks` int(10) NOT NULL,
  `passmarks` float(10,2) NOT NULL,
  `examduration` int(10) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subjectcode`, `courseid`, `subjectname`, `rules`, `totalmarks`, `passmarks`, `examduration`, `status`) VALUES
(BBM-BIZLAW, 33, Business Law, Commercial law or business law is the body of law which governs business and commerce and is often considered to be a branch of civil law and deals both with issues of private law and public law. Commercial law regulates corporate contracts, hiring practices, and the manufacture and sales of consumer goods., 25, 10.00, 2, Enabled),
(BBM-ECONOMICS, 33, Economics, Economics is the social science that studies the production, distribution, and consumption of goods and services. Economics focuses on the behaviour and interactions of economic agents and how economies work., 25, 10.00, 2, Enabled),
(BBM-Finance, 33, Finance, Finance is a term for matters regarding the management, creation, and study of money and investments. Specifically, it deals with the questions of how and why an individual, company or government acquires the money needed - called capital in the company context - and how they spend or invest that money, 25, 10.00, 30, Enabled),
(BCA201, 30, Data Structure, no, 100, 35.00, 60, Enabled),
(BCA202, 1, Software Programming, test subject, 100, 35.00, 60, Enabled),
(BCA203, 1, Computer science, this subject related to computers, 100, 35.00, 120, Enabled),
(BCA204, 18, Distributed Computer, hello test page, 100, 35.00, 80, Enabled),
(BCA205, 23, Data Structure, Time Limit, 100, 35.00, 120, Enabled),
(BCA207, 12, E-Commerce, hello world, 123, 35.00, 120, Enabled);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(10) NOT NULL,
  `courseid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `designation` varchar(25) NOT NULL,
  `usertype` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdat` date NOT NULL,
  `lastlogin` datetime NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `courseid`, `name`, `designation`, `usertype`, `username`, `password`, `createdat`, `lastlogin`, `status`) VALUES
(7, 0, Shiva, maths, Administrator, admin, admin, 2013-12-13, 2022-08-17 01:51:34, Enabled),
(15, 18, ayan, lecture, Examiner, examiner, 12345, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(16, 3, Mahesk, develoepr, Administrator, mah, 12345, 2014-01-10, 0000-00-00 00:00:00, Enabled),
(21, 1, siraj, computer science, Administrator, Nikat, odd, 2014-03-11, 0000-00-00 00:00:00, Enabled),
(25, 1, shiva, computer science, Administrator, shiva, shiva, 2014-03-11, 0000-00-00 00:00:00, Enabled),
(28, 16, maruthi, computer science, Administrator, raj, 123, 2014-03-13, 0000-00-00 00:00:00, Enabled),
(29, 35, Raj kundra, HOD, Examiner, rajkundra, 123456789, 2020-06-26, 0000-00-00 00:00:00, Enabled),
(30, 24, Mallika, HOD, Examiner, mallika, 123456789, 2020-06-26, 0000-00-00 00:00:00, Enabled),
(31, 33, ankith kuamr, Advisor, Examiner, ankith, 123456789, 2020-06-26, 0000-00-00 00:00:00, Enabled),
(32, 35, Anjali, HOD, Examiner, anjali, 123456789, 2020-06-26, 0000-00-00 00:00:00, Enabled),
(33, 16, Anusuya, HOD, Examiner, anusuya, 123456789, 2020-06-26, 0000-00-00 00:00:00, Enabled),
(34, 24, Athmanand kumar, HOD, Examiner, athmanand, 123456789, 0000-00-00, 0000-00-00 00:00:00, Enabled),
(35, 1, Veeksha, HOD, Examiner, veeksha, veekshaveekshaveeksha, 2022-08-17, 2022-08-17 01:53:19, Enabled);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificateid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`examid`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`queid`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`resultid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`regno`),
  ADD UNIQUE KEY `regno` (`regno`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subjectcode`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `certificateid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `examid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `queid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `resultid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
