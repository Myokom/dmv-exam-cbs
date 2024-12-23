--- CREATE VIEW FOR CALENDAR


CREATE OR REPLACE VIEW fact_calendar AS
SELECT 
    c.listing_id,       -- Primary Key (part 1)
    c.date,             -- Primary Key (part 2)
    c.available,        -- Boolean indicating availability
    c.price AS calendar_price, -- Price from the calendar table
    c.minimum_nights,   -- Minimum nights requirement
    c.maximum_nights    -- Maximum nights requirement
FROM 
    public.calendar c;


--- TEST
SELECT * FROM fact_calendar LIMIT 10;