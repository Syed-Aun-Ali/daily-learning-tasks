USE XYZ;

INSERT INTO users (username, email, bio, birth_date, account_balance, is_active)
VALUES
    ('ali',   'ali@mail.com',   'Love coding',  '2000-01-10', 100.00, TRUE),
    ('sara',  'sara@mail.com',  'Designer',     '1998-05-12', 250.00, TRUE),
    ('zain',  'zain@mail.com',  NULL,           '2001-03-20',  50.00, TRUE),
    ('hina',  'hina@mail.com',  'Reader',       '1995-07-08', 500.00, TRUE),
    ('omar',  'omar@mail.com',  'Gamer',        '1999-11-15',   0.00, FALSE),
    ('ayesha','ayesha@mail.com','Artist',       '2002-02-25', 300.00, TRUE),
    ('bilal', 'bilal@mail.com', NULL,           '1997-09-30', 150.00, TRUE),
    ('noor',  'noor@mail.com',  'Traveler',     '2000-06-18', 400.00, TRUE),
    ('hamza', 'hamza@mail.com', 'Old account',  '1996-12-01',  20.00, FALSE),
    ('maha',  'maha@mail.com',  'Student',      '2003-04-14', 350.00, TRUE);