CREATE TABLE patients(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth date,
    PRIMARY KEY (id));

CREATE TABLE invoices(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at timestamp without time zone,
    payed_at timestamp without time zone,
    medical_history_id integer,
    PRIMARY KEY (id));

CREATE TABLE medical_history(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp without time zone,
    patient_id integer,
    status VARCHAR,
    PRIMARY KEY (id));

CREATE TABLE invoice_items(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity integer,
    total_price DECIMAL,
    invoice_id integer,
    treatment_id integer,
    PRIMARY KEY (id));

CREATE TABLE treatments(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type VARCHAR,
    name VARCHAR,
    PRIMARY KEY (id));

ALTER TABLE invoices
ADD FOREIGN KEY (medical_history_id)
REFERENCES medical_history(id);


ALTER TABLE medical_history
ADD FOREIGN KEY (patient_id)
REFERENCES patients (id);


ALTER TABLE medical_history
ADD FOREIGN KEY (id)
REFERENCES treatments (id);


ALTER TABLE invoice_items
ADD FOREIGN KEY (invoice_id)
REFERENCES invoices (id);


ALTER TABLE invoice_items
ADD FOREIGN KEY (treatment_id)
REFERENCES treatments (id);