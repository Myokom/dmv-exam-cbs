-- Table: public.calendar

-- DROP TABLE IF EXISTS public.calendar;

CREATE TABLE IF NOT EXISTS public.calendar
(
    listing_id bigint NOT NULL,
    date date NOT NULL,
    available boolean NOT NULL,
    price double precision NOT NULL,
    minimum_nights integer,
    maximum_nights integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.calendar
    OWNER to postgres;