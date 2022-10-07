CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO lomtev_203;

\connect library

CREATE TABLE Publisher
(
    name   varchar PRIMARY KEY,
    address varchar
);

CREATE TABLE Category
(
    name varchar PRIMARY KEY
);

CREATE TABLE Book
(
    ISBN          int PRIMARY KEY,
    name          varchar,
    author        varchar,
    year          int,
    numberOfPages int,

    publisherName varchar,
    foreign key (publisherName) references Publisher (name),

    categoryName  varchar,
    foreign key (categoryName) references Category (name)
);

CREATE TABLE Reader
(
    readerId  int PRIMARY KEY,
    firstName varchar,
    lastName  varchar,
    address   varchar,
    birthday  timestamp
);

CREATE TABLE BookCopy
(
    copyNumber      int PRIMARY KEY,
    position        varchar,

    ISBN            int,
    foreign key (ISBN) references Book (ISBN),

    currentReaderId int,
    foreign key (currentReaderId) references Reader (readerId)
);