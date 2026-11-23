USE XYZ;

SELECT user_id, username, account_balance
FROM users;

-- Get only active users
SELECT username, is_active
FROM users
WHERE is_active = TRUE;

-- Get users with balance greater than 200
SELECT username, account_balance
FROM users
WHERE account_balance > 200;

-- Sort by balance from highest to lowest
SELECT username, account_balance
FROM users
ORDER BY account_balance DESC;

-- Sort usernames alphabetically (A to Z)
SELECT username
FROM users
ORDER BY username ASC;

-- Get the first 3 users
SELECT username
FROM users
LIMIT 3;

-- Combine all four: Top 3 richest active users
SELECT username, account_balance
FROM users
WHERE is_active = TRUE
ORDER BY account_balance DESC
LIMIT 3;