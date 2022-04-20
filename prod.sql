-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 20 2022 г., 21:04
-- Версия сервера: 5.6.47
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `prod`
--

-- --------------------------------------------------------

--
-- Структура таблицы `prod_collections`
--

CREATE TABLE `prod_collections` (
  `ID` int(10) NOT NULL,
  `COLLECTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prod_collections`
--

INSERT INTO `prod_collections` (`ID`, `COLLECTION`) VALUES
(1, 'Зима'),
(2, 'Лето'),
(3, 'Весна'),
(4, 'Осень'),
(5, 'Новая модная'),
(6, 'Старая не модная');

-- --------------------------------------------------------

--
-- Структура таблицы `prod_products`
--

CREATE TABLE `prod_products` (
  `ID` int(10) NOT NULL,
  `NAME` text NOT NULL,
  `PRICE` int(10) NOT NULL,
  `KEYCOL` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prod_products`
--

INSERT INTO `prod_products` (`ID`, `NAME`, `PRICE`, `KEYCOL`) VALUES
(1, 'Валенки', 1200, 6),
(3, 'Галоши', 600, 6),
(4, 'Ушанка', 1000, 6),
(5, 'Шорты', 300, 2),
(6, 'Плавки', 800, 2),
(7, 'Очки', 200, 2),
(8, 'Трусы', 150, 2),
(9, 'Шлепки', 900, 2),
(10, 'Кепка', 450, 2),
(11, 'Куртка', 3700, 1),
(12, 'Носки', 100, 1),
(13, 'Шарф', 700, 1),
(14, 'Ботинки', 2200, 1),
(15, 'Варежки', 1100, 1),
(16, 'Штаны', 1900, 1),
(17, 'Балаклава', 680, 1),
(18, 'Худи', 7800, 5),
(19, 'Хуюди', 12400, 5),
(20, 'Цепочка', 45000, 5),
(21, 'Уги', 4678, 5),
(22, 'Туфли', 2400, 3),
(23, 'Платье', 4555, 3),
(24, 'Сапожки', 2455, 3),
(25, 'Платок', 1300, 3),
(26, 'Кашне', 1122, 3),
(27, 'Свитер', 1445, 4),
(28, 'Кожанка', 3455, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `prod_collections`
--
ALTER TABLE `prod_collections`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `prod_products`
--
ALTER TABLE `prod_products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KEYCOL` (`KEYCOL`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `prod_collections`
--
ALTER TABLE `prod_collections`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `prod_products`
--
ALTER TABLE `prod_products`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `prod_products`
--
ALTER TABLE `prod_products`
  ADD CONSTRAINT `prod_products_ibfk_1` FOREIGN KEY (`KEYCOL`) REFERENCES `prod_collections` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
