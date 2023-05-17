CREATE TRIGGER loanTrigger AFTER UPDATE
ON loan
BEGIN
    UPDATE BookCopy
    SET daysLoaned = daysLoaned + (julianday(NEW.dateBack) - julianday(OLD.dateOut))
    WHERE BookCopy.ISBN = OLD.ISBN AND BookCopy.copyNumber = OLD.copyNumber;
END;