-- name: CreateTask :one
INSERT INTO tasks (
  title,
  description,
  priority,
  status
) VALUES ($1, $2, $3, $4)
RETURNING *;


-- name: ListTasks :many
SELECT * FROM tasks WHERE id = $1;

-- name: ListsTasks :many
SELECT * FROM tasks
ORDER BY created_at DESC;

-- name: UpdateTask :one
UPDATE tasks
SET title = $1,
    description = $2,
    priority = $3,
    status = $4
WHERE id = $5
RETURNING *;

-- name: DeleteTask :exec
DELETE FROM tasks WHERE id = $1
RETURNING *;
