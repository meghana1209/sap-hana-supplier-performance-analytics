-- 05_procedure.sql
-- Stored procedure to calculate a supplier performance score
-- SAP HANA SQLScript style (adjust types/names for your HANA version if needed)

-- This procedure calculates a performance score per supplier based on:
--  - On-time delivery percentage (weight 70)
--  - Cost efficiency (weight 30) where lower spend yields higher points

CREATE OR REPLACE PROCEDURE CALC_SUPPLIER_PERFORMANCE (OUT RESULT TABLE (SUPPLIER_ID INTEGER, NAME NVARCHAR(200), TOTAL_DELIVERIES INTEGER, ON_TIME_PCT DECIMAL(5,2), TOTAL_SPEND DECIMAL(18,2), SCORE DECIMAL(5,2)))
LANGUAGE SQLSCRIPT
AS
BEGIN
  -- Intermediate aggregation
  RESULT = SELECT
    s.SUPPLIER_ID,
    s.NAME,
    COUNT(d.DELIVERY_ID) AS TOTAL_DELIVERIES,
    CASE WHEN COUNT(d.DELIVERY_ID) = 0 THEN 0 ELSE 100.0 * SUM(CASE WHEN d.STATUS='ON_TIME' THEN 1 ELSE 0 END)/COUNT(d.DELIVERY_ID) END AS ON_TIME_PCT,
    COALESCE(SUM(p.QUANTITY * p.UNIT_PRICE),0) AS TOTAL_SPEND,
    0.0 AS SCORE
  FROM SUPPLIER s
  LEFT JOIN PURCHASE_ORDER p ON p.SUPPLIER_ID = s.SUPPLIER_ID
  LEFT JOIN DELIVERY d ON d.PO_ID = p.PO_ID
  GROUP BY s.SUPPLIER_ID, s.NAME;

  -- Normalize spend to a 0..100 scale (lower spend -> higher normalized value)
  DECLARE max_spend DECIMAL(18,2) = (SELECT MAX(TOTAL_SPEND) FROM :RESULT);
  DECLARE min_spend DECIMAL(18,2) = (SELECT MIN(TOTAL_SPEND) FROM :RESULT);

  IF (max_spend IS NULL OR max_spend = min_spend) THEN
    -- If no variance, set spend_norm to 50 for everyone
    RESULT = SELECT SUPPLIER_ID, NAME, TOTAL_DELIVERIES, ON_TIME_PCT, TOTAL_SPEND, 0.0 AS SCORE FROM :RESULT;
  ELSE
    RESULT = SELECT
      SUPPLIER_ID,
      NAME,
      TOTAL_DELIVERIES,
      ON_TIME_PCT,
      TOTAL_SPEND,
      -- Score = 0.7 * on_time_pct + 0.3 * (100 * (1 - (spend - min)/(max-min)))
      ROUND(0.7 * ON_TIME_PCT + 0.3 * (100.0 * (1.0 - ((TOTAL_SPEND - :min_spend) / NULLIF((:max_spend - :min_spend),0)))),2) AS SCORE
    FROM :RESULT;
  END IF;

END;
