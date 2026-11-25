+------------------+       +-----------------------+       +------------------+
|      users       |       |    project_members    |       |     projects     |
+------------------+       +-----------------------+       +------------------+
| PK id            |1     *| FK user_id            |*     1| PK id            |
|    full_name     |-------| FK project_id         |-------|    title         |
|    email         |       |    member_role        |       |    description   |
|    role          |       |    joined_at          |       |    status        |
|    status        |       | PK (user_id,          |       | FK created_by    |
+------------------+       |     project_id)       |       |    created_at    |
   |  |                    +-----------------------+       +------------------+
   |  |                                                            |
   |  | 1                                                          | 1
   |  |                                                            |
   |  |                    +-----------------------+               |
   |  |                    |         tasks         |               |
   |  |                    +-----------------------+               |
   |  |                    | PK id                 |               |
   |  +-------------------*| FK assigned_to        |               |
   |                     * | FK project_id         |---------------+
   |                       |    title              |
   |                       |    priority           |
   |                       |    status             |
   |                       |    due_date           |
   |                       +-----------------------+
   |                                   |
   | 1                                 | 1
   |                                   |
   |                       +-----------------------+
   |                       |       comments        |
   |                       +-----------------------+
   |                       | PK id                 |
   +----------------------*| FK user_id            |
                         * | FK task_id            |
                           |    body               |
                           |    created_at         |
                           +-----------------------+