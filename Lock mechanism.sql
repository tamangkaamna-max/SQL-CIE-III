LOCK TABLES accounts WRITE
UPDATE accounts
SET balance = balance + 500
WHERE account_id = 101;
UNLOCK TABLES;
