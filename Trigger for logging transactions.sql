DELIMITER //

CREATE TRIGGER log_transaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    IF NEW.txn_type = 'Deposit' THEN
        SET msg = CONCAT('Transaction of ', NEW.amount, 
                         ' deposited for Account ', NEW.account_id);
    ELSE
        SET msg = CONCAT('Transaction of ', NEW.amount, 
                         ' withdrawn from Account ', NEW.account_id);
    END IF;

    INSERT INTO logs(message) VALUES (msg);
END //

DELIMITER ;
