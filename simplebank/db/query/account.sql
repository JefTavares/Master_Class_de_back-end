-- name: CreateAccount :one
INSERT INTO account (
  owner,
  balance,
  currency)
VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
select * from account 
where id = $1 limit 1;

-- name: ListAccounts :many
select * from account 
order by id
limit $1 
offset $2;

-- name: UpdateAccount :one
UPDATE account SET 
balance = $2
where id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM account WHERE id = $1;