ALTER TABLE Authorship
	ADD CONSTRAINT onef_key FOREIGN KEY (id_avtor)
		REFERENCES Avtor (id_avtor);
		
ALTER TABLE Authorship
	ADD CONSTRAINT twof_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Stock_department
	ADD CONSTRAINT threef_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Translation_department
	ADD CONSTRAINT fourf_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Edition_department
	ADD CONSTRAINT fivef_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Sale_department
	ADD CONSTRAINT sixf_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Marketing_department
	ADD CONSTRAINT sevenf_key FOREIGN KEY (id_book)
		REFERENCES Book (id_book);
		
ALTER TABLE Publish_house
	ADD CONSTRAINT eightf_key FOREIGN KEY (id_group)
		REFERENCES Group_departments (id_group);
		
ALTER TABLE Group_departments
	ADD CONSTRAINT ninef_key FOREIGN KEY (id_edition)
		REFERENCES Edition_department (id_edition);
		
ALTER TABLE Group_departments
	ADD CONSTRAINT tenf_key FOREIGN KEY (id_sale)
		REFERENCES Sale_department (id_sale);
		
ALTER TABLE Group_departments
	ADD CONSTRAINT elevenf_key FOREIGN KEY (id_translation)
		REFERENCES Translation_department (id_translation);
		
ALTER TABLE Group_departments
	ADD CONSTRAINT twelvef_key FOREIGN KEY (id_stock)
		REFERENCES Stock_department (id_stock);
		
ALTER TABLE Group_departments
	ADD CONSTRAINT thirteenf_key FOREIGN KEY (id_marketing)
		REFERENCES Marketing_department (id_marketing);
		
ALTER TABLE Book
	ADD CONSTRAINT onea_key UNIQUE (ISBN);
