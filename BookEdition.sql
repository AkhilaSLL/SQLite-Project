CREATE TABLE BookEdition (
    ISBN TEXT PRIMARY KEY
        CHECK (
                -- check the length of ISBN is exactly 5 characters:
                LENGTH(ISBN) == 5 AND
                -- check that ISBN only contains numerics from 0-9:
                CAST(CAST(ISBN AS INTEGER) AS TEXT) == ISBN AND
                -- validate ISBN by verifying the check digit:
                CAST(SUBSTR(ISBN,5,1) AS INTEGER) == CAST((3*(SUBSTR(ISBN,1,1) + SUBSTR(ISBN,3,1)) + 
                                                        7*(SUBSTR(ISBN,2,1) + SUBSTR(ISBN,4,1)))%10 AS INTEGER)
                ),
    title TEXT,
    author TEXT,
    publicationDate INTEGER,
    genre TEXT
);