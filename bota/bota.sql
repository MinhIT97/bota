CREATE TABLE Category
(
	id int PRIMARY KEY auto_increment,
	name varchar(200) not null unique,
	parent int Default '0',
	slug varchar(200),
	status tinyint Default '1',
	created_at datetime Default CURRENT_TIMESTAMP,
	updated_at datetime Default CURRENT_TIMESTAMP

);

CREATE TABLE Product
(
	id int PRIMARY KEY auto_increment,
	name varchar(200) not null,
	slug varchar (200) not null,
	made_id int not null,
	cat_id int not null ,
	image varchar(200),
	description text,
	price float,
	sale_price float,
	status tinyint Default '1',
	created_at datetime Default CURRENT_TIMESTAMP

);
-- tạo khóa ngoại--
Alter TABLE Product add Foreign key FK_Product_Category(cat_id) References Category(id);


CREATE TABLE madein
(
	id int PRIMARY KEY auto_increment,
	made varchar(50),
	created_at datetime Default CURRENT_TIMESTAMP
	updated_at datetime Default CURRENT_TIMESTAMP
);

Alter TABLE Product add Foreign key FK_Product_madein(made_id) References madein(id);
CREATE TABLE Users
(
	id int PRIMARY KEY auto_increment,
	name varchar(100) not null,
	password varchar(100) not null,
	email varchar(100) not null unique,
	phone varchar(20),
	gender tinyint Default '1',
	birthday date,
	address varchar(255),
	created_at datetime Default CURRENT_TIMESTAMP,
	updated_at datetime Default CURRENT_TIMESTAMP
);
CREATE TABLE bill
(
	id int PRIMARY KEY auto_increment,
	user_id int not null,
	sum_price int not null,
	status tinyint Default '0',
	created_at datetime Default CURRENT_TIMESTAMP,
	updated_at datetime Default CURRENT_TIMESTAMP
);
Alter TABLE bill add Foreign key FK_bill_Users(user_id) References Users(id);


CREATE TABLE detail
(   id int PRIMARY KEY auto_increment,
	bill_id int not null,
	product_id  int not null,
	quantity int not null,
	price float
);
Alter TABLE detail add Foreign key FK_detail_bill(bill_id) References bill(id);
Alter TABLE detail add Foreign key FK_detail_Product(product_id) References Product(id);
CREATE TABLE Feedback
(
	id int PRIMARY KEY auto_increment,
	product_id int not null,
	name varchar(200),
	Feedback varchar(200),
	email varchar(200),
	created_at datetime Default CURRENT_TIMESTAMP,
	updated_at datetime Default CURRENT_TIMESTAMP

);
Alter TABLE Feedback add Foreign key FK_Feedback_Product(product_id) References Product(id);
