# Task 8 – Subqueries and Nested Queries 🔍

## 📌 Objective
The goal of this task is to practice using **subqueries** in SQL, including:
- **Scalar subqueries**
- **Correlated subqueries**
- Subqueries with **IN**
- Subqueries with **EXISTS**
- Subqueries inside the **FROM** clause

---

## 🗂️ Database Details
**Database Name:** `Ecommerce`

**Tables Used:**
- `Customer` – Stores customer information  
- `Product` – Stores product details  
- `Order` – Stores order details linked to customers  
- `Order_Item` – Stores ordered products with quantities and prices  

**Relationships:**
- Each order belongs to a customer (`customer_id` in `Order` table)  
- Each order contains one or more order items (`order_id` in `Order_Item` table)  
- Each order item refers to a product (`product_id` in `Product` table)  

---

## 💻 SQL Code Summary
Using the existing `Ecommerce` database schema:

Queries written include:
- **Scalar subqueries** in `SELECT` and `WHERE`
- **Correlated subqueries** referencing outer queries
- Subqueries with **IN** to filter matching values
- Subqueries with **EXISTS** for conditional checks
- Subqueries in **FROM** (derived tables) for aggregated data

---

## 📖 Key Concepts Learned
- **Scalar Subquery:** Returns a single value (can be used in `SELECT` or `WHERE`)
- **Correlated Subquery:** Uses values from the outer query in the subquery
- **IN:** Filters rows based on a list returned by the subquery
- **EXISTS:** Checks if the subquery returns any rows
- **FROM Subquery:** Creates a temporary table for further filtering or joining
- Subqueries can be nested multiple levels deep for complex data retrieval
- Choosing between **IN**, **EXISTS**, and **JOIN** depends on **performance** and **logic**

---

## 🛠 Tools Used
- **MySQL Workbench** – For creating and executing SQL queries  
- **GitHub** – For storing and sharing SQL scripts  
- **VS Code** – For writing `README.md` and SQL code files  

---

💡 *This task is part of the SQL Developer Internship series on GitHub.*
