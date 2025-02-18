--- CREATE VIEW FOR DIMENSION LISTING
CREATE OR REPLACE VIEW dimension_listing AS
SELECT 
    id AS listing_id,
    listing_url,
    picture_url,
    name,
    description,
    neighborhood_overview,
    latitude,
    longitude,
    property_type,
    room_type,
    bathroom_type,
    amenities,
    minimum_nights,
    maximum_nights,
    instant_bookable,
    has_availability,
    first_review,
    last_review
FROM 
    public.listings;


--- TEST
SELECT * FROM dimension_listing LIMIT 10;