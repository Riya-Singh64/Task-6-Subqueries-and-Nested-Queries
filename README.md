# Task-6-Subqueries-and-Nested-Queries

# Tools used: 
- MySQL Workbench

# Objectives:
- Use subqueries in 'SELECT', 'WHERE', and 'FROM' to filter or process data.

# Queries:
- select name, (select count(*) from orders where orders.customer_id = customers.customer_id) as total_orders from customers;
- select * from customers where customer_id in (select customer_id from orders);
- select * from customers c where exists (select 1 from orders o where o.customer_id = c.customer_id);
  'EXISTS' checks if a row exists in the orders table for each customer. It returns only customers who have at least one order.
   Difference from 'IN': 'IN' gives a list works well with static lists.
  'EXISTS' stops checking after finding the first match faster with large data.

- select customer_id, avg(amount) as avg_amount from (select customer_id, amount from orders) as order_data group by customer_id;
