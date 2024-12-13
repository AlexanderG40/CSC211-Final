DROP DATABASE HobbysDB;

CREATE DATABASE IF NOT EXISTS HobbysDB;

USE HobbysDB;

-- Created table for our hobbys 
CREATE TABLE IF NOT EXISTS Hobbys_Table(
    hobby_id INT AUTO_INCREMENT PRIMARY KEY,
    hobby_name VARCHAR(100) NOT NULL,
    hobby_category VARCHAR(80) NOT NULL,
    hobby_level VARCHAR(60) NOT NULL
); 

-- CREATED A USERS/PARTICIPANTS TABLE
CREATE TABLE IF NOT EXISTS Users_Table(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    job VARCHAR(58) NOT NULL,
    gender VARCHAR(15)
);

-- Created a table for our user hobbies
CREATE TABLE IF NOT EXISTS User_Hobby(
    userhobby_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    hobby_id INT NOT NULL,
    experience_level VARCHAR(80) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users_Table(user_id),
    FOREIGN KEY (hobby_id) REFERENCES Hobbys_Table(hobby_id)
);


-- CREATED A TABLE FOR THE USERS TO RATE THEIR HOBBY
CREATE TABLE IF NOT EXISTS Rating_Table(
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    hobby_id INT NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(225) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users_Table(user_id),
    FOREIGN KEY (hobby_id) REFERENCES Hobbys_Table(hobby_id)
);

-- Create final supply database
CREATE TABLE IF NOT EXISTS Supply_Table(
    supply_id INT AUTO_INCREMENT PRIMARY KEY,
    hobby_id INT NOT NULL,
    supply VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (hobby_id) REFERENCES Hobbys_Table(hobby_id)
);

-- Create a transaction database
CREATE TABLE IF NOT EXISTS Transaction_Table(
	transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    supply_id INT NOT NULL,
    quantity INT NOT NULL,
    transaction_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users_Table(user_id),
    FOREIGN KEY (supply_id) REFERENCES Supply_Table(supply_id)
);

-- Create a supplier table for our supply
CREATE TABLE Supplier_Table(
	supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(120) NOT NULL,
    address VARCHAR(200) NOT NULL
);

-- CREATE A TABLE FOR LOCATIONS WHERE THEY HAVE THEIR HOBBY
CREATE TABLE Location_Table(
	location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(190) NOT NULL,
    state VARCHAR(40) NOT NULL
);

-- CREATE A EVENTS TABLE FOR HOBBY EVENTS
CREATE TABLE Events_Table(
	event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(130) NOT NULL,
    event_date DATE,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Location_Table(location_id)
);

-- Last but not least final table for this final 
CREATE TABLE Subscription_Table(
	subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    hobby_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users_Table(user_id),
    FOREIGN KEY (hobby_id) REFERENCES Hobbys_Table(hobby_id)
);
-- Insert statements for the hobby table
INSERT INTO Hobbys_Table(hobby_name, hobby_category, hobby_level) VALUES ('Snowboarding', 'Sports', 'Hard');
INSERT INTO Hobbys_Table(hobby_name, hobby_category, hobby_level) VALUES ('Basketball', 'Sports', 'Medium');
INSERT INTO Hobbys_Table(hobby_name, hobby_category, hobby_level) VALUES ('VideoGames', 'E-Sports', 'Easy');
INSERT INTO Hobbys_Table(hobby_name, hobby_category, hobby_level) VALUES ('Rockclimbing', 'Sports', 'Hard');
INSERT INTO Hobbys_Table(hobby_name, hobby_category, hobby_level) VALUES ('Reading', 'Education', 'Intermediate');

-- Insert statements for the user table
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Mike', 'Jones', 28, 'HR', 'male');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Mike', 'Smith', 48, 'Engineer', 'male');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Maria', 'Black', 22, 'Professor', 'female');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Lucy', 'Bradly', 55, 'business owner', 'female');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Mark', 'James', 48, 'Architect', 'male');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Jesse', 'Westfall', 29, 'Operations Manager', 'male');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Nancy', 'Parks', 52, 'Lawyer', 'female');
INSERT INTO Users_Table(first_name, last_name, age, job, gender) VALUES ('Emily', 'Wisner', 42, 'CEO', 'female');

-- Insert statements for the users hobby table
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (1, 3, 'advanced');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (2, 1, 'beginner');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (3, 2, 'advanced');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (4, 2, 'advanced');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (5, 3, 'intermediate');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (6, 1, 'beginner');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (7, 2, 'advanced');
INSERT INTO User_Hobby(user_id, hobby_id, experience_level) VALUES (8, 4, 'advanced');

-- Ratings Inserts
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (1, 3, 4, 'Overall, I love my hobby it is awesome!');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (2, 1, 2, 'Overall, I love my hobby it is awesome! I would not change.');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (3, 2, 5, 'Overall, I love my hobby it is awesome! I have done this since I was 11.');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (4, 2, 2, 'Overall, It is ok. I just do it for my husband.');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (5, 3, 5, 'Overall, It is ok. I just do it for my husband.');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (6, 1, 4, 'Overall, It is great. I enjoy doing my hobby on a semi-daily basis!');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (7, 2, 1, 'Overall, It is meh. I do this because my kids enjoy this hobby.');
INSERT INTO Rating_Table(user_id, hobby_id, rating, review) VALUES (8, 4, 5, 'Overall, It is great! I love this hobby, I would not change it for another hobby.');

INSERT INTO Supply_Table(hobby_id, supply, price) VALUES (2, 'Sneakers', 22);
INSERT INTO Supply_Table(hobby_id, supply, price) VALUES (1, 'Snowpants', 86);
INSERT INTO Supply_Table(hobby_id, supply, price) VALUES (3, 'Xbox', 800);
INSERT INTO Supply_Table(hobby_id, supply, price) VALUES (4, 'Rope', 240);
INSERT INTO Supply_Table(hobby_id, supply, price) VALUES (5, 'Books', 800);

-- Insert statements for Subscriptions, Events, Locations, supplier and transactions
-- Insert into transactions
INSERT INTO Transaction_Table(user_id, supply_id, quantity, transaction_date) VALUES (1, 2, 4, '2021-02-11');
INSERT INTO Transaction_Table(user_id, supply_id, quantity, transaction_date) VALUES (2, 1, 2, '2022-12-01');
INSERT INTO Transaction_Table(user_id, supply_id, quantity, transaction_date) VALUES (3, 1, 4, '2012-09-05');
INSERT INTO Transaction_Table(user_id, supply_id, quantity, transaction_date) VALUES (4, 3, 4, '2011-09-11');
INSERT INTO Transaction_Table(user_id, supply_id, quantity, transaction_date) VALUES (5, 4, 4, '2021-04-11');

INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (1, 3, '2009-08-21', '2021-01-11');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (2, 1, '2014-01-22', '2023-07-14');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (3, 2, '2007-07-09', '2024-04-21');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (4, 2, '2011-02-07', '2020-01-23');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (5, 3, '2019-08-24', '2024-04-29');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (6, 1, '2009-08-29', '2021-01-18');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (7, 2, '2009-08-11', '2011-09-27');
INSERT INTO Subscription_Table(user_id, hobby_id, start_date, end_date) VALUES (8, 4, '2018-08-02', '2021-05-24');

-- Insert into the Locations Table
INSERT INTO Location_Table(city, state) VALUES ('Los Angeles', 'CA');
INSERT INTO Location_Table(city, state) VALUES ('New York', 'NY');
INSERT INTO Location_Table(city, state) VALUES ('Denver', 'CO');
INSERT INTO Location_Table(city, state) VALUES ('Tucson', 'AZ');
INSERT INTO Location_Table(city, state) VALUES ('Houston', 'TX');

-- Insert into events
INSERT INTO Events_Table(event_name, event_date, location_id) VALUES ('Reading Marathon', '2024-05-21', 1);
INSERT INTO Events_Table(event_name, event_date, location_id) VALUES ('Grand Prix', '2025-02-24', 3);
INSERT INTO Events_Table(event_name, event_date, location_id) VALUES ('Gaming Warehous', '2024-09-08', 2);
INSERT INTO Events_Table(event_name, event_date, location_id) VALUES ('Hell Mountain', '2024-11-01', 4);
INSERT INTO Events_Table(event_name, event_date, location_id) VALUES ('Bouncing bros', '2024-07-21', 5);

-- Insert into supplier 
INSERT INTO Supplier_Table(supplier_name, address) VALUES ('Kittridge Sports', '123 Main St, Oakland, CA, USA');
INSERT INTO Supplier_Table(supplier_name, address) VALUES ('Gaming Rec', '123 Old Town, New Jersey, NJ, USA');
INSERT INTO Supplier_Table(supplier_name, address) VALUES ('Hiking Inventory', '123 Main St, Breckenridge, CO, USA');
INSERT INTO Supplier_Table(supplier_name, address) VALUES ('Books and Plus', '123 South Ave, Los Angeles, CA, USA');
INSERT INTO Supplier_Table(supplier_name, address) VALUES ('Amazon', '123 San Juan, Austin, TX, USA');



-- Time for CRUD
-- First one create/insert:
INSERT INTO Location_Table(city, state) VALUES ('Miami', 'FL');

-- Next Read:
SELECT * FROM Location_Table;

-- Next is update: we updated the location state for az
UPDATE Location_Table
SET city = 'Phoenix'
WHERE state = 'AZ';

-- Last but not least delete
DELETE FROM Location_Table WHERE city = 'Denver';