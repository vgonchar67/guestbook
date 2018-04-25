-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2018 г., 19:46
-- Версия сервера: 5.5.57
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `text_bbcode` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `text_html` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `username`, `user_id`, `email`, `homepage`, `text_bbcode`, `active`, `text_html`) VALUES
(1, 'user1', NULL, 'user1', '', '[i]Привет мир[/i]', 1, '<em>Привет мир</em>'),
(2, 'user2', NULL, 'email@mail.ru', 'https://yandex.ru/', 'Привет мир!', 1, 'Привет мир!'),
(3, 'user3', NULL, 'user2', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum\r\n', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum<br />Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum<br />'),
(47, '123', NULL, 'email', '', 'Gh&lt;strong&gt;bd&lt;/strong&gt;', 1, 'Gh&lt;strong&gt;bd&lt;/strong&gt;'),
(48, '123', NULL, 'email', '', '[code]NTcnj[/code]\r\n', 1, '<code>NTcnj</code><br />'),
(49, '123', NULL, 'email', '', 'Привет [i]мир[/i]', 1, 'Привет <em>мир</em>'),
(52, '123', NULL, 'email@mail.ru', '', 'При[b]ве[/b]т &lt;em&gt;мир&lt;/em&gt;', 0, 'При<strong>ве</strong>т &lt;em&gt;мир&lt;/em&gt;'),
(56, 'Test', NULL, 'email', '', '[i]&lt;b&gt;[/i]Привет&lt;/b&gt; [b]мир[/b]', 1, '<em>&lt;b&gt;</em>Привет&lt;/b&gt; <strong>мир</strong>'),
(57, 'Test', NULL, 'email', '', '[b]as[/b][i]df[/i]\r\n[i][url=https://www.yandex.ru/]Яндекс[/url][/i]\r\n[code]&lt;script&gt;alert(1)&lt;/script&gt;[/code]', 1, '<strong>as</strong><em>df</em><br /><em><a href=\"https://www.yandex.ru/\" target=\"_blank\" rel=\"noreferrer noopener\">Яндекс</a></em><br /><code>&lt;script&gt;alert(1)&lt;/script&gt;</code>'),
(59, 'Test', NULL, 'email@mail.ru', '', '[s][i][b]Strike[/b][/i][/s]', 1, '<strike><em><strong>Strike</strong></em></strike>'),
(60, 'Test', NULL, 'email@mail.ru', '', '[code]Code[/code]\r\n[b]bold[/b]\r\n[i]italic[/i]\r\n[url=https://yandex.ru/]Яндекс[/url]\r\n[s]strike[/s]', 1, '<code>Code</code><br /><strong>bold</strong><br /><em>italic</em><br /><a href=\"https://yandex.ru/\" target=\"_blank\" rel=\"noreferrer noopener\">Яндекс</a><br /><strike>strike</strike>'),
(69, 'Дюймовочка', NULL, 'djujmovochka@mail.ru', 'http://guestbook.ru/', 'Решила создать тему, в которой можно было бы поделиться своими пристрастиями в области литературы.  \r\n\r\n[i][b]Предисловие.[/b] \r\nВ детстве я прочла практически все книги (разве что за исключением научно-побличистической литературы  ) из нашей довольно обширной домашней библиотеки, которая постоянно пополнялась усилиями моей бабушки. \r\nНа летние каникулы я приезжала к ней за город, где была записана в местную библиотеку, в которую я регулярно наведывалась. Мне там очень нравилось: большое тихое помещение с фикусами, добрая тетя-библиотекарь в очках, и на удивление, книги, которые не возможно было раздобыть в Москве. \r\nСреди местных библиотека не пользовалась особой популярностью, тогда как я была ее постоянным посетителем, в итоге библиотекарь предложила моей бабуле записать меня в &quot;Общество книголюбов&quot;, где за символические членские взносы можно было получать редкие экземпляры книг или иметь приоритетное право в очереди на них. \r\nМне выдали членскую книжку и значок, который у меня до сих пор храниться. [/i]\r\n\r\nДрузья, давайте делиться впечатления от прочитанного  что-то советовать друг другу  , т.к. в последнее время появилось очень много литературы, и очень много такой, на которую и время тратить не хочется  пусть эта тема будет некоторым ориентиром и путеводителем в области литературы, естественно с учетом ваших предпочтений', 1, 'Решила создать тему, в которой можно было бы поделиться своими пристрастиями в области литературы.  <br /><br /><em><strong>Предисловие.</strong> <br />В детстве я прочла практически все книги (разве что за исключением научно-побличистической литературы  ) из нашей довольно обширной домашней библиотеки, которая постоянно пополнялась усилиями моей бабушки. <br />На летние каникулы я приезжала к ней за город, где была записана в местную библиотеку, в которую я регулярно наведывалась. Мне там очень нравилось: большое тихое помещение с фикусами, добрая тетя-библиотекарь в очках, и на удивление, книги, которые не возможно было раздобыть в Москве. <br />Среди местных библиотека не пользовалась особой популярностью, тогда как я была ее постоянным посетителем, в итоге библиотекарь предложила моей бабуле записать меня в \"Общество книголюбов\", где за символические членские взносы можно было получать редкие экземпляры книг или иметь приоритетное право в очереди на них. <br />Мне выдали членскую книжку и значок, который у меня до сих пор храниться. </em><br /><br />Друзья, давайте делиться впечатления от прочитанного  что-то советовать друг другу  , т.к. в последнее время появилось очень много литературы, и очень много такой, на которую и время тратить не хочется  пусть эта тема будет некоторым ориентиром и путеводителем в области литературы, естественно с учетом ваших предпочтений'),
(70, 'iiv', NULL, 'iiv@mail.ru', 'http://guestbook.ru/', 'Добрый день,\r\n\r\nхочу понять физику процесса. Пусть есть редкоземельный магнит, вернее один кристаллик оного, который может стать диполем. Пусть этот кристаллик внесен в магнитное поле, а потом из него вынесен. Как он будет намагничиваться?\r\n\r\nБолее конкретно: пусть у кристаллика было уже сколько-то X намагниченности (X - вектор, его норма - величина поля у поверхности, а направление - его направление), мы внесли его на время T в поле Y. Каким будет после этого поле этого диполя? Как я понимаю, T должно быть каким-то достаточно большим, и поле Y должно быть существенно выше X, но как конкретно?\r\n\r\nЧтобы понять зачем, расскажу что сделал: взял листовую медь, соорудил из нее катушку в 135 витков, с внутренним диаметром катушки 26мм и внешним 160мм, подключил к ней 15 последовательно заряженных на 2.7В ионистров, каждый из которых рассчитан на 1100А, должно было за 75милисекунд внутри катушки создаться 3.3Тл (примерно) с учетом индуктивности катушки и потерь в меди ессно. Внутри катушки был неодимовый магнит, предварительно намагниченный перпендикулярно возникающему полю. После нескольких таких зарядов магнит направление намагниченности не поменял. В то же время, если тот же магнит прислонить к большому другому магниту на несколько секунд, он направление намагниченности меняет.\r\n\r\nТо есть мне не конкретно этот эксперимент интересен, а общая теория перемагничивания постоянных магнитов. Вдруг у кого ссылка под рукой будет или Вы можете на пальцах объяснить физику, буду премного благодарен!\r\n\r\nС уважением\r\n\r\nИИВ', 1, 'Добрый день,<br /><br />хочу понять физику процесса. Пусть есть редкоземельный магнит, вернее один кристаллик оного, который может стать диполем. Пусть этот кристаллик внесен в магнитное поле, а потом из него вынесен. Как он будет намагничиваться?<br /><br />Более конкретно: пусть у кристаллика было уже сколько-то X намагниченности (X - вектор, его норма - величина поля у поверхности, а направление - его направление), мы внесли его на время T в поле Y. Каким будет после этого поле этого диполя? Как я понимаю, T должно быть каким-то достаточно большим, и поле Y должно быть существенно выше X, но как конкретно?<br /><br />Чтобы понять зачем, расскажу что сделал: взял листовую медь, соорудил из нее катушку в 135 витков, с внутренним диаметром катушки 26мм и внешним 160мм, подключил к ней 15 последовательно заряженных на 2.7В ионистров, каждый из которых рассчитан на 1100А, должно было за 75милисекунд внутри катушки создаться 3.3Тл (примерно) с учетом индуктивности катушки и потерь в меди ессно. Внутри катушки был неодимовый магнит, предварительно намагниченный перпендикулярно возникающему полю. После нескольких таких зарядов магнит направление намагниченности не поменял. В то же время, если тот же магнит прислонить к большому другому магниту на несколько секунд, он направление намагниченности меняет.<br /><br />То есть мне не конкретно этот эксперимент интересен, а общая теория перемагничивания постоянных магнитов. Вдруг у кого ссылка под рукой будет или Вы можете на пальцах объяснить физику, буду премного благодарен!<br /><br />С уважением<br /><br />ИИВ'),
(71, 'WestCoast  ', NULL, 'west@mail.ru', '', 'Приветствую.\r\nВывожу данные из БД в цикле в input-ы:\r\n\r\n[code]while ($row=mysql_fetch_array($query_res)) {\r\n  echo &#039;&lt;input type=&quot;text&quot; size=&quot;50&quot; name=&quot;&#039;.$row[&#039;fam&#039;].&#039;&quot; value=&quot;&#039;.$row[&#039;fam&#039;].&#039;&quot;&gt;  &#039;;\r\n    echo &#039;&lt;input type=&quot;text&quot; size=&quot;50&quot; name=&quot;&#039;.$row[&#039;rab&#039;].&#039;&quot; value=&quot;&#039;.$row[&#039;rab&#039;].&#039;&quot;&gt;&lt;/br&gt;&lt;/br&gt;&#039;;\r\n}[/code]\r\n\r\nС этим проблем нет, но как реализовать обновление данных в базе если пользователь изменит что-либо в input-ах?', 1, 'Приветствую.<br />Вывожу данные из БД в цикле в input-ы:<br /><br /><code>while ($row=mysql_fetch_array($query_res)) {<br />  echo \'&lt;input type=\"text\" size=\"50\" name=\"\'.$row[\'fam\'].\'\" value=\"\'.$row[\'fam\'].\'\"&gt;  \';<br />    echo \'&lt;input type=\"text\" size=\"50\" name=\"\'.$row[\'rab\'].\'\" value=\"\'.$row[\'rab\'].\'\"&gt;&lt;/br&gt;&lt;/br&gt;\';<br />}</code><br /><br />С этим проблем нет, но как реализовать обновление данных в базе если пользователь изменит что-либо в input-ах?'),
(72, 'TheRock17', NULL, 'Vlads@mail.ru', '', 'Подскажите пожалуйста, не работает мобильное меню. В десктопной версии все ок, а в мобильное не открывается.\r\nСайт: [url=https://chinim.com.ua/]https://chinim.com.ua/[/url]', 1, 'Подскажите пожалуйста, не работает мобильное меню. В десктопной версии все ок, а в мобильное не открывается.<br />Сайт: <a href=\"https://chinim.com.ua/\" target=\"_blank\" rel=\"noreferrer noopener\">https://chinim.com.ua/</a>'),
(73, 'Владимир', NULL, 'sadman6730@mail.ru', 'https://www.google.ru/chrome/browser/welcome.html', '[b]Вас приветствует Chrome[/b]\r\nВы используете новый быстрый веб-браузер. \r\nНаведите указатель мыши на значки, расположенные ниже, и получите три совета.', 1, '<strong>Вас приветствует Chrome</strong><br />Вы используете новый быстрый веб-браузер. <br />Наведите указатель мыши на значки, расположенные ниже, и получите три совета.'),
(74, 'OLJA', NULL, 'olja@mail.ru', 'http://www.cyberforum.ru/members/613211.html', 'Компьютер должен отвечать следующим требованиям:\r\n- в первую очередь для работы,\r\n- использование сети Интернет, \r\n- работу с документами, \r\n- офисными приложениями (Word, Excel и др.), \r\n- математическими пакетами (Mathcad, Maple),\r\n- прослушивание музыки, просмотр фильмов,\r\n- и &quot;лёгкие&quot; (с невысокими системными требованиями) или старые компьютерные игры. \r\n\r\n[b][i]Процессор[/i][/b] AMD Ryzen 3 1200 (BOX) \r\n[b][i]Материнская плата[/i][/b] ASUS PRIME B250M-PLUS \r\n[b][i]Видеокарта[/i][/b] Gigabyte GeForce GT 730 2048Mb DDR5 (GV-N730D5-2GI)\r\n[b][i]Оперативная память [/i][/b]Kingston 4096Mb DDR4 SoDIMM (KVR24S17S6/4)\r\n[b][i]Жесткий диск[/i][/b] 3.5&quot; 500 Гб Seagate Barracuda (ST500DM009)\r\n[b][i]Блок питания [/i][/b]Chieftec GPB-400S 400W (GPB-400S)\r\n[b][i]Корпус[/i][/b] Aerocool DS 200 Windows Black\r\n\r\nподскажите пожалуйста, можно ли такую сборку использовать?', 1, 'Компьютер должен отвечать следующим требованиям:<br />- в первую очередь для работы,<br />- использование сети Интернет, <br />- работу с документами, <br />- офисными приложениями (Word, Excel и др.), <br />- математическими пакетами (Mathcad, Maple),<br />- прослушивание музыки, просмотр фильмов,<br />- и \"лёгкие\" (с невысокими системными требованиями) или старые компьютерные игры. <br /><br /><strong><em>Процессор</em></strong> AMD Ryzen 3 1200 (BOX) <br /><strong><em>Материнская плата</em></strong> ASUS PRIME B250M-PLUS <br /><strong><em>Видеокарта</em></strong> Gigabyte GeForce GT 730 2048Mb DDR5 (GV-N730D5-2GI)<br /><strong><em>Оперативная память </em></strong>Kingston 4096Mb DDR4 SoDIMM (KVR24S17S6/4)<br /><strong><em>Жесткий диск</em></strong> 3.5\" 500 Гб Seagate Barracuda (ST500DM009)<br /><strong><em>Блок питания </em></strong>Chieftec GPB-400S 400W (GPB-400S)<br /><strong><em>Корпус</em></strong> Aerocool DS 200 Windows Black<br /><br />подскажите пожалуйста, можно ли такую сборку использовать?'),
(75, 'Avantre', NULL, 'avantre@mail.ru', '', 'Добрый день, коллеги!\r\n\r\nОцените пожалуйста сборку, ранее ее делали здесь на форуме, сейчас все ок работает. Но прошло уже пол года и в магазине отсутствуют некоторые комплектующие.\r\n\r\nПокупаем Москва в Regard.\r\n\r\nМатеринская плата [url=https://www.regard.ru/catalog/tovar222755.htm]ASUS H110M-R/C/SI OEM[/url]\r\nОперативная память [url=https://www.regard.ru/catalog/tovar157379.htm]8Gb DDR4 2133MHz Crucial[/url]\r\nКорпус [url=https://www.regard.ru/catalog/tovar146148.htm]Zalman ZM-T1 Plus Black, mATX, Mini-ITX,[/url]\r\nБлок [url=https://www.regard.ru/catalog/tovar43998.htm]400W FSP ATX-400PNR OEM[/url]\r\nПроцессор (отсутствует в магазине): [url=https://www.regard.ru/catalog/tovar241885.htm]Intel Pentium G4560 OEM, Socket 1151, 2-ядерный, 3500 МГц[/url]\r\nКулер [url=https://www.regard.ru/catalog/tovar144825.htm]DeepCool THETA 20 PWM[/url]\r\nТакже не знаю какую взять память, гб на 500.\r\n\r\nПосоветуйте пожалуйста.', 1, 'Добрый день, коллеги!<br /><br />Оцените пожалуйста сборку, ранее ее делали здесь на форуме, сейчас все ок работает. Но прошло уже пол года и в магазине отсутствуют некоторые комплектующие.<br /><br />Покупаем Москва в Regard.<br /><br />Материнская плата <a href=\"https://www.regard.ru/catalog/tovar222755.htm\" target=\"_blank\" rel=\"noreferrer noopener\">ASUS H110M-R/C/SI OEM</a><br />Оперативная память <a href=\"https://www.regard.ru/catalog/tovar157379.htm\" target=\"_blank\" rel=\"noreferrer noopener\">8Gb DDR4 2133MHz Crucial</a><br />Корпус <a href=\"https://www.regard.ru/catalog/tovar146148.htm\" target=\"_blank\" rel=\"noreferrer noopener\">Zalman ZM-T1 Plus Black, mATX, Mini-ITX,</a><br />Блок <a href=\"https://www.regard.ru/catalog/tovar43998.htm\" target=\"_blank\" rel=\"noreferrer noopener\">400W FSP ATX-400PNR OEM</a><br />Процессор (отсутствует в магазине): <a href=\"https://www.regard.ru/catalog/tovar241885.htm\" target=\"_blank\" rel=\"noreferrer noopener\">Intel Pentium G4560 OEM, Socket 1151, 2-ядерный, 3500 МГц</a><br />Кулер <a href=\"https://www.regard.ru/catalog/tovar144825.htm\" target=\"_blank\" rel=\"noreferrer noopener\">DeepCool THETA 20 PWM</a><br />Также не знаю какую взять память, гб на 500.<br /><br />Посоветуйте пожалуйста.'),
(76, 'falconi', NULL, 'falconi@mail.ru', 'http://forum.developing.ru/member.php/44107-falconi', 'Доброго дня!\r\n\r\nОпыта в программировании нет. Поэтому сразу прошу прощения за все ляпы и ересь...\r\n\r\nСтоит задача: запустить скриптом Excel, открыть определенный документ и выполнить макрос.\r\nЯ сделал это как cмог в PowerShell.\r\nНо запускать этот скрипт нужно из программы, которая не дружит с PowerShell, а соответственно запускаю из этой программы cmd-файл, следующего содержания:\r\n\r\nКод :\r\n[code]powershell -ExecutionPolicy bypass -File C:\\Script\\NEW_Sticker_2.ps1\r\n[/code]\r\n\r\nИ далее выполняется сам NEW_Sticker_2.ps1:\r\n\r\nКод :\r\n[code]$excel = new-object -comobject excel.application\r\n$xlprocess = Get-Process excel\r\n$excel.Visible = $False\r\n$excel.DisplayAlerts = $False\r\n$excelFiles = Get-ChildItem -Path C:\\workfiles\\ -Include *.xls, *.xlsx -Recurse\r\nForeach($file in $excelFiles)\r\n{\r\n$workbook = $excel.workbooks.open($file.fullname)\r\n$worksheet = $workbook.worksheets.item(1)\r\n$excel.Run(&quot;Personal.xlsb!Export&quot;)\r\n}\r\n$workbook.Close()\r\n$excel.Quit()\r\n$xlprocess | kill[/B]\r\n[/code]\r\n\r\nВсе работает, но только с постоянно прописанным путём к обрабатываемому файлу (C:\\workfiles\\).\r\n\r\nПожалуйста, помогите.\r\nМожно ли из первого cmd-файла как-нибудь передать параметром путь к обрабатываемому файлу, который каждый раз меняется?\r\nПервому файлу этот параметр (путь) может сообщить запускающая его программа как параметр...\r\n\r\nИли может я вообще левой рукой правое ухо чешу?\r\nИ можно все прощу сделать...', 1, 'Доброго дня!<br /><br />Опыта в программировании нет. Поэтому сразу прошу прощения за все ляпы и ересь...<br /><br />Стоит задача: запустить скриптом Excel, открыть определенный документ и выполнить макрос.<br />Я сделал это как cмог в PowerShell.<br />Но запускать этот скрипт нужно из программы, которая не дружит с PowerShell, а соответственно запускаю из этой программы cmd-файл, следующего содержания:<br /><br />Код :<br /><code>powershell -ExecutionPolicy bypass -File C:\\Script\\NEW_Sticker_2.ps1<br /></code><br /><br />И далее выполняется сам NEW_Sticker_2.ps1:<br /><br />Код :<br /><code>$excel = new-object -comobject excel.application<br />$xlprocess = Get-Process excel<br />$excel.Visible = $False<br />$excel.DisplayAlerts = $False<br />$excelFiles = Get-ChildItem -Path C:\\workfiles\\ -Include *.xls, *.xlsx -Recurse<br />Foreach($file in $excelFiles)<br />{<br />$workbook = $excel.workbooks.open($file.fullname)<br />$worksheet = $workbook.worksheets.item(1)<br />$excel.Run(\"Personal.xlsb!Export\")<br />}<br />$workbook.Close()<br />$excel.Quit()<br />$xlprocess | kill[/B]<br /></code><br /><br />Все работает, но только с постоянно прописанным путём к обрабатываемому файлу (C:\\workfiles\\).<br /><br />Пожалуйста, помогите.<br />Можно ли из первого cmd-файла как-нибудь передать параметром путь к обрабатываемому файлу, который каждый раз меняется?<br />Первому файлу этот параметр (путь) может сообщить запускающая его программа как параметр...<br /><br />Или может я вообще левой рукой правое ухо чешу?<br />И можно все прощу сделать...'),
(77, 'Тест', NULL, 'email@mail.ru', '', '&lt;b&gt;Привет&lt;/b&gt; [b]мир[/b]', 1, '&lt;b&gt;Привет&lt;/b&gt; <strong>мир</strong>'),
(78, 'Владимир', NULL, 'sadman6730@mail.ru', 'https://mail.ru/', 'test', 1, 'test'),
(87, NULL, 1, NULL, NULL, 'кенге', 0, 'кенге');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`, `login`, `homepage`, `email`) VALUES
(1, 'admin', '$2y$13$DbMr5ohXN.qEhuzOjzWmIedioKPySoJweDpYXM08V5v3HNaNzw3Pu', NULL, 'admin', NULL, ''),
(2, 'test', '$2y$13$j2rRX1HB0BT2PFE1hNtv3.ADXAmSyGCfbFKxUqvLZPyixyyCQULp6', NULL, 'test', NULL, 'test'),
(3, 'test', '$2y$13$7vW4qFv03GOnmuJSdazOYekmI6pYa7djn1KL6phVg1uQo8r0.xZlS', NULL, 'test', NULL, 'test'),
(4, 'test', '$2y$13$1/RuKsS.hXKGZTS9fvx.0.RlNkTxFlJmqGcyZeFrv/Y8c32P1fub.', NULL, 'test2', NULL, 'test'),
(5, 'test', '$2y$13$Z.sgq9GbJvP0cBptEQEjPOv0fY5GYxb0b0rZz8iLgGVq7dLucLfk.', NULL, 'test3', '', 'test@mail.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
