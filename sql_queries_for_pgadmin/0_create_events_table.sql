CREATE TABLE IF NOT EXISTS public.events (
    event_id SERIAL PRIMARY KEY,         -- Auto-incrementing unique ID for each event
    start_date DATE NOT NULL,            -- Start date of the event
    end_date DATE NOT NULL,              -- End date of the event
    event_name VARCHAR(255) NOT NULL,    -- Name of the event
    event_description TEXT,              -- Short description of the event
    event_location VARCHAR(255),         -- Location of the event
    estimated_attendance INT             -- Estimated number of attendees
);

--- Test events


--- EXPANDED VERSION ---

CREATE OR REPLACE VIEW public.events_expanded AS
SELECT
    e.event_id,
    e.start_date,
    e.end_date,
    e.event_name,
    e.event_description,
    e.event_location,
    e.estimated_attendance,
    d.day::date AS calendar_date
FROM public.events e
JOIN LATERAL generate_series(e.start_date, e.end_date, interval '1 day') d(day) ON TRUE;


--- Test
select * from events_expanded



--- Explanation for the view

    public.events (original)
    event_id | start_date  | end_date    | event_name               | ... 
    ----------+-------------+-------------+--------------------------+-----
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | ...

    public.events_expanded (view)
    event_id | start_date  | end_date    | event_name               | calendar_date | ...
    ----------+-------------+-------------+--------------------------+---------------+-----
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | 2024-06-25    | ...
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | 2024-06-26    | ...
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | 2024-06-27    | ...
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | 2024-06-28    | ...
        1     | 2024-06-25  | 2024-06-29  | CPH Distortion Festival  | 2024-06-29    | ...
    

    --- I needed the view to get a row for each day between the start and end date of the event.