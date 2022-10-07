CREATE SCHEMA library;
GRANT ALL PRIVILEGES ON SCHEMA library TO lomtev_203;

\connect library

CREATE TABLE library.Publisher
(
    name    varchar PRIMARY KEY,
    address varchar
);

CREATE TABLE library.Category
(
    name varchar PRIMARY KEY
);

CREATE TABLE library.Book
(
    ISBN          int PRIMARY KEY,
    name          varchar,
    author        varchar,
    year          int,
    numberOfPages int,

    publisherName varchar,
    foreign key (publisherName) references library.Publisher (name),

    categoryName  varchar,
    foreign key (categoryName) references library.Category (name)
);

CREATE TABLE library.Reader
(
    readerId  int PRIMARY KEY,
    firstName varchar,
    lastName  varchar,
    address   varchar,
    birthday  timestamp
);

CREATE TABLE library.BookCopy
(
    copyNumber        int PRIMARY KEY,
    position          varchar,

    ISBN              int,
    foreign key (ISBN) references library.Book (ISBN),

    currentReaderId int,
    foreign key (currentReaderId) references library.Reader (readerId)
);