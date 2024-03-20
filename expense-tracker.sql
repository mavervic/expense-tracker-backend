DROP DATABASE expense_tracker;

CREATE DATABASE expense_tracker;

USE expense_tracker;

CREATE TABLE types (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '交易類型的主鍵',
  name VARCHAR(10) COMMENT '交易類型名稱'
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '類別的主鍵',
  name VARCHAR(255) COMMENT '類別名稱',
  type_id INT COMMENT '參考交易類型資料表的外鍵',
  FOREIGN KEY (type_id) REFERENCES types(id)
);

CREATE TABLE transactions (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '交易的主鍵',
  category_id INT COMMENT '參考類別資料表的外鍵',
  amount DECIMAL(10,2) COMMENT '交易金額',
  datetime DATETIME COMMENT '交易時間',
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

insert into types (name) values 
('收入'),
('支出');

insert into categories (name, type_id) values
('食物', 2),
('交通', 2),
('娛樂', 2),
('家庭', 2),
('其他', 2),
('薪水', 1),
('獎金', 1),
('投資', 1),
('其他', 1);

insert into transactions (category_id, amount, datetime) values
(1, 100, '2023-09-01 00:00:00'),
(2, 200, '2023-09-02 00:00:00'),
(3, 300, '2023-09-03 00:00:00'),
(4, 400, '2023-09-04 00:00:00'),
(5, 500, '2023-09-05 00:00:00'),
(6, 600, '2023-09-06 00:00:00'),
(7, 700, '2023-09-07 00:00:00'),
(8, 800, '2023-09-08 00:00:00'),
(9, 900, '2023-09-09 00:00:00'),
(1, 1000, '2023-09-10 00:00:00'),
(2, 1100, '2023-09-11 00:00:00'),
(3, 1200, '2023-09-12 00:00:00'),
(4, 1300, '2023-09-13 00:00:00'),
(5, 1400, '2023-09-14 00:00:00'),
(6, 1500, '2023-09-15 00:00:00'),
(7, 1600, '2023-09-16 00:00:00'),
(8, 1700, '2023-09-17 00:00:00'),
(9, 1800, '2023-09-18 00:00:00'),
(1, 1900, '2023-09-19 00:00:00'),
(2, 2000, '2023-09-20 00:00:00');