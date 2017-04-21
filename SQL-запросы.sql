# Находим все книги, у которых количество страниц варьируется от 100 до 450
SELECT *							
	FROM Book B 						
		WHERE B.Number_pages BETWEEN 100 AND 450;

# Найдем сумму бюджета всех книг, у которых оценка варьируется от 3 до 5
SELECT SUM(Budget)			
	FROM Marketing_department M 		
    		WHERE M.Reputation BETWEEN 3 AND 5;

# Находим все языки оригинала и группируем их
SELECT Original_language, COUNT(*)				
	FROM Translation_department
		GROUP BY Original_language;

# Находим всех авторов, которые не написали ни одну книгу
SELECT A.id_avtor	
	FROM Avtor A
		LEFT JOIN Authorship ON A.id_avtor = Authorship.id_avtor
			WHERE Authorship.id_book IS NULL;

# Находим всех авторов, которые написали книги и присоединяем таблицу с названиями книг
SELECT *							
	FROM Avtor 				
		INNER JOIN Authorship ON Avtor.id_avtor = Authorship.id_avtor
			INNER JOIN Book ON Authorship.id_book = Book.id_book
				WHERE Authorship.id_book is NOT NULL;

# Находим всех авторов, которые написали больше чем одну книгу
SELECT S_name, Name, T_name, COUNT(*)
	FROM Avtor A
		INNER JOIN Authorship Au ON A.id_avtor = Au.id_avtor
			GROUP BY A.id_avtor HAVING COUNT(*) > 1;

# Находим все книги, которые прошли через все отделы издательства
SELECT Name_book, ISBN	
	FROM Book B
			INNER JOIN Edition_department E ON B.id_book = E.id_book
			INNER JOIN Stock_department ST ON B.id_book = ST.id_book
			INNER JOIN Sale_department S ON B.id_book = S.id_book
			INNER JOIN Marketing_department M ON B.id_book = M.id_book
			INNER JOIN Translation_department T ON B.id_book = T.id_book

# Находим все книги, у котрых количество страниц варьируется от 100 до 370
SELECT Name_book,Number_pages	
	FROM Book B 						
		WHERE B.Number_pages BETWEEN 100 AND 370

# Соединяем результаты запросов, находим все книги, у которых количество глав варьируется от 1 до 4
Union					
SELECT Name_book,Number_chapters		
	FROM Book B 				
		WHERE B.Number_chapters BETWEEN 1 AND 4;

# Выводим язык оригинала и количество книг написанных на нем группируем их, а так же сортируем по убыванию
SELECT Original_language, COUNT(*)	
	FROM Translation_department
		GROUP BY Original_language ORDER BY Original_language DESC;

# Найдем всю информацию о книге, Id-номер которой равен 6
SELECT S_name,T_name,Name_book, ISBN,Number_pages,Number_chapters,Print_date,Format,
	Type_paper,Type_binding,Price,Number_sales,Budget,Reputation
		FROM Book B
			INNER JOIN Authorship AU ON B.id_book = AU.id_book
            INNER JOIN Avtor A ON AU.id_avtor = A.id_avtor
			INNER JOIN Edition_department E ON B.id_book = E.id_book
			INNER JOIN Sale_department S ON B.id_book = S.id_book
			INNER JOIN Marketing_department M ON B.id_book = M.id_book
            	WHERE B.id_book = 6;

# Найдем издательства, у которых территориальный признак равен 'Транснациональный', а название начинается на 'а' и книги, которые они издали
SELECT Name_book,Name_ph,City,Scale,Geo_indication,Nature_info,INN 	
	FROM Publish_house P 						
    	INNER JOIN Group_departments G ON P.id_group = G.id_group 	
    	INNER JOIN Edition_department E ON G.id_edition = E.id_edition
    	INNER JOIN Book B ON E.id_book = B.id_book
    		WHERE P.Geo_indication = 'Транснациональный' AND P.Name_ph LIKE 'а%';

# Находим все данные о книге, номер который мы получим из подзапроса
SELECT S_name,T_name,Name_book, ISBN,Number_pages,Number_chapters,Print_date,Format,
	Type_paper,Type_binding,Price,Number_sales,Budget,Reputation
		FROM Book B
			LEFT JOIN Authorship AU ON B.id_book = AU.id_book
            LEFT JOIN Avtor A ON AU.id_avtor = A.id_avtor
			LEFT JOIN Edition_department E ON B.id_book = E.id_book
			LEFT JOIN Sale_department S ON B.id_book = S.id_book
			LEFT JOIN Marketing_department M ON B.id_book = M.id_book
            	WHERE B.id_book = (SELECT COUNT(*) FROM Book B WHERE B.Number_pages BETWEEN 50 AND 800);
