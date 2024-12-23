-- Table: public.reviews

-- DROP TABLE IF EXISTS public.reviews;

CREATE TABLE IF NOT EXISTS public.reviews
(
    listing_id bigint NOT NULL,
    id bigint NOT NULL,
    date date NOT NULL,
    reviewer_id bigint NOT NULL,
    reviewer_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    comments text COLLATE pg_catalog."default",
    CONSTRAINT reviews_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.reviews
    OWNER to postgres;