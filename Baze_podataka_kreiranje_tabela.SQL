/*
Created: 26-Sep-14
Modified: 26-Sep-14
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/

-- Create tables section -------------------------------------------------

-- Table Kurs

CREATE TABLE "Kurs"(
  "br_kursa" Integer NOT NULL,
  "naziv" Varchar2(50 ) NOT NULL,
  "semestar" Integer NOT NULL,
  "sk_godina" Integer NOT NULL,
  "br_predmeta" Integer
)
/

-- Add keys for table Kurs

ALTER TABLE "Kurs" ADD CONSTRAINT "Key6" PRIMARY KEY ("br_kursa")
/

-- Table Student

CREATE TABLE "Student"(
  "br_indeksa" Integer NOT NULL,
  "ime" Varchar2(20 ) NOT NULL,
  "prezime" Varchar2(20 ) NOT NULL,
  "godina_st" Integer NOT NULL
)
/

-- Add keys for table Student

ALTER TABLE "Student" ADD CONSTRAINT "Key1" PRIMARY KEY ("br_indeksa")
/

-- Table Nastavnik

CREATE TABLE "Nastavnik"(
  "br_nastavnika" Integer NOT NULL,
  "ime" Varchar2(20 ) NOT NULL,
  "prezime" Varchar2(20 ) NOT NULL,
  "zvanje" Varchar2(50 ) NOT NULL
)
/

-- Add keys for table Nastavnik

ALTER TABLE "Nastavnik" ADD CONSTRAINT "Key2" PRIMARY KEY ("br_nastavnika")
/

-- Table Predmet

CREATE TABLE "Predmet"(
  "br_predmeta" Integer NOT NULL,
  "naziv" Varchar2(50 ) NOT NULL,
  "godina" Integer NOT NULL
)
/

-- Add keys for table Predmet

ALTER TABLE "Predmet" ADD CONSTRAINT "Key3" PRIMARY KEY ("br_predmeta")
/

-- Table Pripada

CREATE TABLE "Pripada"(
  "br_indeksa" Integer NOT NULL,
  "br_grupe" Integer NOT NULL
)
/

-- Add keys for table Pripada

ALTER TABLE "Pripada" ADD CONSTRAINT "Key4" PRIMARY KEY ("br_indeksa","br_grupe")
/

-- Table Grupa

CREATE TABLE "Grupa"(
  "br_grupe" Integer NOT NULL
)
/

-- Add keys for table Grupa

ALTER TABLE "Grupa" ADD CONSTRAINT "Key5" PRIMARY KEY ("br_grupe")
/

-- Table Drzi

CREATE TABLE "Drzi"(
  "br_nastavnika" Integer NOT NULL,
  "br_kursa" Integer NOT NULL
)
/

-- Add keys for table Drzi

ALTER TABLE "Drzi" ADD CONSTRAINT "Key7" PRIMARY KEY ("br_nastavnika","br_kursa")
/

-- Table Slusa

CREATE TABLE "Slusa"(
  "br_grupe" Integer NOT NULL,
  "br_kursa" Integer NOT NULL
)
/

-- Add keys for table Slusa

ALTER TABLE "Slusa" ADD CONSTRAINT "Key11" PRIMARY KEY ("br_grupe","br_kursa")
/

-- Table Ispit

CREATE TABLE "Ispit"(
  "br_indeksa" Integer NOT NULL,
  "br_grupe" Integer NOT NULL,
  "br_nastavnika" Integer NOT NULL,
  "br_kursa" Integer NOT NULL,
  "ocjena" Integer NOT NULL,
  "datum" Date NOT NULL
)
/

-- Add keys for table Ispit

ALTER TABLE "Ispit" ADD CONSTRAINT "Key12" PRIMARY KEY ("br_indeksa","br_grupe","br_nastavnika","br_kursa")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "Kurs" ADD CONSTRAINT "Relationship16" FOREIGN KEY ("br_predmeta") REFERENCES "Predmet" ("br_predmeta")
/

ALTER TABLE "Pripada" ADD CONSTRAINT "Relationship20" FOREIGN KEY ("br_indeksa") REFERENCES "Student" ("br_indeksa")
/

ALTER TABLE "Pripada" ADD CONSTRAINT "Relationship21" FOREIGN KEY ("br_grupe") REFERENCES "Grupa" ("br_grupe")
/

ALTER TABLE "Drzi" ADD CONSTRAINT "Relationship17" FOREIGN KEY ("br_kursa") REFERENCES "Kurs" ("br_kursa")
/

ALTER TABLE "Drzi" ADD CONSTRAINT "Relationship1" FOREIGN KEY ("br_nastavnika") REFERENCES "Nastavnik" ("br_nastavnika")
/

ALTER TABLE "Slusa" ADD CONSTRAINT "Relationship18" FOREIGN KEY ("br_grupe") REFERENCES "Grupa" ("br_grupe")
/

ALTER TABLE "Slusa" ADD CONSTRAINT "Relationship19" FOREIGN KEY ("br_kursa") REFERENCES "Kurs" ("br_kursa")
/

ALTER TABLE "Ispit" ADD CONSTRAINT "Relationship22" FOREIGN KEY ("br_indeksa", "br_grupe") REFERENCES "Pripada" ("br_indeksa", "br_grupe")
/

ALTER TABLE "Ispit" ADD CONSTRAINT "Relationship23" FOREIGN KEY ("br_nastavnika", "br_kursa") REFERENCES "Drzi" ("br_nastavnika", "br_kursa")
/




