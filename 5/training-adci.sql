-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 09 2022 г., 07:50
-- Версия сервера: 5.5.62
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `training-adci`
--

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Курсы';

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`course_id`, `name`, `description`) VALUES
(1, 'PHP', 'Курс по изучению основ PHP'),
(2, 'Node.JS', 'Курс по изучению Node.JS'),
(3, 'Laravel', 'Курс по обучению работе с библиотекой Laravel'),
(4, 'SQL', 'Курс обучения языку структурированных запросов SQL(SEQUEL)');

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `history_id` int(10) UNSIGNED NOT NULL,
  `trainee_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`history_id`, `trainee_id`, `course_id`, `start`, `end`, `status`) VALUES
(1, 1, 1, 1646733600, 1646751600, 1),
(2, 3, 4, 1646215200, 1646589600, 1),
(3, 2, 3, 1644656400, 1645202880, 0),
(4, 6, 2, 1645264860, 1645380300, 1),
(5, 5, 2, 1644138000, 1646224080, 0),
(6, 4, 1, 1646388900, 1647622200, 1),
(7, 2, 1, 1644667200, 1645896120, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `trainee`
--

CREATE TABLE `trainee` (
  `trainee_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список стажёров';

--
-- Дамп данных таблицы `trainee`
--

INSERT INTO `trainee` (`trainee_id`, `name`, `email`) VALUES
(1, 'Иванов Иван Иванович', 'ivanov_i@mail.ru'),
(2, 'Петров Николай Викторович', 'petr_nv@gmail.com'),
(3, 'Камалетдинов Фарух Нигметович', 'frhn1998@mail.ru'),
(4, 'Бубенчиков Джордж Денисович', 'bubenchik@inbox.com'),
(5, 'Штольц Сидор Астафьевич', 'sidor_shtolz@rambler.ru'),
(6, 'Кёрн Рейнхольд Джошевич', 'reinhold808078@mail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `history_ibfk_1` (`course_id`),
  ADD KEY `history_ibfk_2` (`trainee_id`);

--
-- Индексы таблицы `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`trainee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `trainee`
--
ALTER TABLE `trainee`
  MODIFY `trainee_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
