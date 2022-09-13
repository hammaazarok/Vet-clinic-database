/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth Date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);


-- add species to animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(250);