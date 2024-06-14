-- DO $$
-- BEGIN
--     IF NOT EXISTS (
--         SELECT 1 
--         FROM pg_class c
--         JOIN pg_namespace n ON n.oid = c.relnamespace
--         WHERE c.relname = 'idx_cve_records_data'
--         AND n.nspname = 'cve'
--     ) THEN
--         CREATE INDEX idx_cve_records_data ON cve.cves USING gin (data);
--     END IF;
-- END $$;

CREATE INDEX idx_cve_records_data ON cve.cves USING gin (data);
