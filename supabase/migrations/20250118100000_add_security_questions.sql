-- Security questions table
CREATE TABLE security_questions (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS - deny direct access to protect answers
ALTER TABLE security_questions ENABLE ROW LEVEL SECURITY;

-- RPC function to verify answers server-side (answers never sent to client)
CREATE OR REPLACE FUNCTION verify_security_answer(p_question_id BIGINT, p_answer TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM security_questions
    WHERE id = p_question_id
      AND LOWER(TRIM(answer)) = LOWER(TRIM(p_answer))
  );
END;
$$;

-- Public view for questions (excludes answers)
CREATE VIEW security_questions_public AS
SELECT id, question
FROM security_questions;

GRANT SELECT ON security_questions_public TO anon;

GRANT EXECUTE ON FUNCTION verify_security_answer TO anon;