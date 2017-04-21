CREATE TABLE Avtor (id_avtor int NOT null AUTO_INCREMENT, S_name varchar(30), Name varchar(30), T_name varchar(30), Academ_degree varchar(30), PRIMARY KEY(id_avtor));

CREATE TABLE Authorship (id_authorship int AUTO_INCREMENT, id_book int,id_avtor int, PRIMARY KEY(id_authorship));

CREATE TABLE Book (id_book int NOT null AUTO_INCREMENT, Name_book varchar(30), ISBN bigint, Number_pages smallint, Number_chapters tinyint, Print_date date, PRIMARY KEY(id_book));

CREATE TABLE Publish_house (id_izd int NOT null AUTO_INCREMENT, Name_ph varchar(30), City varchar(30), Scale varchar(30), Geo_indication varchar(30), Nature_info varchar(40), INN bigint, id_group int, Founding_date date, PRIMARY KEY(id_izd));

CREATE TABLE Group_departments (id_group int NOT null AUTO_INCREMENT, id_edition int, id_stock int, id_sale int, id_marketing int, id_translation int, PRIMARY KEY(id_group));

CREATE TABLE Edition_department (id_edition int NOT null AUTO_INCREMENT, id_book int, Format varchar(20), Type_paper varchar(30), Type_binding varchar(30), PRIMARY KEY(id_edition));

CREATE TABLE Stock_department (id_stock int NOT null AUTO_INCREMENT, id_book int, Number_products int, PRIMARY KEY(id_stock));

CREATE TABLE Sale_department (id_sale int NOT null AUTO_INCREMENT, id_book int, Price smallint, Number_sales mediumint, PRIMARY KEY(id_sale));

CREATE TABLE Marketing_department (id_marketing int NOT null AUTO_INCREMENT, id_book int, Budget mediumint unsigned, Reputation float(5,1), PRIMARY KEY(id_marketing));

CREATE TABLE Translation_department (id_translation int NOT null AUTO_INCREMENT, id_book int, Original_language varchar(40), Translated_language varchar(40), PRIMARY KEY(id_translation));