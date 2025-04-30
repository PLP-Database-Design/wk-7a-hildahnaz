WITH NormalizedProducts AS (
  SELECT 
    101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
  UNION ALL
  SELECT 
    101, 'John Doe', 'Mouse'
  UNION ALL
  SELECT 
    102, 'Jane Smith', 'Tablet'
  UNION ALL
  SELECT 
    102, 'Jane Smith', 'Keyboard'
  UNION ALL
  SELECT 
    102, 'Jane Smith', 'Mouse'
  UNION ALL
  SELECT 
    103, 'Emily Clark', 'Phone'
)
SELECT * FROM NormalizedProducts;





DESCRIBE Customers;
-- Insert distinct customer information into the Customers table
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create a new table for OrderItems
CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- Insert order item details into the OrderItems table
INSERT INTO OrderItems (OrderID, ProductID, Quantity)
SELECT OrderID,
       CASE Product
           WHEN 'Laptop' THEN 1
           WHEN 'Mouse' THEN 2
           WHEN 'Tablet' THEN 3
           WHEN 'Keyboard' THEN 4
           WHEN 'Phone' THEN 5
           ELSE NULL -- Handle unknown products appropriately
       END AS ProductID,
       Quantity
FROM OrderDetails;

-- Drop the original OrderDetails table
DROP TABLE OrderDetails;

-- Rename the new tables to reflect the original name (optional, for clarity)
ALTER TABLE Customers RENAME TO OrderDetails_Customers;
ALTER TABLE OrderItems RENAME TO OrderDetails;

-- Display the new tables
SELECT * FROM OrderDetails_Customers;
SELECT * FROM OrderDetails;


