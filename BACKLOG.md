# Backlog

## To Do

- [ ] **Implement signed URLs for image protection** - Switch from `getPublicUrl()` to `createSignedUrls()` (batch API) in Supabase Storage to prevent direct image URL sharing. Requires making the `polaroids` bucket private and updating `usePolaroidImages.ts`.

- [ ] **Implement pagination for polaroid loading** - Instead of loading all images at once, load first 10 and serve from those, then fetch another batch of 10 in the background. Only use the expanded pool (20) once the background fetch completes. Continue this pattern for larger datasets.

- [ ] **Warm load images in background** - Further optimize image loading by preloading before they're needed. Options: inject `<link rel="preload">` tags for first N images, start fetch in a `<script>` before React hydrates, use `requestIdleCallback` to load during idle time, or add service worker caching for offline support.

- [ ] **Refactor usePolaroidImages to use proper React patterns** - Currently uses module-level static variables (`allImages`, `usedIds`, `loadPromise`) which is not idiomatic React. Refactor to use React Context for shared state, useRef for mutable values, or a data-fetching library like TanStack Query.

- [ ] **Generate Supabase types and set up CI** - Use `supabase gen types typescript` to generate TypeScript types from the database schema. Set up GitHub Actions for Supabase CI (run migrations, generate types, validate schema changes on PRs).

## In Progress

## Done
