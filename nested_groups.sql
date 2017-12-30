CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(255) NOT NULL
);

CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(255) NOT NULL,
    parent_id INTEGER REFERENCES groups(id)
);

CREATE TABLE direct_memberships (
    user_id INTEGER REFERENCES users(id),
    group_id INTEGER REFERENCES groups(id)
);

CREATE FUNCTION is_member(input_user_id integer, input_group_id integer) RETURNS boolean
    LANGUAGE sql
    AS $$
  SELECT CASE WHEN (input_user_id, input_group_id) IN (SELECT user_id, group_id FROM direct_memberships) THEN true
              ELSE CASE WHEN (SELECT is_member(input_user_id, g.id) FROM groups g WHERE g.parent_id = input_group_id) THEN true
                        ELSE false
                        END
              END
$$;