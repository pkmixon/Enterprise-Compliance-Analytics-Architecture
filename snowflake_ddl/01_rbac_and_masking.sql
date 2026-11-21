-- Role-based access control setup
CREATE ROLE IF NOT EXISTS compliance_analyst;
-- Grant necessary privileges
GRANT USAGE ON SCHEMA public TO ROLE compliance_analyst;
-- Dynamic data masking policy
CREATE OR REPLACE MASKING POLICY pii_mask AS (val STRING) RETURNS STRING ->
  CASE
    WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN', 'COMPLIANCE_OFFICER') THEN val
    ELSE '***MASKED***'
  END;
