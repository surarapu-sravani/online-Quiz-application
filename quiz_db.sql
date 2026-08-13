-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2026 at 05:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `option1` varchar(100) DEFAULT NULL,
  `option2` varchar(100) DEFAULT NULL,
  `option3` varchar(100) DEFAULT NULL,
  `option4` varchar(100) DEFAULT NULL,
  `correct_option` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_option`) VALUES
(7, 'What is the output of print(type([]))?', '<class \'list\'>', '<class \'tuple\'>', '<class \'dict\'>', '<class \'set\'>', 1),
(8, 'Which of the following is mutable?', 'tuple', 'list', 'string', 'int', 2),
(9, 'What does the // operator do in Python?', 'Division', 'Modulus', 'Floor division', 'Exponentiation', 3),
(10, 'Which keyword is used to create a generator?', 'yield', 'return', 'generate', 'gen', 1),
(11, 'What will len({1,2,2,3}) return?', '2', '3', '4', 'Error', 2),
(12, 'Which method is used to add an element to a set?', 'append()', 'add()', 'insert()', 'push()', 2),
(13, 'What is the output of print(2 ** 3 ** 2)?', '64', '512', '16', '256', 2),
(14, 'Which function converts a string to an integer?', 'str()', 'float()', 'int()', 'eval()', 3),
(15, 'What will be the output of bool(0)?', 'True', 'False', 'None', 'Error', 2),
(16, 'Which data type does the function range() return?', 'list', 'tuple', 'range', 'set', 3),
(17, 'What is the correct way to open a file for writing?', 'open(\"a.txt\")', 'open(\"a.txt\",\"r\")', 'open(\"a.txt\",\"w\")', 'open(\"a.txt\",\"rw\")', 3),
(18, 'Which of these is used to handle exceptions?', 'if-else', 'try-except', 'for loop', 'switch', 2),
(19, 'What is the output of \"python\"[::-1]?', 'python', 'nohtyp', 'Error', 'None', 2),
(20, 'Which operator is used for membership testing?', '&', 'in', 'is', '==', 2),
(21, 'Which keyword is used to define a function?', 'function', 'def', 'fun', 'define', 2),
(22, 'What will type(None) return?', '<class \'NoneType\'>', '<class \'null\'>', '<class \'void\'>', '<class \'empty\'>', 1),
(23, 'Which of the following creates a tuple?', '[1,2]', '(1,2)', '{1,2}', '{1:2}', 2),
(24, 'What is the output of print(5 % 2)?', '2', '2.5', '1', '0', 3),
(25, 'Which function returns the number of items in an object?', 'count()', 'length()', 'len()', 'size()', 3),
(26, 'Which statement is used to stop a loop?', 'stop', 'exit', 'break', 'return', 3),
(27, 'What is the output of list(range(0,5,2))?', '[0,1,2,3,4]', '[0,2,4]', '[1,3,5]', '[2,4,6]', 2),
(28, 'Which keyword is used to create a class?', 'object', 'struct', 'class', 'define', 3),
(29, 'What does the is operator check?', 'Value equality', 'Type equality', 'Reference equality', 'Length equality', 3),
(30, 'Which method removes the last element of a list?', 'remove()', 'delete()', 'pop()', 'clear()', 3),
(31, 'Which function is used to read user input?', 'input()', 'scan()', 'read()', 'get()', 1);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `time_taken` int(11) DEFAULT NULL,
  `quiz_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `score`, `time_taken`, `quiz_date`) VALUES
(1, 1, 3, 20, '2025-12-13 08:43:40'),
(2, 1, 4, 17, '2025-12-13 08:44:04'),
(3, 1, 0, 4, '2025-12-13 08:49:08'),
(4, 1, 0, 4, '2025-12-13 08:49:52'),
(5, 1, 0, 4, '2025-12-13 08:49:58'),
(6, 1, 0, 4, '2025-12-13 08:50:22'),
(7, 1, 0, 5, '2025-12-13 08:56:04'),
(8, 1, 0, 3, '2025-12-13 08:56:16'),
(9, 2, 6, 20, '2025-12-13 09:01:23'),
(10, 1, 0, 3, '2025-12-13 09:27:16'),
(11, 1, 6, 22, '2025-12-13 12:47:47'),
(12, 1, 20, 233, '2025-12-13 13:36:54'),
(13, 3, 20, 548, '2025-12-13 15:35:57'),
(14, 5, 16, 347, '2025-12-13 16:38:46'),
(15, 1, 2, 24, '2026-03-04 09:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'sravani', 'sri@gmail.com', 'scrypt:32768:8:1$OBC9pTeE6AtgSaxv$f8bc0726b587fce9d76abae691ba1b1762d4602896bf245ffc20135bf5410f35547be924d107eef177ca82ff501ded96099c7c8fbe7009b67fa80ede91ebfdbd'),
(2, 'dheekkhi', '123@gmail.com', 'scrypt:32768:8:1$rgdkvBDfQEdeBQ9p$ce691302f46f558682f248708d58402968d33b05ed2adc9e621681fa154ed032bcffb78e994fca46fde08e485828c681483e64d45accb7cee7eef50da581e1b3'),
(3, 'Sandhya ', 'sandhya6@gmail.com', 'scrypt:32768:8:1$w7FZ8zDQFfHv95nO$dea37f2fb40c3e60a08fa0cea8cd1c373de97ccf3bc7749b8f31e386de6c0c6d63b40e2bab004451eb3fc81738ecc9b2385e999fbacea3e06b39ba1db3c2d38f'),
(4, 'Shankar', 'shankaryenni44@gmail.com', 'scrypt:32768:8:1$NxqiQh2ERL5N04St$43d57bc7e1cfc817eaf5a883a0821e8d20f1d57325fab3d8c81f0ec89abb23ac1b7ce152d991d4acba87c0dac0a2765d182855b1c0f830228f9d74f496a68c19'),
(5, 'Charan', 'Charan4@gmail.com', 'scrypt:32768:8:1$DLIDb4GE2EaqJK1g$e24db398b06cd5a190c209c829cd324c27b4995097c874995cdb7d2445cc7da0631524859d257be68856aa336ac80258c84122ae678f3002c413e0d296fd66a7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
