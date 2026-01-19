-- Add signature column to messages table
ALTER TABLE messages ADD COLUMN signature TEXT NOT NULL DEFAULT 'Anonymous' CHECK (char_length(signature) <= 50);
ALTER TABLE messages ALTER COLUMN signature DROP DEFAULT;

-- Increase text limit from 200 to 300 characters
ALTER TABLE messages DROP CONSTRAINT messages_text_check;
ALTER TABLE messages ADD CONSTRAINT messages_text_check CHECK (char_length(text) <= 300);
