-- ==============================================================================
-- TLAB MONITOR - DATABASE INITIALIZATION SCRIPT
-- ==============================================================================

-- 1. AUDIT LOG TABLE (Stores alert history and decisions)
CREATE TABLE IF NOT EXISTS tlab_audit (
  id           SERIAL PRIMARY KEY,
  execution_id VARCHAR(100),
  action       VARCHAR(50)  NOT NULL,
  target       VARCHAR(100) NOT NULL,
  reason       TEXT,
  decision     VARCHAR(20),
  result       TEXT,
  proposed_at  TIMESTAMP DEFAULT NOW(),
  decided_at   TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_audit_target_time 
  ON tlab_audit(target, proposed_at DESC);

-- 2. RAG MEMORY TABLE (AI Memory - Successful lessons learned)
CREATE TABLE IF NOT EXISTS tlab_memory (
  id          SERIAL PRIMARY KEY,
  container   VARCHAR(100),
  issue_type  VARCHAR(50),
  symptoms    TEXT,
  root_cause  TEXT,
  solution    TEXT NOT NULL,
  outcome     VARCHAR(20) NOT NULL,
  confidence  FLOAT DEFAULT 0.85,
  learned_at  TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_memory_container 
  ON tlab_memory(container, confidence DESC);

-- 3. EVENTS TABLE (Time-Series Metrics Storage)
CREATE TABLE IF NOT EXISTS tlab_events (
  id          SERIAL PRIMARY KEY,
  container   VARCHAR(100),
  cpu         FLOAT,
  memory      FLOAT,
  metric_type VARCHAR(50) DEFAULT 'cpu_ram',
  recorded_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_events_container_time 
  ON tlab_events(container, recorded_at DESC);

-- 4. SEED DATA
INSERT INTO tlab_memory 
  (container, issue_type, symptoms, root_cause, solution, outcome, confidence) 
VALUES 
  ('system', 'Crash Loop', 'Container crashed consecutively more than 3 times', 'Configuration error or resource shortage', 'Automatically lock Circuit Breaker, await engineer intervention', 'SUCCESS', 1.00)
ON CONFLICT DO NOTHING;