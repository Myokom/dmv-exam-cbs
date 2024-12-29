--- 1. CREATE NEW TABLE
CREATE TABLE public.dimension_scrape (
    scrape_id bigint NOT NULL,
    last_scraped DATE, -- Date of last scrape
    source TEXT -- Source of the scrape
);

--- 2. POPULATE WITH DATA
INSERT INTO public.dimension_scrape (scrape_id, last_scraped, source)
SELECT DISTINCT
    scrape_id,
    last_scraped,
    source
FROM public.listings
WHERE last_scraped IS NOT NULL AND source IS NOT NULL;

--- 3. TEST, SELECT ALL
SELECT * FROM public.dimension_scrape;