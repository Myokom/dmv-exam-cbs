
--- CREATE DIMENSION TABLE
CREATE TABLE public.dimension_time (
    date DATE PRIMARY KEY,          -- Primary Key: The date
    year INTEGER,                   -- Year (e.g., 2023)
    quarter INTEGER,                -- Quarter (1-4)
    month INTEGER,                  -- Month (1-12)
    day INTEGER,                    -- Day of the month (1-31)
    weekday TEXT,                   -- Name of the day (e.g., 'Monday')
    is_weekend BOOLEAN              -- Whether the day is a weekend (TRUE/FALSE)
);

--- POPULATE TABLE
INSERT INTO public.dimension_time (date, year, quarter, month, day, weekday, is_weekend)
SELECT 
    gs::DATE AS date,                                -- Date
    EXTRACT(YEAR FROM gs)::INTEGER AS year,          -- Year
    CEILING(EXTRACT(MONTH FROM gs) / 3.0)::INTEGER AS quarter, -- Quarter
    EXTRACT(MONTH FROM gs)::INTEGER AS month,        -- Month
    EXTRACT(DAY FROM gs)::INTEGER AS day,            -- Day
    TRIM(TO_CHAR(gs, 'Day')) AS weekday,             -- Day name (e.g., 'Monday')
    CASE WHEN EXTRACT(DOW FROM gs) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend -- Weekend flag
FROM 
    generate_series('2008-06-27'::DATE, '2025-07-01'::DATE, '1 day'::INTERVAL) gs;

--- TEST (should show the dates just above)
SELECT MIN(date) AS start_date, MAX(date) AS end_date FROM public.dimension_time;

--- TEST (check to see if it matches this months weekends)
SELECT * 
FROM public.dimension_time
WHERE is_weekend = TRUE
  AND year = 2024
  AND month = 12;