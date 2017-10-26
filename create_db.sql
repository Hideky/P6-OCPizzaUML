
CREATE SEQUENCE ocpizza.ingredient_ingredient_id_seq;

CREATE TABLE ocpizza.Ingredient (
                ingredient_id INTEGER NOT NULL DEFAULT nextval('ocpizza.ingredient_ingredient_id_seq'),
                name VARCHAR NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id)
);


ALTER SEQUENCE ocpizza.ingredient_ingredient_id_seq OWNED BY ocpizza.Ingredient.ingredient_id;

CREATE SEQUENCE ocpizza.restaurant_restaurant_id_seq;

CREATE TABLE ocpizza.Restaurant (
                restaurant_id INTEGER NOT NULL DEFAULT nextval('ocpizza.restaurant_restaurant_id_seq'),
                address VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                postalcode INTEGER NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (restaurant_id)
);


ALTER SEQUENCE ocpizza.restaurant_restaurant_id_seq OWNED BY ocpizza.Restaurant.restaurant_id;

CREATE TABLE ocpizza.Stock (
                ingredient_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                quantity NUMERIC NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (ingredient_id, restaurant_id)
);


CREATE SEQUENCE ocpizza.product_product_id_seq;

CREATE TABLE ocpizza.Product (
                product_id INTEGER NOT NULL DEFAULT nextval('ocpizza.product_product_id_seq'),
                description VARCHAR,
                name VARCHAR NOT NULL,
                estimatedPers VARCHAR,
                price NUMERIC NOT NULL,
                CONSTRAINT product_pk PRIMARY KEY (product_id)
);


ALTER SEQUENCE ocpizza.product_product_id_seq OWNED BY ocpizza.Product.product_id;

CREATE TABLE ocpizza.Compound (
                product_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity NUMERIC NOT NULL,
                CONSTRAINT compound_pk PRIMARY KEY (product_id, ingredient_id)
);


CREATE SEQUENCE ocpizza.employees_client_id_seq;

CREATE TABLE ocpizza.Employee (
                employee_id INTEGER NOT NULL DEFAULT nextval('ocpizza.employees_client_id_seq'),
                firstname VARCHAR NOT NULL,
                lastname VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                address VARCHAR NOT NULL,
                restaurant_id INTEGER NOT NULL,
                CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);


ALTER SEQUENCE ocpizza.employees_client_id_seq OWNED BY ocpizza.Employee.employee_id;

CREATE SEQUENCE ocpizza.client_client_id_seq;

CREATE TABLE ocpizza.Client (
                client_id INTEGER NOT NULL DEFAULT nextval('ocpizza.client_client_id_seq'),
                firstname VARCHAR NOT NULL,
                lastname VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                address VARCHAR NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (client_id)
);


ALTER SEQUENCE ocpizza.client_client_id_seq OWNED BY ocpizza.Client.client_id;

CREATE SEQUENCE ocpizza.orders_order_id_seq;

CREATE TABLE ocpizza.Orders (
                order_id INTEGER NOT NULL DEFAULT nextval('ocpizza.orders_order_id_seq'),
                client_id INTEGER NOT NULL,
                address VARCHAR NOT NULL,
                payed BOOLEAN DEFAULT FALSE NOT NULL,
                date DATE NOT NULL,
                prepared BOOLEAN DEFAULT FALSE NOT NULL,
                finished BOOLEAN DEFAULT FALSE NOT NULL,
                CONSTRAINT orders_pk PRIMARY KEY (order_id)
);


ALTER SEQUENCE ocpizza.orders_order_id_seq OWNED BY ocpizza.Orders.order_id;

/*CREATE UNIQUE INDEX order_idx
 ON ocpizza.Orders
 ( payed ASC, date ASC, prepared ASC, finished ASC );

CLUSTER order_idx ON ocpizza.Orders;*/

CREATE TABLE ocpizza.Ordered (
                order_id INTEGER NOT NULL,
                product_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT ordered_pk PRIMARY KEY (order_id, product_id)
);


ALTER TABLE ocpizza.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES ocpizza.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Compound ADD CONSTRAINT ingredient_compound_fk
FOREIGN KEY (ingredient_id)
REFERENCES ocpizza.Ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Employee ADD CONSTRAINT restaurants_employees_fk
FOREIGN KEY (restaurant_id)
REFERENCES ocpizza.Restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Stock ADD CONSTRAINT restaurant_ingredient_fk
FOREIGN KEY (restaurant_id)
REFERENCES ocpizza.Restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Compound ADD CONSTRAINT product_compound_fk
FOREIGN KEY (product_id)
REFERENCES ocpizza.Product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Ordered ADD CONSTRAINT product_ordered_fk
FOREIGN KEY (product_id)
REFERENCES ocpizza.Product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Orders ADD CONSTRAINT client_order_fk
FOREIGN KEY (client_id)
REFERENCES ocpizza.Client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Ordered ADD CONSTRAINT order_ordered_fk
FOREIGN KEY (order_id)
REFERENCES ocpizza.Orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;