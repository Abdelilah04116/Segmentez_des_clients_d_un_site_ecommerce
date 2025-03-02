 
 -- En excluant les commandes annulées, quelles sont les commandes récentes de moins de 3 mois que les clients ont reçues avec au moins 3
--                                jours de retard ?

 -- 1 -- la determination de la dernier date dans la table order pour determiner la dernier commande 
 SELECT max(order_approved_at) AS dernier_date FROM orders;

 -- 2 -- Ajouter une colonne "duree_livraison" de type INTEGER (en jours) qui calcule laduree delivraison 
ALTER TABLE orders ADD COLUMN duree_livraison INT;

-- 3 -- Mettre à jour la colonne avec la différence entre "order_estimated_delivery_date" et "order_delivered_customer_date"
UPDATE orders 
SET duree_livraison = JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_estimated_delivery_date);--les dates sont au format YYYY-MM-DD (OK pour JULIANDAY());

-- 4 -- l'affichage des valeur de la colonne duree_livraison qui ont en retard 

SELECT duree_livraison FROM orders WHERE duree_livraison <= 3;

-- 5 -- la selection des dernier 3 mois 

 SELECT * 
FROM orders
WHERE order_approved_at >= DATE('2018-09-03 17:40:06', '-3 months');

-- 6 -- on determiner les commande non  annulée

 SELECT *
FROM  orders
WHERE order_status != 'canceled';

-- 7 -- Alors maintenet on rassembler ces requet 

SELECT *
FROM orders
WHERE order_status != 'canceled' AND order_approved_at >= DATE('2018-09-03 17:40:06', '-3 months') AND duree_livraison <= 3;


---------------------------------------------------------------------------------

--- 2 --- Qui sont les vendeurs ayant généré un chiffre d'affaires de plus de 100000 Real sur des commandes livrées via Olist ?


-- 1 -- la selection de seller_id et de prix de vent 
SELECT seller_id,price FROM order_items ;

-- 2 --  Identifie les vendeurs dont le total des ventes dépasse 100 000.
SELECT seller_id, SUM(price) AS total_ventes 
FROM order_items
GROUP BY seller_id
HAVING total_ventes >= 100000;

-- 3 -- Liste des ventes avec leur statut pour les commandes livrées. 
SELECT order_items.seller_id, order_items.price, orders.order_status
FROM order_items
JOIN orders ON order_items.order_id = orders.order_id
WHERE orders.order_status='delivered';

-- 4 -- Affiche les vendeurs ayant généré au moins 100 000 en ventes sur des commandes livrées.
SELECT order_items.seller_id, SUM(order_items.price) AS total_ventes 
FROM order_items 
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY seller_id
HAVING total_ventes >= 100000 AND orders.order_status='delivered' ;

--------------------------------------------------------------------------------------------

--- 3 --- Qui sont les nouveaux vendeurs (moins de 3 mois d'ancienneté) qui sont déjà très engagés avec la plateforme
                                        -- (ayant déjà vendu plus de 30 produits) ?


-- 1 -- on trouve les seller_id qui ont plus de 30 order effectuer 
SELECT order_items.seller_id, COUNT(orders.order_id) AS total_orders
FROM order_items
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY order_items.seller_id
HAVING total_orders >=30 AND order_status = 'delivered';

-- 2 -- on trouve les vendeur qui ont moins de 3 mois d'ancienete  et puisque on est pas d'une colonne qui m'indiquer la date d'inscription de vendeur alors
              -- on conseder la premier vent comme sa premiere date sur la platforme 

SELECT seller_id, premiere_vente, total_produits_vendus
FROM (
    SELECT oi.seller_id, 
           MIN(o.order_purchase_timestamp) AS premiere_vente, 
           COUNT(oi.product_id) AS total_produits_vendus
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    GROUP BY oi.seller_id
) AS ventes_sellers
WHERE premiere_vente >= DATE('2018-09-03 17:40:06', '-3 months')
AND total_produits_vendus > 30;

-------------------------------------------------------------------------------

--- 5 --- Question : Quels sont les 5 codes postaux, enregistrant plus de 30 reviews, avec le pire review score moyen sur les 12 derniers mois ?

SELECT c.customer_zip_code_prefix, 
       COUNT(r.review_id) AS total_reviews, 
       AVG(r.review_score) AS moyenne_score
FROM order_reviews r
JOIN orders o ON r.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE r.review_creation_date >= DATE('2018-09-03 17:40:06', '-12 months')
GROUP BY c.customer_zip_code_prefix
HAVING total_reviews > 30
ORDER BY moyenne_score ASC
LIMIT 5;
