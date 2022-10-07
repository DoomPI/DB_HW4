CREATE DATABASE trains;
GRANT ALL PRIVILEGES ON DATABASE trains TO lomtev_203;

\connect trains

CREATE TABLE Train (
  trainNr varchar PRIMARY KEY,
  length real
);


CREATE TABLE City (
  name varchar,
  region varchar,
  PRIMARY KEY (name, region)
);

CREATE TABLE Station (
  name varchar PRIMARY KEY,
  trackNum int,
  region varchar,
  cityName varchar,

  foreign key (cityName, region) references City(name, region)
);

CREATE TABLE Departure (
  id int PRIMARY KEY,
  departureTime timestamp,
  arrivalTime timestamp,
  departureStationName varchar,
  arrivalStationName varchar,
  trainNr varchar,

  foreign key (departureStationName) references Station(name),
  foreign key (arrivalStationName) references Station(name),
  foreign key (trainNr) references Train(trainNr)
);