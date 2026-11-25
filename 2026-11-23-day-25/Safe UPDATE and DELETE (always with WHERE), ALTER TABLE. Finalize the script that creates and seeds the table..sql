DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    role VARCHAR(50) DEFAULT 'Intern',
    status VARCHAR(20) DEFAULT 'Active',
    city VARCHAR(50),
    tasks_completed INT DEFAULT 0,
    joined_date DATE
);

INSERT INTO users (full_name, email, role, status, city, tasks_completed, joined_date) VALUES
('Aun', 'aun@example.com', 'Developer', 'Active', 'Karachi', 12, '2026-09-01'),
('Asad', 'asad@example.com', 'Editor', 'Active', 'Karachi', 18, '2026-08-15'),
('Noman', 'noman@example.com', 'Lead', 'Active', 'Lahore', 35, '2026-06-10'),
('Sara Khan', 'sara.k@example.com', 'Designer', 'Inactive', 'Islamabad', 4, '2026-07-22'),
('Bilal Ahmed', 'bilal@example.com', 'Intern', 'Pending', NULL, 0, '2026-10-05'),
('Zoya Tariq', 'zoya@example.com', 'Developer', 'Inactive', 'Karachi', 9, '2026-08-30'),
('Hamza Ali', 'hamza@example.com', 'Intern', 'Pending', NULL, 0, '2026-11-01');