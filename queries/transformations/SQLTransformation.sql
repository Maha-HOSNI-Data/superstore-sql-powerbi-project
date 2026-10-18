
-- Nettoyage des données
-- vérifier les vrais doublons
SELECT 
    [Row_ID],
    COUNT(*) AS Nombre
FROM [Superstore].[dbo].[Sample_Superstore]
GROUP BY [Row_ID]
HAVING COUNT(*) > 1;

-- les valeurs manquantes
SELECT
    COUNT(*) AS Total_lignes,
    SUM(CASE WHEN [Customer_ID] IS NULL THEN 1 ELSE 0 END) AS Customer_ID_vides,
    SUM(CASE WHEN [Product_ID] IS NULL THEN 1 ELSE 0 END) AS Product_ID_vides,
    SUM(CASE WHEN [Sales] IS NULL THEN 1 ELSE 0 END) AS Sales_vides,
    SUM(CASE WHEN [Profit] IS NULL THEN 1 ELSE 0 END) AS Profit_vides,
    SUM(CASE WHEN [Order_ID] IS NULL THEN 1 ELSE 0 END) AS Order_ID_vides,
    SUM(CASE WHEN [Order_Date] IS NULL THEN 1 ELSE 0 END) AS Order_Date_vides,
    SUM(CASE WHEN [Category] IS NULL THEN 1 ELSE 0 END) AS Category_vides,
    SUM(CASE WHEN [Region] IS NULL THEN 1 ELSE 0 END) AS Region_vides,
    SUM(CASE WHEN [Quantity] IS NULL THEN 1 ELSE 0 END) AS Quantity_vides,
    SUM(CASE WHEN [Discount] IS NULL THEN 1 ELSE 0 END) AS Discount_vides
FROM [Superstore].[dbo].[Sample_Superstore];

-- les valeurs manquantes
SELECT *
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Profit] IS NULL;

-- vérifier les dates
-- Détecte les livraisons antérieures aux commandes
SELECT *
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Ship_Date] < [Order_Date];

-- examination des valeurs
SELECT
    MIN([Sales]) AS Min_Sales,
    MAX([Sales]) AS Max_Sales,
    AVG([Sales]) AS Avg_Sales
FROM [Superstore].[dbo].[Sample_Superstore];

-- valeur négative de Sales peut être anormale,
SELECT *
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Sales] < 0;

-- Détecte les quantités nulles ou négatives
SELECT *
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Quantity] <= 0;

-- Adapté si les remises sont exprimées entre 0 et 1
SELECT *
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Discount] < 0
   OR [Discount] > 1;

-- Conserve les lignes dont le Profit n'est pas NULL
SELECT *
INTO [Superstore].[dbo].[Sample_Superstore_clean]
FROM [Superstore].[dbo].[Sample_Superstore]
WHERE [Profit] IS NOT NULL;

-- Vérifie que le filtre a bien fonctionné
SELECT COUNT(*) AS Profit_NULL
FROM [Superstore].[dbo].[Sample_Superstore_clean]
WHERE [Profit] IS NULL;


SELECT *
FROM [Superstore].[dbo].[Sample_Superstore_clean]
