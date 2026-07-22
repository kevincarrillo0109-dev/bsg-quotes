-- Run this once in the Supabase SQL editor (same project as the `quotes` table)
-- before using the Pricing Calculator tab. The anon key used by the app can read/
-- write rows, but cannot create tables, so this step has to be done manually.

create table if not exists subcontractor_rates (
  id text primary key,
  data text not null,
  created_at timestamptz default now()
);

alter table subcontractor_rates disable row level security;

-- Note: this table stores each rate as an opaque JSON blob in `data` (the anon
-- key can't ALTER TABLE). The `is_pinned` flag used by the "Pin as default
-- contractor" feature lives inside that JSON payload as `isPinned`, alongside
-- `service`, `subcontractor`, `unit`, `price`, etc. — no schema migration
-- needed here, it works with the table as created above.
