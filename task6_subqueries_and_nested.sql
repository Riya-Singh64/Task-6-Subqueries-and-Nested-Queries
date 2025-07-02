use ecommerce;
create table customers (customer_id int primary key,name varchar(50),email varchar(100));
create table orders (order_id int primary key,customer_id int,product_name varchar(100),
  amount decimal(10,2), foreign key(customer_id) references customers(customer_id));
insert into customers (customer_id, name, email) values
(1, 'Riya Singh', 'riya@example.com'),
(2, 'Aarav Mehta', 'aarav@example.com'),
(3, 'Priya Jain', 'priya@example.com'),
(4, 'Karan Patel', 'karan@example.com');
insert into orders (order_id, customer_id, product_name, amount) values
(101, 1, 'Laptop', 55000.00),
(102, 2, 'Smartphone', 20000.00),
(103, 1, 'Headphones', 3000.00),
(104, 3, 'Tablet', 15000.00);
-- INNER JOIN (Customers with Orders)
select c.name, o.product_name, o.amount from customers c inner join orders o on 
c.customer_id = o.customer_id;
-- LEFT JOIN (All Customers, Even Without Orders)
select c.name, o.product_name, o.amount from customers c left join orders o on 
c.customer_id = o.customer_id;
-- RIGHT JOIN (All Orders, Even Without Customers) 
select c.name, o.product_name, o.amount from customers c right join orders o on
c.customer_id = o.customer_id;
-- FULL JOIN (All Customers and All Orders) 
select c.name, o.product_name, o.amount from customers c
left join orders o on c.customer_id = o.customer_id
union
select c.name, o.product_name, o.amount from customers c
right join orders o on  c.customer_id = o.customer_id;

-- task 6 ---
select name, (select count(*) from orders where orders.customer_id = customers.customer_id) as 
total_orders from customers;
select * from customers where customer_id in (select customer_id from orders);
select * from customers c where exists (select 1 from orders o where o.customer_id = c.customer_id);


