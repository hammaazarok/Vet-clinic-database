/*Queries that provide answers to the questions from all projects.*/
-- Find all animals whose name ends in "mon". */
SELECT
    *
from
    animals
WHERE
    name Like '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT
    *
from
    animals
WHERE
    date_of_birth between TO_DATE('2016-01-01', 'YYYY-MM-DD')
    and TO_DATE('2019-12-31', 'YYYY-MM-DD');

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT
    *
from
    animals
WHERE
    neutered = true
    and escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT
    *
from
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg.
SELECT
    name,
    escape_attempts
from
    animals
WHERE
    weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT
    *
from
    animals
WHERE
    neutered = true;

-- Find all animals not named Gabumon.
SELECT
    *
from
    animals
WHERE
    name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT
    *
from
    animals
WHERE
    weight_kg >= 10.4
    and weight_kg <= 17.3;

-- first transcation 
BEGIN;

UPDATE
    animals
set
    species = 'unspecified';

SELECT
    *
FROM
    animals;

ROLLBACK;

-- second transcation
BEGIN;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

COMMIT;

SELECT
    *
FROM
    animals;

--third transcation 
BEGIN;

DELETE FROM
    animals;

ROLLBACK;

SELECT
    *
FROM
    animals;

--forth transcation
BEGIN;

DELETE from
    animals
WHERE
    date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

-- How many animals are there?
SELECT
    COUNT(*)
FROM
    animals;

-- How many animals have never tried to escape?
SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts < 0;

-- What is the average weight of animals?
SELECT
    AVG(weight_kg)
FROM
    animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT
    neutered,
    SUM(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
GROUP BY
    species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-01-01'
GROUP BY
    species;

-- What animals belong to Melody Pond?
SELECT
    A.name,
    O.full_name
FROM
    animals A
    JOIN owners O ON A.owner_id = O.id
WHERE
    O.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT
    A.name,
    S.name as "type"
FROM
    animals A
    JOIN species S ON A.species_id = S.id
WHERE
    S.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT
    full_name,
    name
FROM
    animals A FULL
    JOIN owners O on O.id = A.owner_id;

-- How many animals are there per species?
SELECT
    S.name,
    COUNT(*)
FROM
    animals A
    JOIN species S ON A.species_id = S.id
GROUP BY
    S.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT
    A.name,
    O.full_name as "owner"
FROM
    animals A
    JOIN owners O ON A.owner_id = O.id
    JOIN species S ON A.species_id = S.id
WHERE
    S.name = 'Digimon'
    AND O.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
    A.name,
    O.full_name as "owner"
FROM
    animals A
    JOIN owners O ON A.owner_id = O.id
WHERE
    A.escape_attempts = 0
    AND O.full_name = 'Dean Winchester';

-- Who owns the most animals? 
SELECT
    COUNT(*) as count,
    full_name
FROM
    animals as A
    JOIN owners O ON A.owner_id = O.id
GROUP BY
    full_name
ORDER BY
    count desc;