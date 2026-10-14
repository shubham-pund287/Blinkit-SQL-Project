USE blinkitdb;

-- 1. Total Sales kitna hai
SELECT SUM(Sales) as Total_Sales FROM blinkit_data;

-- 2. Average Sales
SELECT AVG(Sales) as Avg_Sales FROM blinkit_data;

-- 3. Total Items kitne hai
SELECT COUNT(*) as Total_Items FROM blinkit_data;

-- 4. Average Rating
SELECT AVG(Rating) as Avg_Rating FROM blinkit_data;

-- 5. Fat Content ke hisab se Sales (Low Fat vs Regular)
SELECT Item_Fat_Content, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Item_Fat_Content;

-- 6. Item Type ke hisab se Sales (Top 5)
SELECT Item_Type, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Item_Type ORDER BY Total_Sales DESC LIMIT 5;

-- 7. Location Tier ke hisab se Sales
SELECT Outlet_Location_Type, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Outlet_Location_Type;

-- 8. Year ke hisab se Sales
SELECT Outlet_Establishment_Year, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Outlet_Establishment_Year ORDER BY Outlet_Establishment_Year;

-- 9. Outlet Size ka Sales % kitna hai
SELECT Outlet_Size, SUM(Sales) as Total_Sales,
SUM(Sales)*100.0 / (SELECT SUM(Sales) FROM blinkit_data) as Sales_Percentage
FROM blinkit_data GROUP BY Outlet_Size;

-- 10. Outlet Type ke hisab se Sales
SELECT Outlet_Type, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Outlet_Type;

-- 11. Sabse zyada bikne wala Outlet kaunsa hai
SELECT Outlet_Identifier, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Outlet_Identifier ORDER BY Total_Sales DESC LIMIT 1;

-- 12. Top 10 Selling Products
SELECT Item_Identifier, SUM(Sales) as Total_Sales 
FROM blinkit_data GROUP BY Item_Identifier ORDER BY Total_Sales DESC LIMIT 10;

-- 13. Rating ke hisab se Average Sales
SELECT Rating, AVG(Sales) as Avg_Sales 
FROM blinkit_data GROUP BY Rating ORDER BY Rating;

-- 14. Tier 1, Tier 2, Tier 3 me kaunsa Fat Content zyada bikta hai
SELECT Outlet_Location_Type, Item_Fat_Content, SUM(Sales) as Total_Sales
FROM blinkit_data GROUP BY Outlet_Location_Type, Item_Fat_Content;

-- 15. 2015 ke baad khule outlets ka performance
SELECT Outlet_Establishment_Year, COUNT(*) as Total_Items, SUM(Sales) as Total_Sales
FROM blinkit_data WHERE Outlet_Establishment_Year >= 2015
GROUP BY Outlet_Establishment_Year;
