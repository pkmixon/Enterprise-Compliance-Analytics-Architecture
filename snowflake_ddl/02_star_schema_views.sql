-- Semantic views for BI consumption
CREATE OR REPLACE VIEW public.dim_regulation AS
SELECT 
    DISTINCT issue AS regulation_id,
    sub_issue AS regulation_sub_category,
    product AS product_category
FROM public.raw_complaints;

CREATE OR REPLACE VIEW public.dim_entity AS
SELECT 
    DISTINCT complaint_id AS entity_id,
    consumer_disputed AS dispute_flag,
    timely_response AS timely_resolution_flag
FROM public.raw_complaints;

CREATE OR REPLACE VIEW public.fact_issues AS
SELECT
    complaint_id AS issue_id,
    date_received,
    product,
    SUBSTRING(complaint_narrative, 1, 100) AS narrative_summary
FROM public.raw_complaints;
