# Backlog

## To Do

- [ ] **Implement signed URLs for image protection** - Switch from `getPublicUrl()` to `createSignedUrls()` (batch API) in Supabase Storage to prevent direct image URL sharing. Requires making the `polaroids` bucket private and updating `usePolaroidImages.ts`.

- [ ] **Implement pagination for polaroid loading** - Instead of loading all images at once, load first 10 and serve from those, then fetch another batch of 10 in the background. Only use the expanded pool (20) once the background fetch completes. Continue this pattern for larger datasets.

## In Progress

## Done
