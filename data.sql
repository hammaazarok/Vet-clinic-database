/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Agumon',
        TO_DATE('2020-02-03', 'YYYY-MM-DD'),
        0,
        true,
        10.23
    );
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Gabumon',
        TO_DATE('2018-11-15', 'YYYY-MM-DD'),
        2,
        false,
        8
    );
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Pikachu',
        TO_DATE('2021-1-7', 'YYYY-MM-DD'),
        1,
        false,
        15.04
    );        
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (
        'Devimon',
        TO_DATE('2017-5-12', 'YYYY-MM-DD'),
        5,
        true,
        11
    );    