-- Geteilter Key-Value-Speicher fuer die Bologna-App
create table if not exists trip_state (
  key text primary key,
  value text not null,
  updated_at timestamptz default now()
);

alter table trip_state enable row level security;

-- Bewusst offen: Jeder mit dem Link (anon key) darf lesen und schreiben,
-- exakt wie der geteilte Artefakt-Speicher. Nicht fuer sensible Daten nutzen.
create policy "anon read"   on trip_state for select using (true);
create policy "anon insert" on trip_state for insert with check (true);
create policy "anon update" on trip_state for update using (true);
create policy "anon delete" on trip_state for delete using (true);
