-- REQUETE 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- Résultat attendu : 8 focaccias triées de A à Z
-- Code : 
SELECT nom FROM focaccia ORDER BY nom ASC;
-- Résultat obtenu : Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione
-- Écart : aucun


-- REQUETE 2 : Afficher le nombre total d'ingrédients
-- Résultat attendu : 25 ingrédients
-- Code : 
SELECT COUNT(*) FROM ingredient;
-- Résultat obtenu : 25 ingrédients
-- Écart : aucun


-- REQUETE 3 : Afficher le prix moyen des focaccias
-- Résultat attendu : 10.375€
-- Code :
SELECT AVG(prix) FROM focaccia;
-- Résultat obtenu : 10.375€
-- Écart : aucun


-- REQUETE 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- Résultat attendu : 12 boissons triées de A à Z avec leur marque associée
-- Code : 
SELECT boisson.nom, marque.nom 
FROM BOISSON 
JOIN marque on boisson.id_marque = marque.id_marque 
ORDER BY boisson.nom ASC;
-- Résultat obtenu : 12 boissons triées de A à Z avec leur marque associée
-- Écart : aucun


-- REQUETE 5 : Afficher la liste des ingrédients pour une Raclaccia
-- Résultat attendu : 7 ingrédients : Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
-- Code : 
SELECT ingredient.nom 
FROM focaccia_comprend_ingredient 
JOIN ingredient on focaccia_comprend_ingredient.id_ingredient = ingredient.id_ingredient 
JOIN focaccia on focaccia_comprend_ingredient.id_focaccia = focaccia.id_focaccia 
WHERE focaccia.nom = 'Raclaccia';
-- Résultat obtenu : 7 ingrédients : Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
-- Écart : aucun



-- REQUETE 6 : Afficher le nom et le nombre d'ingrédients pour chaque foccacia
-- Résultat attendu :  Mozaccia (10 ingrédients), Gorgonzollaccia (8 ingrédients), Raclaccia (7 ingrédients), Emmentalaccia (7 ingrédients), Tradizione (9 ingrédients), Hawaienne (9 ingrédients), Américaine (8 ingrédients), Paysanne (12 ingrédients)
-- Code : 
SELECT focaccia.nom, COUNT(id_ingredient) 
FROM focaccia_comprend_ingredient  JOIN focaccia on focaccia_comprend_ingredient.id_focaccia = focaccia.id_focaccia
GROUP BY(focaccia.nom);
-- Résultat obtenu : Mozaccia (10 ingrédients), Gorgonzollaccia (8 ingrédients), Raclaccia (7 ingrédients), Emmentalaccia (7 ingrédients), Tradizione (9 ingrédients), Hawaienne (9 ingrédients), Américaine (8 ingrédients), Paysanne (12 ingrédients)
-- Écart : aucun


-- REQUETE 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- Résultat attendu : Paysanne (12 ingrédients)
-- Code : 
SELECT focaccia.nom, COUNT(id_ingredient) 
FROM focaccia_comprend_ingredient  JOIN focaccia on focaccia_comprend_ingredient.id_focaccia = focaccia.id_focaccia
GROUP BY(focaccia.nom)
ORDER BY COUNT(id_ingredient) DESC
LIMIT 1;
-- Résultat obtenu : Paysanne (12 ingrédients)
-- Écart : aucun

-- REQUETE 8 : Afficher la liste des focaccia qui contiennent de l'ail
-- Résultat attendu : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne
-- Code : 
SELECT focaccia.nom
FROM focaccia_comprend_ingredient
JOIN focaccia on focaccia_comprend_ingredient.id_focaccia = focaccia.id_focaccia
JOIN ingredient on focaccia_comprend_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Ail';
-- Résultat obtenu : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne
-- Écart : aucun

-- REQUETE 9 : Afficher la liste des ingrédients inutilisés
-- Résultat attendu : Salami, Tomate cerise
-- Code : 
SELECT nom  
FROM ingredient
WHERE id_ingredient NOT IN
(SELECT id_ingredient
FROM focaccia_comprend_ingredient);
-- Résultat obtenu : Salami, Tomate cerise
-- Écart : aucun

-- REQUETE 10 : Afficher la liste des focaccia qui n'ont pas de champignons
-- Résultat attendu : Hawaienne, Américaine
-- Code : 
SELECT nom  
FROM focaccia 
WHERE id_focaccia NOT IN
(SELECT id_focaccia 
FROM focaccia_comprend_ingredient 
JOIN ingredient 
ON focaccia_comprend_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Champignon');
-- Résultat obtenu : Hawaienne, Américaine
-- Écart : aucun