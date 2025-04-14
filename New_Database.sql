1. New SQL Schema



CREATE SCHEMA uniquest;

USE uniquest;

CREATE TABLE Universities (
    university_id INT NOT NULL AUTO_INCREMENT,
    university_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    application_deadline DATE NOT NULL,
    ranking INT,
    placement_rate DECIMAL(5,2),
    CONSTRAINT universitiesPK PRIMARY KEY (university_id)
);

CREATE TABLE Students (
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gre_score INT,
    toefl_score INT,
    gpa DECIMAL(3,2),
    phone VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT studentsPK PRIMARY KEY (student_id)
);

CREATE TABLE Programs (
    program_id INT NOT NULL AUTO_INCREMENT,
    university_id INT NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    program_type VARCHAR(60),
    duration DECIMAL(3,1) NOT NULL,
    tuition_fee INT NOT NULL,
    average_pay INT,
    CONSTRAINT programsPK PRIMARY KEY (program_id),
    CONSTRAINT programFK FOREIGN KEY (university_id) REFERENCES Universities(university_id)
);

CREATE TABLE Funding (
    funding_id INT NOT NULL AUTO_INCREMENT,
    university_id INT NOT NULL,
    funding_source VARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    funding_year YEAR,
    CONSTRAINT fundingPK PRIMARY KEY (funding_id),
    CONSTRAINT fundingFK FOREIGN KEY (university_id) REFERENCES Universities(university_id)
);

CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    role INT NOT NULL,
    CONSTRAINT usersPK PRIMARY KEY (user_id),
    CONSTRAINT usersFK FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Wishlist (
    wishlist_id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    program_id INT NOT NULL,
    CONSTRAINT wishlistPK PRIMARY KEY (wishlist_id),
    CONSTRAINT wishlistFK1 FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT wishlistFK2 FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

-- Create indexes for better performance
CREATE INDEX idx_student_email ON Students(email);
CREATE INDEX idx_program_name ON Programs(program_name);

-- Indexes for foreign keys for faster joins
CREATE INDEX idx_program_university ON Programs(university_id);
CREATE INDEX idx_funding_university ON Funding(university_id);
CREATE INDEX idx_user_student ON Users(student_id);
CREATE INDEX idx_wishlist_student ON Wishlist(student_id);
CREATE INDEX idx_wishlist_program ON Wishlist(program_id);