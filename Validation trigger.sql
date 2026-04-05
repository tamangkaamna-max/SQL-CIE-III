DELIMITER //

CREATE TRIGGER check_balance
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_balance DECIMAL(10,2);

    IF NEW.txn_type = 'Withdraw' THEN
        SELECT balance INTO current_balance
        FROM accounts
        WHERE account_id = NEW.account_id;

        IF current_balance < NEW.amount THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient balance';
        END IF;
    END IF;
END //

DELIMITER ;
