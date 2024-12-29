--- GUIDE ---
--- NOTE THIS IS A TABLE --- Not sure if I couldn've made it as a view since I create the ID column 

--- 1. DROP EXISTING TABLE (if exists)
DROP TABLE IF EXISTS public.dimension_neighborhood CASCADE; --- CASCADE is used to drop all objects that depend on the table, note this includes fact_listings

--- 2. CREATE NEW TABLE
CREATE TABLE public.dimension_neighborhood (
    neighborhood_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    neighborhood TEXT
);

--- 3. POPULATE WITH DATA
INSERT INTO public.dimension_neighborhood (neighborhood)
SELECT DISTINCT
    neighbourhood_cleansed AS neighborhood
FROM public.listings
WHERE neighbourhood_cleansed IS NOT NULL;

--- 4. TEST, SELECT ALL
SELECT * FROM public.dimension_neighborhood;