use xyz;

SELECT 
    u.id AS user_id,
    u.full_name,
    u.role,
    COUNT(t.id) AS total_tasks,
    SUM(CASE WHEN t.status = 'Done' THEN 1 ELSE 0 END) AS completed_tasks,
    SUM(CASE WHEN t.status IN ('Todo', 'In Progress', 'Review') THEN 1 ELSE 0 END) AS open_tasks,
    MIN(t.due_date) AS earliest_due_date,
    MAX(t.due_date) AS latest_due_date
FROM users u
LEFT JOIN tasks t ON u.id = t.assigned_to
GROUP BY u.id, u.full_name, u.role
ORDER BY total_tasks DESC;


SELECT 
    p.id AS project_id,
    p.title AS project_title,
    p.status AS project_status,
    COUNT(t.id) AS overdue_task_count,
    MIN(t.due_date) AS oldest_overdue_date,
    ROUND(AVG(DATEDIFF(CURDATE(), t.due_date)), 1) AS avg_days_overdue
FROM projects p
INNER JOIN tasks t ON p.id = t.project_id
WHERE t.due_date < CURDATE()
  AND t.status != 'Done'
GROUP BY p.id, p.title, p.status
HAVING COUNT(t.id) >= 1
ORDER BY overdue_task_count DESC;