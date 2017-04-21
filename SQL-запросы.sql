SELECT *																				# Находим все книги, у которых количество страниц варьируется
	FROM Book B 																	# от 100 до 450
		WHERE B.Number_pages BETWEEN 100 AND 450;

SELECT SUM(Budget)																		# Найдем сумму бюджета всех книг, у которых оценка варьируется
	FROM Marketing_department M 												# от 3 до 5
    	WHERE M.Reputation BETWEEN 3 AND 5;

SELECT Original_language, COUNT(*)										# Находим все языки оригинала и группируем их
	FROM Translation_department
		GROUP BY Original_language;

SELECT A.id_avtor																		# Находим всех авторов, которые не написали ни одну книгу
	FROM Avtor A
		LEFT JOIN Authorship ON A.id_avtor = Authorship.id_avtor
			WHERE Authorship.id_book IS NULL;

SELECT *																				# Находим всех авторов, которые написали книги
	FROM Avtor 																			# и присоединяем таблицу с названиями книг
		INNER JOIN Authorship ON Avtor.id_avtor = Authorship.id_avtor
			INNER JOIN Book ON Authorship.id_book = Book.id_book
				WHERE Authorship.id_book is NOT NULL;

SELECT S_name, Name, T_name, COUNT(*)													# Находим всех авторов, которые написали больше чем одну книгу
	FROM Avtor A
		INNER JOIN Authorship Au ON A.id_avtor = Au.id_avtor
			GROUP BY A.id_avtor HAVING COUNT(*) > 1;

SELECT Name_book, ISBN																	# Находим все книги, которые прошли через все отделы издательства
	FROM Book B
			INNER JOIN Edition_department E ON B.id_book = E.id_book
			INNER JOIN Stock_department ST ON B.id_book = ST.id_book
			INNER JOIN Sale_department S ON B.id_book = S.id_book
			INNER JOIN Marketing_department M ON B.id_book = M.id_book
			INNER JOIN Translation_department T ON B.id_book = T.id_book

SELECT Name_book,Number_pages															# Находим все книги, у котрых количество страниц варьируется
	FROM Book B 																		# от 100 до 370
		WHERE B.Number_pages BETWEEN 100 AND 370
Union																					# Соединяем результаты запросов
SELECT Name_book,Number_chapters														# Находим все книги, у которых количество глав варьируется
	FROM Book B 																		# от 1 до 4
		WHERE B.Number_chapters BETWEEN 1 AND 4;

SELECT Original_language, COUNT(*)														# Выводим язык оригинала и количество книг написанных на нем
	FROM Translation_department															#  группируем их, а так же сортируем по убыванию
		GROUP BY Original_language ORDER BY Original_language DESC;

SELECT S_name,T_name,Name_book, ISBN,Number_pages,Number_chapters,Print_date,Format,	# Найдем всю информацию о книге, Id-номер которой равен 6
	Type_paper,Type_binding,Price,Number_sales,Budget,Reputation
		FROM Book B
			INNER JOIN Authorship AU ON B.id_book = AU.id_book
            INNER JOIN Avtor A ON AU.id_avtor = A.id_avtor
			INNER JOIN Edition_department E ON B.id_book = E.id_book
			INNER JOIN Sale_department S ON B.id_book = S.id_book
			INNER JOIN Marketing_department M ON B.id_book = M.id_book
            	WHERE B.id_book = 6;

SELECT Name_book,Name_ph,City,Scale,Geo_indication,Nature_info,INN 						# Найдем издательства, у которых территориальный признак равен
	FROM Publish_house P 																# 'Транснациональный', а название начинается на 'а' и
    	INNER JOIN Group_departments G ON P.id_group = G.id_group 						# книги, которые они издали
    	INNER JOIN Edition_department E ON G.id_edition = E.id_edition
    	INNER JOIN Book B ON E.id_book = B.id_book
    		WHERE P.Geo_indication = 'Транснациональный' AND P.Name_ph LIKE 'а%';

SELECT S_name,T_name,Name_book, ISBN,Number_pages,Number_chapters,Print_date,Format,	# Находим все данные о книге, номер который мы получим из подзапроса
	Type_paper,Type_binding,Price,Number_sales,Budget,Reputation
		FROM Book B
			LEFT JOIN Authorship AU ON B.id_book = AU.id_book
            LEFT JOIN Avtor A ON AU.id_avtor = A.id_avtor
			LEFT JOIN Edition_department E ON B.id_book = E.id_book
			LEFT JOIN Sale_department S ON B.id_book = S.id_book
			LEFT JOIN Marketing_department M ON B.id_book = M.id_book
            	WHERE B.id_book = (SELECT COUNT(*) FROM Book B WHERE B.Number_pages BETWEEN 50 AND 800);
