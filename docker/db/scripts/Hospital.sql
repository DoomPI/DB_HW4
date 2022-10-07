CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital to lomtev_203;

\connect hospital

CREATE TABLE Station
(
    stationNr varchar PRIMARY KEY,
    name      varchar
);

CREATE TABLE StationPersonnel
(
    persNr    varchar unique PRIMARY KEY,
    nameNum   int,
    stationNr varchar,

    foreign key (stationNr) references Station (stationNr)
);

CREATE TABLE Doctor
(
    area varchar,
    rank varchar,
    unique (persNr)
) INHERITS (StationPersonnel);

CREATE TABLE Caregiver
(
    qualification varchar
) INHERITS (StationPersonnel);

CREATE TABLE Patient
(
    patientNr    varchar PRIMARY KEY,
    name         varchar,
    disease      varchar,
    doctorPersNr varchar,

    foreign key (doctorPersNr) references Doctor (persNr)
);

CREATE TABLE Room
(
    roomNr    varchar PRIMARY KEY,
    bedsNum   int,
    stationNr varchar,

    foreign key (stationNr) references Station (stationNr)
);

CREATE TABLE Admission
(
    id        varchar PRIMARY KEY,
    fromDate  timestamp,
    toDate    timestamp,
    patientNr varchar,
    roomNr    varchar,

    foreign key (patientNr) references Patient (patientNr),
    foreign key (roomNr) references Room (roomNr)
);