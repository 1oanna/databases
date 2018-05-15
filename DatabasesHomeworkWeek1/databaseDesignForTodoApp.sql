
--
-- Database: `todo`
--

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` int(11) PRIMARY KEY AUTOINCREMENT NOT NULL ,
  `uid` varchar(36) NOT NULL,
  `task` text DEFAULT NULL,
  `tags` text DEFAULT NULL COMMENT 'comma delimited tags',
  `done` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `uid`, `task`, `tags`, `done`) VALUES
(1, 'a984cbd7-5785-11e8-9f30-18a90520e2e7', 'sample task 1', 'homework, test tag', 0),
(2, 'a984cbd7-5785-11e8-9f30-18a90520e2e7', 'test task 2', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` varchar(36) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`) VALUES
('a984cbd7-5785-11e8-9f30-18a90520e2e7', 'demo user');


