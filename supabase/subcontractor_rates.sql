-- Run this once in the Supabase SQL editor (same project as the `quotes` table)
-- before using the Pricing Calculator tab. The anon key used by the app can read/
-- write rows, but cannot create tables, so this step has to be done manually.

create table if not exists subcontractor_rates (
  id text primary key,
  data text not null,
  created_at timestamptz default now()
);

alter table subcontractor_rates disable row level security;
