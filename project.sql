-- Create the brands table
CREATE TABLE brands (
  ID INTEGER PRIMARY KEY,
  NAME TEXT
);

-- Create the phones table
CREATE TABLE phones (
  ID INTEGER PRIMARY KEY,
  BRAND_ID INTEGER,
  MODEL TEXT,
  RELEASE_YEAR INTEGER,
  PRICE REAL
);

-- Insert data into the brands table
INSERT INTO brands VALUES 
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Google'),
(4, 'OnePlus'),
(5, 'Xiaomi');

-- Insert data into the phones table
INSERT INTO phones VALUES 
(1, 1, 'iPhone 14', 2022, 999.99),
(2, 2, 'Galaxy S22', 2022, 799.99),
(3, 3, 'Pixel 7', 2022, 599.99),
(4, 4, '9 Pro', 2021, 969.00),
(5, 5, 'Mi 11', 2021, 749.00),
(6, 1, 'iPhone 13', 2021, 799.00),
(7, 2, 'Galaxy S21', 2021, 699.99);

-- Select all data from phones
SELECT * FROM phones;

-- Filter phones with a price less than $800
SELECT * FROM phones
WHERE PRICE < 800;

-- Sort phones by release year in descending order
SELECT * FROM phones
ORDER BY RELEASE_YEAR DESC;

-- Filter phones priced under $800 and sort by release year
SELECT * FROM phones
WHERE PRICE < 800
ORDER BY RELEASE_YEAR DESC;

-- Join phones with brands to get brand names
SELECT 
    p.MODEL, 
    b.NAME AS BRAND, 
    p.RELEASE_YEAR, 
    p.PRICE
FROM 
    phones p
JOIN 
    brands b ON p.BRAND_ID = b.ID;

-- Average price of phones by brand
SELECT 
    b.NAME AS BRAND, 
    AVG(p.PRICE) AS AveragePrice
FROM 
    phones p
JOIN 
    brands b ON p.BRAND_ID = b.ID
GROUP BY 
    b.NAME
ORDER BY 
    AveragePrice DESC;
