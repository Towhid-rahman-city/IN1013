CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45),
    species CHAR(1),
    gender VARCHAR(15),
    birth DATE,
    death DATE
);

CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(20),
    remark VARCHAR(255),
    PRIMARY KEY (petname, eventdate),  -- Composite primary key to include both petname and eventdate
    FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE
);

