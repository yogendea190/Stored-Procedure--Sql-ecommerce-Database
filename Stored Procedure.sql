---Stored Procedure – Get Orders by Customer

DELIMITER $$

CREATE PROCEDURE GetOrdersByCustomer(
    IN p_customer_id INT
)
BEGIN
    SELECT 
        o.order_id,
        o.order_date,
        o.total_price
    FROM `Order` o
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_date DESC;
END$$

DELIMITER ;

CALL GetOrdersByCustomer(1);



---Stored Procedure – Update Stock After Purchase

DELIMITER $$

CREATE PROCEDURE UpdateProductStock(
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_stock INT;

    SELECT stock INTO v_stock
    FROM Product
    WHERE product_id = p_product_id;

    IF v_stock >= p_quantity THEN
        UPDATE Product
        SET stock = stock - p_quantity
        WHERE product_id = p_product_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock available';
    END IF;
END$$

DELIMITER ;

CALL UpdateProductStock(3, 2);


---Function – Calculate Total Order Price

DELIMITER $$

CREATE FUNCTION GetOrderTotal(p_order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(quantity * price) INTO total
    FROM Order_Item
    WHERE order_id = p_order_id;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;

SELECT GetOrderTotal(1);


---Function – Customer Full Name


DELIMITER $$

CREATE FUNCTION GetCustomerFullName(p_customer_id INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(200);

    SELECT CONCAT(first_name, ' ', last_name) INTO full_name
    FROM Customer
    WHERE customer_id = p_customer_id;

    RETURN full_name;
END$$

DELIMITER ;

SELECT GetCustomerFullName(2);



