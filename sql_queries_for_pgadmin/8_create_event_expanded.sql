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
