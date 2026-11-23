-- 1 ________________________
SELECT username AS user_name, email AS user_email
FROM users
WHERE username LIKE 'a%'
ORDER BY user_name ASC;
-- 2 ________________________
SELECT username AS member, bio AS profile_bio, account_balance AS balance
FROM users
WHERE bio LIKE '%er%'
ORDER BY balance DESC;
-- 3 ________________________
SELECT username AS four_letter_user, is_active AS active_status
FROM users
WHERE username LIKE '____'
ORDER BY four_letter_user ASC;
-- 4 ________________________
SELECT username AS user_name, account_balance AS balance
FROM users
WHERE username IN ('ali', 'sara', 'hina', 'noor')
ORDER BY balance ASC;
-- 5 ________________________
SELECT u.username AS active_user, u.account_balance AS balance
FROM users AS u
WHERE u.account_balance IN (100.00, 250.00, 300.00, 500.00)
  AND u.is_active = TRUE
ORDER BY active_user ASC;
-- 6 ________________________
SELECT username AS user_name, birth_date AS dob
FROM users
WHERE username NOT IN ('omar', 'hamza')
ORDER BY dob DESC;
-- 7 ________________________
SELECT username AS user_name, account_balance AS balance
FROM users
WHERE account_balance BETWEEN 100.00 AND 350.00
ORDER BY balance DESC;
-- 8 ________________________
SELECT username AS user_name, birth_date AS birthday
FROM users
WHERE birth_date BETWEEN '1997-01-01' AND '1999-12-31'
ORDER BY birthday ASC;
-- 9 ________________________
SELECT u.username AS member, u.account_balance AS balance
FROM users AS u
WHERE u.is_active = TRUE
  AND u.account_balance BETWEEN 150.00 AND 400.00
ORDER BY member ASC;
-- 10 ________________________
SELECT user_id AS id, username AS user_name, bio AS profile_bio
FROM users
WHERE bio IS NULL
ORDER BY id ASC;
-- 11 ________________________
SELECT username AS user_name, bio AS about_me
FROM users
WHERE bio IS NOT NULL
ORDER BY user_name ASC;
-- 12 ________________________
SELECT u.username AS user_name, u.account_balance AS balance
FROM users AS u
WHERE u.bio IS NULL
  AND u.is_active = TRUE
ORDER BY balance DESC;
-- 13 ________________________
SELECT username AS user_name, bio AS role_or_hobby
FROM users
WHERE bio IS NOT NULL
  AND (bio LIKE '%t' OR bio LIKE '%r')
ORDER BY user_name ASC;
-- 14 ________________________
SELECT username AS user_name, account_balance AS balance, birth_date AS dob
FROM users
WHERE username IN ('ali', 'sara', 'zain', 'bilal', 'noor', 'maha')
  AND account_balance BETWEEN 50.00 AND 400.00
ORDER BY balance DESC;
-- 15 ________________________
SELECT u.username AS user_name, u.birth_date AS dob, u.bio AS bio_text
FROM users AS u
WHERE u.birth_date BETWEEN '1995-01-01' AND '2000-12-31'
  AND u.bio IS NOT NULL
ORDER BY dob DESC;





