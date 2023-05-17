CREATE VIEW ReadingHistory AS
    SELECT clientId, CAST(SUBSTR(dateOut, 1, 4) AS INTEGER) AS yr, genre, COUNT(*) as numLoans 
    FROM loan
    JOIN BookEdition USING (ISBN)
    GROUP BY clientId, yr, genre;
