INSERT INTO ocpizza.client(firstname, lastname, email, address) VALUES 
	('Jean', 'Dupont', 'jean.dupont@gmail.com', '7 Rue Charles De Gaulle'),
	('Sacha', 'Ketchum', 'sacha.ketchum@bourgpalette.com', '1 Avenue du Bourg Palette'),
	('Lucifer', 'Morningstar', 'lucifer.morningstar@hell.com', '3 Rue du Lux'),
	('Barry', 'Allen', 'barry.allen@justiceleague.com', '1 Impasse S.T.A.R Lab'),
	('Jaina', 'Proudmoore', 'jaina.proudmoore@kirintor.com', 'Citadelle Pourpre, Dalaran');

INSERT INTO ocpizza.restaurant(address, city, postalcode) VALUES
	('34 Rue des rillettes', 'Le Mans', 72000),
    ('12 Rue du nougat', 'Montelimar', 26200);

INSERT INTO ocpizza.product(name, description, estimatedpers, price) VALUES
	('Pizza 4 Fromages', 'Une pizza avec du fromage à raclette, de chèvre, du gruyère et de la mozzarella', 4, 16.50),
	('Pizza Royale', 'Un classique de la pizza au jambon, mozzarella et champignon de Paris', 4, 17.50),
	('Pizza au Saumon', 'Saumon de Norvège, pomme de terre, mozzarella, légère crème fraiche et un peu d aneth', 4, 18.0);

INSERT INTO ocpizza.employee(firstname, lastname, email, address, restaurant_id) VALUES
	('Alexandre', 'Astier', 'alexandre.astier@kaamelott.com', '2 Avenue de la table ronde', 1),
    ('Anduin', 'Wrynn', 'anduin.wrynn@stormwind.com', '1 Rue du Trône', 1),
    ('Illidan', 'Stormrage', 'illidan.stormrage@outland.com', '46 Rue du Temple Noir', 2),
    ('Lina', 'the Slayer', 'lina.theslayer@dota.com', '23ème dune du desert de Misrule', 2),
    ('Crystal', 'Maiden', 'crystal.maiden@dota.com', '8ème grotte de Icewrack', 2);

INSERT INTO ocpizza.ingredient(name) VALUES 
	('Pâte à pizza'),
    ('Mozzarella'),
    ('Champignon de Paris'),
    ('Tomate'),
    ('Pomme de terre'),
    ('Aneth'),
    ('Crème fraiche'),
    ('Saumon de norvège'),
    ('Frommage de chèvre'),
    ('Gruyère'),
    ('Fromage à raclette'),
    ('Jambon');

INSERT INTO ocpizza.stock(ingredient_id, restaurant_id, quantity) VALUES 
	(1, 1, 53),
	(2, 1, 61),
	(3, 1, 91),
	(4, 1, 32),
	(5, 1, 3),
	(6, 1, 12),
	(7, 1, 64),
	(8, 1, 36),
	(9, 1, 56),
	(10, 1, 45),
	(11, 1, 16),
	(12, 1, 84),
	(1, 2, 72),
	(2, 2, 70),
	(3, 2, 99),
	(4, 2, 84),
	(5, 2, 76),
	(6, 2, 25),
	(7, 2, 8),
	(8, 2, 4),
	(9, 2, 16),
	(10, 2, 43),
	(11, 2, 61),
	(12, 2, 71);

INSERT INTO ocpizza.compound(product_id, ingredient_id, quantity) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(1, 9, 2),
	(1, 10, 2),
	(1, 11, 2),
	(2, 1, 1),
	(2, 2, 2),
	(2, 3, 4),
	(2, 4, 2),
	(2, 12, 3),
	(3, 1, 1),
	(3, 4, 1),
	(3, 5, 2),
	(3, 6, 4),
	(3, 7, 2),
	(3, 8, 9);

INSERT INTO ocpizza.orders(client_id, address, payed, date, prepared, finished)	VALUES 
	(2, '6 Rue du Plateau Indigo', TRUE, '2017-10-12', TRUE, TRUE),
    (3, '5 Avenue des paradoxe', TRUE, '2017-10-12', TRUE, TRUE),
    (4, 'Dans la SpeedForce', FALSE, '2017-10-12', TRUE, FALSE),
    (3, '3 Rue du Lux', TRUE, '2017-10-12', FALSE, FALSE),
    (1, '7 Rue Charles De Gaulle', FALSE, '2017-10-12', TRUE, FALSE),
    (5, '34 Rue des rillettes', FALSE, '2017-10-12', FALSE, FALSE);

INSERT INTO ocpizza.ordered(order_id, product_id, quantity)	VALUES 
	(1, 1, 2),
    (1, 2, 3),
    (1, 3, 1),
    (2, 2, 2),
    (2, 3, 3),
    (3, 1, 9),
    (4, 1, 4),
    (4, 3, 2),
    (5, 1, 1),
    (5, 2, 6),
    (6, 1, 4),
    (6, 2, 7),
    (6, 3, 2);