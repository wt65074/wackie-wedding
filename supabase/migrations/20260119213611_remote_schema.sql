drop extension if exists "pg_net";


  create policy "allow_all 1rqgppj_0"
  on "storage"."objects"
  as permissive
  for select
  to public
using ((bucket_id = 'polaroids'::text));



