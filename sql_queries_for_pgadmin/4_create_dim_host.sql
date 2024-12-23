--- CREATE VIEW FOR DIM HOST

CREATE OR REPLACE VIEW dimension_host AS
SELECT 
    l.host_id,                                     -- Primary Key
    l.host_url,                                    -- URL of the host
    l.host_name,                                   -- Name of the host
    l.host_since,                                  -- Date when the host started
    l.host_location,                               -- Location of the host
    l.host_neighbourhood,                          -- Host's neighborhood
    l.host_about,                                  -- Host's description/about section
    l.host_response_time,                          -- Average response time
    l.host_response_rate::FLOAT,                   -- Response rate converted to float
    l.host_acceptance_rate::FLOAT,                 -- Acceptance rate converted to float
    l.host_is_superhost,                           -- Boolean indicating if the host is a superhost
    l.host_has_profile_pic,                        -- Boolean indicating if the host has a profile picture
    l.host_picture_url,                            -- URL of the host's picture
    l.host_identity_verified,                      -- Boolean indicating if the host is identity verified
    l.host_verifications,                          -- JSON list of host verifications
    l.calculated_host_listings_count,              -- Total number of listings by the host
    l.calculated_host_listings_count_entire_homes, -- Entire home/apartment listings count
    l.calculated_host_listings_count_private_rooms,-- Private rooms count
    l.calculated_host_listings_count_shared_rooms  -- Shared rooms count
FROM 
    public.listings l
WHERE 
    l.host_id IS NOT NULL; -- Filter out records without a valid host ID


--- TEST
SELECT * FROM dimension_host LIMIT 10;