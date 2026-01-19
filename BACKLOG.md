# Backlog

## To Do

- [ ] **Deploy security gate Edge Functions** - Generate a strong secret with `openssl rand -base64 32`, then run `supabase secrets set SECURITY_GATE_SECRET="<secret>"`. Deploy Edge Functions with `supabase functions deploy verify-security-answer` and `supabase functions deploy verify-token`. Apply migration with `supabase db push`. Add security questions to the database via Supabase dashboard.

- [ ] **Implement signed URLs for image protection** - Switch from `getPublicUrl()` to `createSignedUrls()` (batch API) in Supabase Storage to prevent direct image URL sharing. Requires making the `polaroids` bucket private and updating `usePolaroidImages.ts`. Note: This only provides meaningful security if combined with authentication (see "question gate" item above).

- [ ] **Implement pagination for polaroid loading** - Instead of loading all images at once, load first 10 and serve from those, then fetch another batch of 10 in the background. Only use the expanded pool (20) once the background fetch completes. Continue this pattern for larger datasets.

- [ ] **Warm load images in background** - Further optimize image loading by preloading before they're needed. Options: inject `<link rel="preload">` tags for first N images, start fetch in a `<script>` before React hydrates, use `requestIdleCallback` to load during idle time, or add service worker caching for offline support.

- [ ] **Refactor usePolaroidImages to use proper React patterns** - Currently uses module-level static variables (`allImages`, `usedIds`, `loadPromise`) which is not idiomatic React. Refactor to use React Context for shared state, useRef for mutable values, or a data-fetching library like TanStack Query.

- [ ] **Generate Supabase types and set up CI** - Use `supabase gen types typescript` to generate TypeScript types from the database schema. Set up GitHub Actions for Supabase CI (run migrations, generate types, validate schema changes on PRs).

- [ ] **Set up automatic deployment for Supabase Edge Functions** - Configure GitHub Actions or similar CI/CD to automatically deploy edge functions when changes are pushed. Look into `supabase functions deploy` in CI, managing secrets, and deployment strategies (deploy all vs. only changed functions).

- [ ] **Improve iMessage/text sharing preview** - Add Open Graph meta tags (`og:title`, `og:description`, `og:image`) and Apple-specific tags for a polished link preview in iMessage. Design a nice preview image that represents the site well instead of the generic fallback.

- [ ] **Add fun text with text effects** - Replace or enhance "Coming Soon" with playful text like "Will + Jackie = Wackie". Add CSS text effects (animations, gradients, shadows, letter spacing transitions, etc.) to make it feel whimsical and celebratory.

- [ ] **Add reactions to photos** - Let visitors react to polaroids with emojis (❤️, 😂, 🥹, etc.). Store reactions in Supabase and display reaction counts on each photo. Consider showing who reacted or keeping it anonymous.

- [ ] **Move "press space" hint to bottom** - Move the "press space to leave a message" text to the bottom of the screen in a light, subtle font. Should be unobtrusive but discoverable.

- [ ] **Add rotating cute quips as subtitle** - Replace the current subtitle with animated/scrolling text showing cute quips about Will & Jackie. Could include things like "tying the knot", "two become one", "partner in crime acquired", etc. Text should move/animate to add visual interest.

- [ ] **Add security questions before leaving messages** - Before users can leave a message, prompt them to answer one of three personal questions about Will & Jackie (e.g., "Where did we meet?", "What's our dog's name?"). Store validation in localStorage so they only need to answer once. Prevents random strangers from leaving messages.

## In Progress

## Done
