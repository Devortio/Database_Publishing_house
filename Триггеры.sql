DELIMITER $
CREATE TRIGGER trigger_1 BEFORE INSERT ON Avtor FOR EACH ROW
	BEGIN
    	SET new.S_name = concat(upper(LEFT(new.S_name,1)), lower(substr(new.S_name,2)));
        SET new.Name = concat(upper(LEFT(new.Name,1)), lower(substr(new.Name,2)));
        SET new.T_name = concat(upper(LEFT(new.T_name,1)), lower(substr(new.T_name,2)));
        SET new.Academ_degree = concat(upper(LEFT(new.Academ_degree,1)), lower(substr(new.Academ_degree,2)));

    	IF new.Academ_degree NOT IN ('Бакалавр','Магистр','Доктор философии','Кандидат наук','Доктор наук') THEN
        SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Бакалавр,Магистр,Доктор философии,Кандидат наук,Доктор наук)';
        END IF;
    END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_2 BEFORE INSERT ON Book FOR EACH ROW
	BEGIN
    	SET new.Name_book = concat(upper(LEFT(new.Name_book,1)), lower(substr(new.Name_book,2)));
        
    	IF CHAR_LENGTH(CAST(new.ISBN AS CHAR)) <> 13 THEN
        SIGNAL SQLSTATE '11000' SET MESSAGE_TEXT = 'Данное поле должно содержать ровно 13 символов. Убедитесь в правильности ввода значения.';
        END IF;
        
        IF new.Number_pages >2500 THEN
        SIGNAL SQLSTATE '12000' SET MESSAGE_TEXT = 'Вы ввели большое количество страниц. Убедитесь в правильности ввода значения.';
        END IF;
    END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_3 BEFORE INSERT ON Translation_department FOR EACH ROW
	BEGIN
    	SET new.Original_language = concat(upper(LEFT(new.Original_language,1)), lower(substr(new.Original_language,2)));
        SET new.Translated_language = concat(upper(LEFT(new.Translated_language,1)), lower(substr(new.Translated_language,2)));
        
    END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_4 BEFORE INSERT ON Sale_department FOR EACH ROW
	BEGIN

        IF new.Price >20000 THEN
        SIGNAL SQLSTATE '13000' SET MESSAGE_TEXT = 'Вы ввели неправильную стоимость. Убедитесь в правильности ввода значения.';
        END IF;
    END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_5 BEFORE INSERT ON Edition_department FOR EACH ROW
	BEGIN
    	SET new.Format = concat(upper(LEFT(new.Format,1)), lower(substr(new.Format,2)));
        SET new.Type_paper = concat(upper(LEFT(new.Type_paper,1)), lower(substr(new.Type_paper,2)));
        SET new.Type_binding = concat(upper(LEFT(new.Type_binding,1)), lower(substr(new.Type_binding,2)));
        
        IF new.Format NOT IN ('Сверхкрупный','Крупный','Средний','Малый','Сверхмалый') THEN
        SIGNAL SQLSTATE '14000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Сверхкрупный,Крупный,Средний,Малый,Сверхмалый)';
        END IF;
        
        IF new.Type_paper NOT IN ('Офсетная','Мелованная','Дизайнерская') THEN
        SIGNAL SQLSTATE '15000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Офсетная,Мелованная,Дизайнерская)';
        END IF;
        
        IF new.Type_binding NOT IN ('Мягкий переплет','Твердый переплет','Брошюровка скобой') THEN
        SIGNAL SQLSTATE '16000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Мягкий переплет,Твердый переплет,Брошюровка скобой)';
        END IF;
    END;$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_6 BEFORE INSERT ON Marketing_department FOR EACH ROW
	BEGIN
    	IF new.Reputation >5 THEN
        SIGNAL SQLSTATE '17000' SET MESSAGE_TEXT = 'Вы ввели неправильную оценку книги. Убедитесь в правильности ввода значения.';      # Скорее всего не нужен
        END IF;

		IF new.Budget >6000000 THEN
        SIGNAL SQLSTATE '18000' SET MESSAGE_TEXT = 'Вы ввели неверное количество бюджета. Убедитесь в правильности ввода значения.';
        END IF;
    END$
DELIMITER ;

DELIMITER $
CREATE TRIGGER trigger_7 BEFORE INSERT ON Publish_house FOR EACH ROW
	BEGIN
    	SET new.Name_ph = concat(upper(LEFT(new.Name_ph,1)), lower(substr(new.Name_ph,2)));
        SET new.Scale = concat(upper(LEFT(new.Scale,1)), lower(substr(new.Scale,2)));
        SET new.City = concat(upper(LEFT(new.City,1)), lower(substr(new.City,2)));
        SET new.Geo_indication = concat(upper(LEFT(new.Geo_indication,1)), lower(substr(new.Geo_indication,2)));
        SET new.Nature_info = concat(upper(LEFT(new.Nature_info,1)), lower(substr(new.Nature_info,2)));
        
        IF new.Scale NOT IN ('Крупный','Средний','Малый') THEN
        SIGNAL SQLSTATE '19000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Крупный,Средний,Малый)';
        END IF;

        IF new.Geo_indication NOT IN ('Местный','Национальный','Транснациональный') THEN
        SIGNAL SQLSTATE '20000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Местный,Национальный,Транснациональный)';
        END IF;

        IF new.Nature_info NOT IN ('Текстовые книги','Электронные издания','Картографическая продукция') THEN
        SIGNAL SQLSTATE '21000' SET MESSAGE_TEXT = 'Веденное значение не соответствует требованиям. Выбирите один из представленных вариантов и занесите свой выбор в данное поле. Значения (Текстовые книги,Электронные издания,Картографическая продукция)';
        END IF;

        IF CHAR_LENGTH(CAST(new.INN AS CHAR)) <> 10 THEN
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Данное поле должно содержать ровно 10 символов. Убедитесь в правильности ввода значения.';
        END IF;
    END$
DELIMITER ;