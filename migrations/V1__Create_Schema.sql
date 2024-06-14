DO $$
BEGIN
    -- Create schema if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.schemata
        WHERE schema_name = 'cve'
    )
    THEN
        EXECUTE 'CREATE SCHEMA cve';
    END IF;

    -- Set search path to the schema
    EXECUTE 'SET search_path TO cve';

    -- Create the table if it does not exist
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'cve' 
        AND table_name = 'cves'
    )
    THEN
        EXECUTE '
            CREATE TABLE cve.cves (
                id SERIAL PRIMARY KEY,
                cve_id TEXT UNIQUE NOT NULL,
                data JSONB NOT NULL,
                version INTEGER,
                UNIQUE(cve_id, version)
            )';
    END IF;
END $$;
