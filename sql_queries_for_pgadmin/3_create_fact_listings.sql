-- CREATE VIEW FOR FACT LISTINGS

CREATE OR REPLACE VIEW fact_listings AS
SELECT 
    l.id AS listing_id,                       -- Primary Key for the fact table
    l.host_id,                                -- Foreign Key to DimensionHost
    dn.neighborhood_id,                      -- Foreign Key to DimensionNeighborhood
    l.price AS listing_price,
    l.accommodates,
    l.bathrooms,
    l.bedrooms,
    l.beds,
    l.review_scores_rating,
    l.review_scores_accuracy,
    l.review_scores_cleanliness,
    l.review_scores_checkin,
    l.review_scores_communication,
    l.review_scores_location,
    l.review_scores_value,
    l.number_of_reviews,
    l.number_of_reviews_ltm,
    l.number_of_reviews_l30d,
    l.availability_30,
    l.availability_60,
    l.availability_90,
    l.availability_365,
    l.reviews_per_month
FROM 
    public.listings l
LEFT JOIN 
    public.dimension_neighborhood dn
ON 
    l.neighbourhood_cleansed = dn.neighborhood_cleansed;

--- TEST 
SELECT * FROM fact_listings LIMIT 1000;