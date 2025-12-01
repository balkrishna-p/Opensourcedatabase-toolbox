-- Show replication slots and their WAL retention impact.
SELECT
    slot_name,
    plugin,
    slot_type,
    active,
    pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), restart_lsn)) AS retained_wal,
    restart_lsn,
    confirmed_flush_lsn
FROM pg_replication_slots
ORDER BY retained_wal DESC;
