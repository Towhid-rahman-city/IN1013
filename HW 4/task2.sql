-- Insert new events for Fluffy and Hammy
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Update Fluffy to include kittens information
UPDATE petPet
SET gender = 'F', owner = 'Owner of Fluffy' 
WHERE petname = 'Fluffy';

-- Add new pet entries for the kittens (2 male kittens)
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Kitten1', 'Owner of Fluffy', 'M', 'M', '2020-08-01', NULL), 
       ('Kitten2', 'Owner of Fluffy', 'M', 'M', '2020-08-01', NULL);

-- Record the event for Claws
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Claws', '1997-08-03', 'injury', 'broke the rib');

-- Update Puffball's death
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- Remove Harold's dog from the database
DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'Dog'; -- Ensure correct identification of the pet
