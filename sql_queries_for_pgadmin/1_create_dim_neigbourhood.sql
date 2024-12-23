--- GUIDE ---
--- NOTE THIS IS A TABLE --- Not sure if I couldn've made it as a view since I create the ID column 

--- 1. CREATE
CREATE TABLE IF NOT EXISTS public.dimension_neighborhood (
    neighborhood_id SERIAL PRIMARY KEY, -- Auto-incremented ID
    neighborhood TEXT,
    neighborhood_cleansed TEXT,
);


--- 2. POPULATE WITH DATA
INSERT INTO public.dimension_neighborhood (neighborhood, neighborhood_cleansed, neighborhood_group_cleansed)
SELECT DISTINCT
    neighbourhood_cleansed AS neighborhood,
  
FROM public.listings
WHERE neighbourhood_cleansed IS NOT NULL;

--- 3. TEST, select all
select * from dimension_neighborhood