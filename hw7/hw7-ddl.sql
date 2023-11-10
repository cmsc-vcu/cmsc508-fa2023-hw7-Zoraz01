# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;

SET FOREIGN_KEY_CHECKS = 1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    time_commitment VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
(1, 'Data Analysis', 'Interpreting complex datasets to provide insights and drive decisions', 'Skill 1', 'http://example.com/data-analysis', '6 months'),
(2, 'Machine Learning', 'Designing and implementing algorithms that can learn from and make predictions on data', 'Skill 2', 'http://example.com/machine-learning', '1 year'),
(3, 'Web Development', 'Building and maintaining websites, including web design, web publishing, and web programming', 'Skill 3', 'http://example.com/web-development', '3 months'),
(4, 'Cloud Computing', 'Delivering different services through the Internet, including data storage, servers, databases, networking', 'Skill 4', 'http://example.com/cloud-computing', '8 months'),
(5, 'Cybersecurity', 'Protecting systems, networks, and programs from digital attacks', 'Skill 5', 'http://example.com/cybersecurity', '5 months'),
(6, 'Blockchain Technology', 'Creating and managing a continuously growing list of records, called blocks, which are linked and secured', 'Skill 6', 'http://example.com/blockchain', '1.5 years'),
(7, 'Internet of Things', 'Developing connected devices that can collect and exchange data over the Internet', 'Skill 7', 'http://example.com/iot', '4 months'),
(8, 'Artificial Intelligence', 'Simulating human intelligence in machines programmed to think like humans and mimic their actions', 'Skill 8', 'http://example.com/ai', '2 years');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    linkedin_url VARCHAR(255) DEFAULT NULL,
    headshot_url VARCHAR(255) DEFAULT NULL,
    discord_handle VARCHAR(255) DEFAULT NULL,
    brief_bio VARCHAR(4096) DEFAULT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, last_name, first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'Person 1', 'John', 'john@email.com', 'http://linkedin.com/in/john1', 'http://example.com/headshot1.jpg', 'john_discord', 'Bio of John', '2023-01-01'),
(2, 'Person 2', 'Emma', 'emma@email.com', 'http://linkedin.com/in/emma2', 'http://example.com/headshot2.jpg', 'emma_discord', 'Bio of Emma', '2023-02-01'),
(3, 'Person 3', 'Alex', 'alex@email.com', 'http://linkedin.com/in/alex3', 'http://example.com/headshot3.jpg', 'alex_discord', 'Bio of Alex', '2023-03-01'),
(4, 'Person 4', 'Sara', 'sara@email.com', 'http://linkedin.com/in/sara4', 'http://example.com/headshot4.jpg', 'sara_discord', 'Bio of Sara', '2023-04-01'),
(5, 'Person 5', 'David', 'david@email.com', 'http://linkedin.com/in/david5', 'http://example.com/headshot5.jpg', 'david_discord', 'Bio of David', '2023-05-01'),
(6, 'Person 6', 'Lily', 'lily@email.com', 'http://linkedin.com/in/lily6', 'http://example.com/headshot6.jpg', 'lily_discord', 'Bio of Lily', '2023-06-01'),
(7, 'Person 7', 'Michael', 'michael@email.com', 'http://linkedin.com/in/michael7', 'http://example.com/headshot7.jpg', 'michael_discord', 'Bio of Michael', '2023-07-01'),
(8, 'Person 8', 'Laura', 'laura@email.com', 'http://linkedin.com/in/laura8', 'http://example.com/headshot8.jpg', 'laura_discord', 'Bio of Laura', '2023-08-01'),
(9, 'Person 9', 'Robert', 'robert@email.com', 'http://linkedin.com/in/robert9', 'http://example.com/headshot9.jpg', 'robert_discord', 'Bio of Robert', '2023-09-01'),
(10, 'Person 10', 'Julia', 'julia@email.com', 'http://linkedin.com/in/julia10', 'http://example.com/headshot10.jpg', 'julia_discord', 'Bio of Julia', '2023-10-01');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-01-01'), (3, 1, '2023-01-01'), (6, 1, '2023-01-01'),
(3, 2, '2023-01-02'), (4, 2, '2023-01-02'), (5, 2, '2023-01-02'),
(1, 3, '2023-01-03'), (5, 3, '2023-01-03'),
(3, 5, '2023-01-05'), (6, 5, '2023-01-05'),
(2, 6, '2023-01-06'), (3, 6, '2023-01-06'), (4, 6, '2023-01-06'),
(3, 7, '2023-01-07'), (5, 7, '2023-01-07'), (6, 7, '2023-01-07'),
(1, 8, '2023-01-08'), (3, 8, '2023-01-08'), (5, 8, '2023-01-08'), (6, 8, '2023-01-08'),
(2, 9, '2023-01-09'), (5, 9, '2023-01-09'), (6, 9, '2023-01-09'),
(1, 10, '2023-01-10'), (4, 10, '2023-01-10'), (5, 10, '2023-01-10');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer


INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, '2023-01-01'),
(2, 5, '2023-01-02'), (2, 6, '2023-01-02'), 
(3, 2, '2023-01-03'), (3, 4, '2023-01-03'), 
(4, 3, '2023-01-04'), 
(5, 3, '2023-01-05'), 
(6, 2, '2023-01-06'), (6, 1, '2023-01-06'), 
(7, 1, '2023-01-07'), 
(8, 1, '2023-01-08'), (8, 4, '2023-01-08'), 
(9, 2, '2023-01-09'), 
(10, 2, '2023-01-10'), (10, 1, '2023-01-10'); 

