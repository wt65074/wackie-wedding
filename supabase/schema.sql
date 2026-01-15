-- Polaroids table for storing image metadata
CREATE TABLE polaroids (
  id SERIAL PRIMARY KEY,
  image_path TEXT NOT NULL,
  caption TEXT,
  photo_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fast lookups by ID
CREATE INDEX idx_polaroids_id ON polaroids(id);

-- Enable Row Level Security
ALTER TABLE polaroids ENABLE ROW LEVEL SECURITY;

-- Allow public read access (CORS will restrict origins)
CREATE POLICY "Allow public read access" ON polaroids
  FOR SELECT
  USING (true);
