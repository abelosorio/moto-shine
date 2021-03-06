--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: motorcycle_makes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE motorcycle_makes (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT motorcycle_makes_name_format_check CHECK (((name)::text ~ '^([a-zA-Z][a-zA-Z0-9[:space:]]{2,})$'::text))
);


--
-- Name: motorcycle_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE motorcycle_makes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: motorcycle_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE motorcycle_makes_id_seq OWNED BY motorcycle_makes.id;


--
-- Name: motorcycle_models; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE motorcycle_models (
    id integer NOT NULL,
    name character varying,
    motorcycle_make_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: motorcycle_models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE motorcycle_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: motorcycle_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE motorcycle_models_id_seq OWNED BY motorcycle_models.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY motorcycle_makes ALTER COLUMN id SET DEFAULT nextval('motorcycle_makes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY motorcycle_models ALTER COLUMN id SET DEFAULT nextval('motorcycle_models_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: motorcycle_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY motorcycle_makes
    ADD CONSTRAINT motorcycle_makes_pkey PRIMARY KEY (id);


--
-- Name: motorcycle_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY motorcycle_models
    ADD CONSTRAINT motorcycle_models_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_motorcycle_models_on_motorcycle_make_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_motorcycle_models_on_motorcycle_make_id ON motorcycle_models USING btree (motorcycle_make_id);


--
-- Name: motorcycle_makes_name_unique_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX motorcycle_makes_name_unique_index ON motorcycle_makes USING btree (lower((name)::text));


--
-- Name: fk_rails_4f0eeb09b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY motorcycle_models
    ADD CONSTRAINT fk_rails_4f0eeb09b8 FOREIGN KEY (motorcycle_make_id) REFERENCES motorcycle_makes(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES
('20170222124913'),
('20170222180831');


