CREATE TABLE users_row (
  user_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);

CREATE TABLE users_columnar (
  user_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
)
using columnar;


-- insert data
DO
$$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO users_row (first_name, last_name, email) VALUES ('Mifta', 'Asidqi', 'miftahur' || i || '@gmail.com');
        INSERT INTO users_columnar (first_name, last_name, email) VALUES ('Mifta', 'Asidqi', 'miftahur' || i || '@gmail.com');
    END LOOP;
END
$$;

SELECT * FROM users_row;


WITH users_row_size AS (
    SELECT pg_size_pretty(pg_total_relation_size('users_row')) AS users_row_size
),
users_columnar_size AS (
    SELECT pg_size_pretty(pg_total_relation_size('users_columnar')) AS users_columnar_size
)
SELECT users_row_size, users_columnar_size
FROM users_row_size, users_columnar_size