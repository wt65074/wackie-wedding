# Supabase Setup

## 1. Install Supabase CLI

```bash
brew install supabase/tap/supabase
supabase login
```

## 2. Link and Run Migrations

```bash
# Link to your project (get ref from dashboard URL: https://[REF].supabase.co)
supabase link --project-ref your-project-ref

# Run all migrations
supabase db push
```

## 3. Create Storage Bucket

1. Go to **Storage** in Supabase Dashboard
2. Click **New bucket**
3. Name it `polaroid-images`
4. Enable **Public bucket** (allows public read access)

## 4. Configure CORS

Go to **Project Settings > API > CORS Allowed Origins** and add:

- `http://localhost:5173` (Vite dev server)
- `https://your-domain.com` (your production domain)

## 5. Get API Credentials

From **Project Settings > API**, copy:

- **Project URL** → `VITE_SUPABASE_URL`
- **anon public** key → `VITE_SUPABASE_ANON_KEY`

Add these to your `.env.local` file (see `.env.example` for template).

## 6. Upload Images

1. Go to **Storage > polaroid-images**
2. Upload image files
3. Add entries to the `polaroids` table with matching `image_path` values

Example:
```sql
INSERT INTO polaroids (image_path, caption, photo_date)
VALUES ('my-photo.jpg', 'Beach day', '2024-06-15');
```
