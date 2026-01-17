-- Messages table for visitor messages
CREATE TABLE messages (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  text TEXT NOT NULL CHECK (char_length(text) <= 200),
  polaroid_id INT REFERENCES polaroids(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fast lookups by created_at
CREATE INDEX idx_messages_created_at ON messages(created_at DESC);

-- Enable Row Level Security
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Allow public read access
CREATE POLICY "Allow public read" ON messages
  FOR SELECT USING (true);

-- Allow public insert (wedding guests don't have accounts)
CREATE POLICY "Allow public insert" ON messages
  FOR INSERT WITH CHECK (true);
