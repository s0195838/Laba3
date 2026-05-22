
CREATE TABLE Category (
    id            NUMBER PRIMARY KEY,
    name          VARCHAR2(200) NOT NULL
);


CREATE TABLE Customer (
    id                NUMBER PRIMARY KEY,
    name              VARCHAR2(150) NOT NULL,
    date_reg          NUMBER 
);


CREATE TABLE Product (
    id            NUMBER PRIMARY KEY,
    category_id   NUMBER NOT NULL,
    name          VARCHAR2(300) NOT NULL,
    price         NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id)
        REFERENCES Category(id)
);


CREATE TABLE Orders (
    id              NUMBER PRIMARY KEY,
    date_create      DATE DEFAULT SYSDATE,
    status          VARCHAR2(50) ,
    sum    NUMBER
);


CREATE TABLE Cart_Item (
    id            NUMBER PRIMARY KEY,
    customer_id   NUMBER NOT NULL,
    product_id    NUMBER NOT NULL,
    order_id      NUMBER,
    CONSTRAINT fk_cart_customer FOREIGN KEY (customer_id)
        REFERENCES Customer(id),
    CONSTRAINT fk_cart_product FOREIGN KEY (product_id)
        REFERENCES Product(id),
    CONSTRAINT fk_cart_order FOREIGN KEY (order_id)
        REFERENCES Orders(id)
);


INSERT INTO Category (id, name) VALUES (1, 'Ноутбуки');
INSERT INTO Category (id, name) VALUES (2, 'Смартфоны');
INSERT INTO Category (id, name) VALUES (3, 'Аксессуары');

INSERT INTO Customer (id, name, date_reg)
VALUES (1, 'Иван Петров', 2025.0115);
INSERT INTO Customer (id, name, date_reg)
VALUES (2, 'Ольга Смирнова',2025.0220);
INSERT INTO Customer (id, name, date_reg)
VALUES (3, 'Алексей Иванов', 2025.0310);

INSERT INTO Product (id, category_id, name, price)
VALUES (1, 1, 'MacBook Air 15"', 1299.99);
INSERT INTO Product (id, category_id, name, price)
VALUES (2, 1, 'ThinkPad X1 Carbon', 1499.00 );
INSERT INTO Product (id, category_id, name, price)
VALUES (3, 2, 'iPhone 16 Pro', 999.00);
INSERT INTO Product (id, category_id, name, price)
VALUES (4, 2, 'Samsung Galaxy S25', 899.99);

INSERT INTO Orders (id, date_create, status, sum)
VALUES (1, DATE '2025-05-01', 'Доставлен', 1299.99);
INSERT INTO Orders (id,  date_create, status, sum)
VALUES (2, DATE '2025-05-10', 'В обработке', 1848.99);
INSERT INTO Orders (id, date_create, status,sum)
VALUES (3, DATE '2025-05-14', 'Новый', 999.00);

INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (1, 1, 1, 1);
INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (2, 2, 2, 2);
INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (3, 2, 2, 2);
INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (4, 1, 3, 3);
INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (5, 3, 4, NULL);
INSERT INTO Cart_Item (id, customer_id, product_id, order_id)
VALUES (6, 3, 3, NULL);



CREATE VIEW V_ORDERS_SUMMARY AS
SELECT
    o.id AS  order_id,
    o.date_create,
    o.status,
    o.sum,
    cu.name AS customer_name,
    cu.date_reg
FROM Orders o
JOIN Customer cu ON o.id = cu.id;
    






