CREATE TABLE IF NOT EXISTS cart (
  id SERIAL PRIMARY KEY,
  person_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS category (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
CREATE TABLE Image (
    id SERIAL PRIMARY KEY,
    fileName VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES Product (id)
);
CREATE TABLE Order (
    id SERIAL PRIMARY KEY,
    number VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    person_id INT NOT NULL,
    count INT NOT NULL,
    price FLOAT NOT NULL,
    dateTime TIMESTAMP NOT NULL,
    status VARCHAR(255) NOT NULL,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES Product (id),
    CONSTRAINT fk_person
        FOREIGN KEY (person_id)
        REFERENCES Person (id)
);
CREATE TABLE Person (
    id SERIAL PRIMARY KEY,
    login VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    CONSTRAINT uq_login
        UNIQUE (login)
);
CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    price FLOAT NOT NULL,
    warehouse TEXT NOT NULL,
    seller TEXT NOT NULL,
    category_id INT NOT NULL,
    dateTime TIMESTAMP,
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES Category (id)
);