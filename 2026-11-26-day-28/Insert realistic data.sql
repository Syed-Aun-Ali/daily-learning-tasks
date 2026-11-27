use xyz;
-- ==========================================
-- PART 1: DROP EXISTING TABLES (Reverse Order)
-- ==========================================
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS project_members;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS users;

-- ==========================================
-- PART 2: CREATE TABLES WITH CONSTRAINTS
-- ==========================================

-- 1. Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    role ENUM('Admin', 'Lead', 'Developer', 'Editor', 'Designer', 'Intern') DEFAULT 'Intern',
    status ENUM('Active', 'Inactive', 'Pending') DEFAULT 'Active',
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Projects Table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    status ENUM('Planning', 'In Progress', 'Completed', 'On Hold') DEFAULT 'Planning',
    created_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_projects_creator
        FOREIGN KEY (created_by) REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 3. Project Members Junction Table (Many-to-Many)
CREATE TABLE project_members (
    user_id INT NOT NULL,
    project_id INT NOT NULL,
    member_role ENUM('Owner', 'Member', 'Viewer') DEFAULT 'Member',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, project_id),
    CONSTRAINT fk_pm_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_pm_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Tasks Table
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    assigned_to INT NULL,
    title VARCHAR(200) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') DEFAULT 'Medium',
    status ENUM('Todo', 'In Progress', 'Review', 'Done') DEFAULT 'Todo',
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tasks_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_tasks_assignee
        FOREIGN KEY (assigned_to) REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 5. Comments Table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT NOT NULL,
    user_id INT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comments_task
        FOREIGN KEY (task_id) REFERENCES tasks(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_comments_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================
-- PART 3: SEED REALISTIC DATA
-- ==========================================

-- 1. Seed 7 Users
INSERT INTO users (id, full_name, email, role, status, city) VALUES
(1, 'Noman Tariq', 'noman@example.com', 'Lead', 'Active', 'Lahore'),
(2, 'Aun Raza', 'aun@example.com', 'Developer', 'Active', 'Karachi'),
(3, 'Asad Malik', 'asad@example.com', 'Editor', 'Active', 'Karachi'),
(4, 'Sara Khan', 'sara.k@example.com', 'Designer', 'Active', 'Islamabad'),
(5, 'Bilal Ahmed', 'bilal@example.com', 'Intern', 'Active', 'Lahore'),
(6, 'Zoya Qureshi', 'zoya@example.com', 'Developer', 'Inactive', 'Karachi'),
(7, 'Hamza Ali', 'hamza@example.com', 'Intern', 'Pending', 'Multan');

-- 2. Seed 5 Projects
INSERT INTO projects (id, title, description, status, created_by) VALUES
(1, 'Client Portal Redesign', 'Responsive web portal overhaul with role-based dashboards.', 'In Progress', 1),
(2, 'Educational Video Series', '10-episode animated explainer series for YouTube.', 'In Progress', 3),
(3, 'Inventory & POS API', 'RESTful backend service for retail stock tracking.', 'Planning', 2),
(4, 'Brand Identity Refresh', 'Updated UI kit, typography, and social media templates.', 'Completed', 4),
(5, 'Internal Onboarding App', 'Task checklist and documentation hub for new interns.', 'On Hold', 1);

-- 3. Seed 15 Project Members
INSERT INTO project_members (user_id, project_id, member_role) VALUES
(1, 1, 'Owner'), (2, 1, 'Member'), (4, 1, 'Member'), (5, 1, 'Viewer'),
(3, 2, 'Owner'), (1, 2, 'Member'), (5, 2, 'Member'),
(2, 3, 'Owner'), (1, 3, 'Member'), (6, 3, 'Member'),
(4, 4, 'Owner'), (3, 4, 'Member'), (2, 4, 'Viewer'),
(1, 5, 'Owner'), (5, 5, 'Member');

-- 4. Seed 50 Tasks (10 per project)
INSERT INTO tasks (id, project_id, assigned_to, title, priority, status, due_date) VALUES
-- Project 1: Client Portal Redesign (Tasks 1-10)
(1, 1, 2, 'Set up authentication middleware', 'High', 'Done', '2026-10-15'),
(2, 1, 4, 'Design dashboard wireframe', 'High', 'Done', '2026-10-18'),
(3, 1, 2, 'Build user profile settings endpoint', 'Medium', 'In Progress', '2026-11-29'),
(4, 1, 5, 'Write unit tests for login form', 'Low', 'Todo', '2026-12-05'),
(5, 1, 1, 'Review pull requests for navigation bar', 'Medium', 'Review', '2026-11-28'),
(6, 1, 4, 'Export SVG icons for sidebar', 'Low', 'Done', '2026-10-22'),
(7, 1, 2, 'Optimize SQL queries on dashboard load', 'High', 'In Progress', '2026-12-01'),
(8, 1, NULL, 'Configure staging server SSL certificate', 'High', 'Todo', '2026-12-10'),
(9, 1, 5, 'Test mobile responsiveness on Safari', 'Medium', 'Todo', '2026-12-08'),
(10, 1, 1, 'Finalize sprint 2 release notes', 'Low', 'Todo', '2026-12-12'),

-- Project 2: Educational Video Series (Tasks 11-20)
(11, 2, 3, 'Draft script for Episode 1', 'High', 'Done', '2026-09-10'),
(12, 2, 3, 'Edit voiceover audio for Episode 2', 'High', 'Done', '2026-09-20'),
(13, 2, 5, 'Organize raw footage and b-roll folders', 'Medium', 'Done', '2026-09-25'),
(14, 2, 3, 'Sync dinosaur character animations in Ep 3', 'High', 'In Progress', '2026-11-30'),
(15, 2, 1, 'Review Episode 3 pacing and transitions', 'Medium', 'Review', '2026-12-02'),
(16, 2, 4, 'Design YouTube thumbnail template', 'Medium', 'Done', '2026-10-05'),
(17, 2, 3, 'Color grade Episode 4 scenes', 'Medium', 'Todo', '2026-12-06'),
(18, 2, 5, 'Add English subtitles to Episodes 1-3', 'Low', 'In Progress', '2026-12-04'),
(19, 2, NULL, 'Source background music tracks', 'Low', 'Todo', '2026-12-11'),
(20, 2, 3, 'Export 4K master file for Episode 4', 'High', 'Todo', '2026-12-15'),

-- Project 3: Inventory & POS API (Tasks 21-30)
(21, 3, 2, 'Design normalized ER schema for products', 'High', 'Done', '2026-11-01'),
(22, 3, 2, 'Create JWT token refresh logic', 'High', 'In Progress', '2026-11-29'),
(23, 3, 6, 'Build barcode lookup endpoint', 'Medium', 'Todo', '2026-12-07'),
(24, 3, 1, 'Audit API rate limiting rules', 'High', 'Todo', '2026-12-09'),
(25, 3, 2, 'Implement stock low-threshold alerts', 'Medium', 'Todo', '2026-12-14'),
(26, 3, NULL, 'Write Swagger API documentation', 'Low', 'Todo', '2026-12-18'),
(27, 3, 2, 'Set up Docker container for local MySQL', 'Medium', 'Done', '2026-11-05'),
(28, 3, 6, 'Create CSV bulk import parser', 'Medium', 'In Progress', '2026-12-03'),
(29, 3, 1, 'Define role permissions for cashiers', 'High', 'Review', '2026-11-28'),
(30, 3, 2, 'Benchmark checkout transaction speed', 'Low', 'Todo', '2026-12-20'),

-- Project 4: Brand Identity Refresh (Tasks 31-40)
(31, 4, 4, 'Define primary and secondary color palette', 'High', 'Done', '2026-08-10'),
(32, 4, 4, 'Select web and print typography pairings', 'Medium', 'Done', '2026-08-14'),
(33, 4, 3, 'Write brand voice and tone guidelines', 'Medium', 'Done', '2026-08-18'),
(34, 4, 4, 'Design vector logo variations', 'High', 'Done', '2026-08-22'),
(35, 4, 2, 'Publish CSS custom variables package', 'Low', 'Done', '2026-08-25'),
(36, 4, 4, 'Create LinkedIn and X banner templates', 'Low', 'Done', '2026-08-28'),
(37, 4, 1, 'Approve final brand stylebook PDF', 'High', 'Done', '2026-09-01'),
(38, 4, 3, 'Update email signature HTML templates', 'Low', 'Done', '2026-09-03'),
(39, 4, 4, 'Archive legacy logo assets', 'Low', 'Done', '2026-09-05'),
(40, 4, 5, 'Verify contrast ratios for accessibility', 'Medium', 'Done', '2026-09-06'),

-- Project 5: Internal Onboarding App (Tasks 41-50)
(41, 5, 1, 'Outline 30-day intern training roadmap', 'High', 'Done', '2026-10-10'),
(42, 5, 5, 'Draft Git workflow cheat sheet', 'Medium', 'Review', '2026-11-15'),
(43, 5, 5, 'Create MySQL setup guide for Windows', 'Medium', 'Done', '2026-10-20'),
(44, 5, NULL, 'Build interactive quiz module', 'Low', 'Todo', '2026-12-22'),
(45, 5, 1, 'Connect Slack webhook notifications', 'Medium', 'Todo', '2026-12-25'),
(46, 5, 5, 'Record Loom walkthrough of local dev setup', 'Low', 'In Progress', '2026-12-05'),
(47, 5, NULL, 'Add progress bar component to checklist', 'Low', 'Todo', '2026-12-28'),
(48, 5, 1, 'Review security policy acknowledgment form', 'High', 'Todo', '2026-12-30'),
(49, 5, 5, 'Fix typo on welcome screen header', 'Low', 'Done', '2026-10-25'),
(50, 5, NULL, 'Deploy internal beta to company subdomain', 'Medium', 'Todo', '2027-01-05');

-- 5. Seed 100 Comments (2 per task across Tasks 1-50)
INSERT INTO comments (task_id, user_id, body) VALUES
(1, 2, 'JWT middleware is implemented and tested locally.'),
(1, 1, 'Looks solid. Merged into the main branch.'),
(2, 4, 'Uploaded both light and dark mode wireframes to Figma.'),
(2, 2, 'The grid spacing works well for the widget cards.'),
(3, 2, 'Working on avatar upload validation rules next.'),
(3, 4, 'Make sure max file size is capped at 2MB.'),
(4, 5, 'Setting up Jest test cases for empty password fields.'),
(4, 2, 'Ping me if you need mock API responses.'),
(5, 1, 'Left two minor comments on mobile menu z-index.'),
(5, 2, 'Updated the CSS z-index and pushed a fix.'),
(6, 4, 'All 24 sidebar icons exported cleanly at 24x24px.'),
(6, 5, 'Integrated them into the navigation component.'),
(7, 2, 'Added composite index on project_id and status.'),
(7, 1, 'Query execution time dropped from 180ms to 14ms.'),
(8, 1, 'Waiting on DNS propagation before issuing Let’s Encrypt cert.'),
(8, 2, 'Let me know once HTTPS is live so I can update callback URLs.'),
(9, 5, 'Found a slight horizontal overflow on iPhone SE viewport.'),
(9, 4, 'Reduce card padding from 24px to 16px on small screens.'),
(10, 1, 'Drafted bullet points for all completed auth features.'),
(10, 3, 'Proofread and formatted the changelog markdown.'),
(11, 3, 'First draft of Episode 1 script is ready for review.'),
(11, 1, 'Great hook in the opening 15 seconds.'),
(12, 3, 'Removed background hiss and normalized audio levels.'),
(12, 5, 'Audio sync matches the storyboard timestamps now.'),
(13, 5, 'All raw clips renamed using YYYY-MM-DD_scene convention.'),
(13, 3, 'Much easier to locate takes now, thanks!'),
(14, 3, 'Adjusting lip-sync keyframes for the doctor explanation scene.'),
(14, 1, 'The pacing on the second diagram cutaway feels much smoother.'),
(15, 1, 'Reviewed rough cut—transition at 04:12 needs a quick fade.'),
(15, 3, 'Added a 10-frame cross-dissolve at 04:12.'),
(16, 4, 'Created high-contrast thumbnail layout with bold title slot.'),
(16, 3, 'Tested readability at mobile preview size—looks sharp.'),
(17, 3, 'Applying warm LUT preset across outdoor scenes.'),
(17, 4, 'Keep skin tones neutral so the graphics pop.'),
(18, 5, 'Finished SRT caption file for Episode 1.'),
(18, 3, 'Double-checked technical spelling in the captions.'),
(19, 3, 'Need two upbeat royalty-free lo-fi tracks.'),
(19, 5, 'Shared a folder with four cleared instrumental options.'),
(20, 3, 'Queued H.264 4K render at 45 Mbps bitrate.'),
(20, 1, 'Upload to unlisted review link once export finishes.'),
(21, 2, 'Normalized tables to 3NF and added foreign key constraints.'),
(21, 1, 'Approved schema—good call using ON DELETE SET NULL for cashiers.'),
(22, 2, 'Implemented refresh token rotation in Redis.'),
(22, 1, 'Verify old refresh tokens are invalidated immediately on reuse.'),
(23, 6, 'Started mapping EAN-13 barcode validation.'),
(23, 2, 'Return a 404 JSON payload if SKU is missing.'),
(24, 1, 'Set limit to 100 requests per minute per API key.'),
(24, 2, 'Added X-RateLimit-Remaining headers to responses.'),
(25, 2, 'Triggered alert when stock drops below reorder_level.'),
(25, 1, 'Batch daily alerts so managers do not get spammed.'),
(26, 2, 'Will generate OpenAPI 3.0 YAML once endpoints stabilize.'),
(26, 1, 'Include example curl commands for auth headers.'),
(27, 2, 'Added docker-compose.yml with MySQL 8.0 and phpMyAdmin.'),
(27, 5, 'Spun it up locally with zero errors.'),
(28, 6, 'Handling UTF-8 BOM characters in exported Excel CSVs.'),
(28, 2, 'Skip empty trailing rows during import.'),
(29, 1, 'Cashiers should not be able to issue full refunds without lead PIN.'),
(29, 2, 'Added supervisor_override boolean check to refund route.'),
(30, 2, 'Simulated 500 concurrent checkout requests.'),
(30, 1, 'Zero deadlocks recorded under load.'),
(31, 4, 'Finalized primary navy and warm amber accent hex codes.'),
(31, 1, 'Approved by stakeholders.'),
(32, 4, 'Paired Inter for UI with Merriweather for long-form headings.'),
(32, 3, 'Looks clean across both desktop and PDF exports.'),
(33, 3, 'Added do/don’t examples for customer support replies.'),
(33, 4, 'Included the tone checklist on page 4 of the brand guide.'),
(34, 4, 'Uploaded horizontal, stacked, and monochrome SVG logos.'),
(34, 2, 'Favicon SVG renders crisply at 16px.'),
(35, 2, 'Published tokens.css to the shared frontend repo.'),
(35, 4, 'Verified all color variables match Figma tokens.'),
(36, 4, 'Exported safe-zone guides for social profile headers.'),
(36, 3, 'Updated our official company channels with the new banners.'),
(37, 1, 'Signed off on v1.0 of the brand stylebook.'),
(37, 4, 'Shared read-only link with the whole team.'),
(38, 3, 'Tested HTML signature in Gmail and Outlook desktop.'),
(38, 2, 'Inline CSS keeps formatting intact across clients.'),
(39, 4, 'Moved 2024–2025 brand files into the _archive directory.'),
(39, 1, 'Thanks for keeping the shared drive tidy.'),
(40, 5, 'All primary button text passes WCAG AA 4.5:1 contrast.'),
(40, 4, 'Adjusted muted gray text slightly darker to pass as well.'),
(41, 1, 'Broken down into Week 1 Git, Week 2 SQL, and Week 3 APIs.'),
(41, 5, 'The structured milestones are super helpful.'),
(42, 5, 'Added rebase vs merge visual examples.'),
(42, 1, 'Add a quick note on never force-pushing to main.'),
(43, 5, 'Documented port 3306 conflict troubleshooting steps.'),
(43, 2, 'This will save new interns a lot of setup time.'),
(44, 1, 'Paused until core checklist features are completed.'),
(44, 5, 'Ready to draft 10 SQL quiz questions whenever this resumes.'),
(45, 1, 'Will post daily summary of overdue onboarding tasks.'),
(45, 2, 'Webhook URL can be stored in .env.'),
(46, 5, 'Recorded first half covering repository cloning and env setup.'),
(46, 3, 'Keep total runtime under 6 minutes.'),
(47, 5, 'Simple percentage calculation based on checked items.'),
(47, 4, 'Use the primary brand blue for the progress fill.'),
(48, 1, 'Need legal sign-off on NDA wording first.'),
(48, 2, 'Can store timestamp and IP hash upon acceptance.'),
(49, 5, 'Fixed spelling in the main hero greeting.'),
(49, 1, 'Merged.'),
(50, 1, 'Holding deployment until Q1 intern cohort starts.'),
(50, 2, 'Subdomain DNS record is already reserved.');

SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users
UNION ALL SELECT 'projects', COUNT(*) FROM projects
UNION ALL SELECT 'project_members', COUNT(*) FROM project_members
UNION ALL SELECT 'tasks', COUNT(*) FROM tasks
UNION ALL SELECT 'comments', COUNT(*) FROM comments;