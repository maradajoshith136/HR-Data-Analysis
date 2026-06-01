CREATE DATABASE IF NOT EXISTS hr_db;
USE hr_db;


DROP TABLE IF EXISTS hr_1;
DROP TABLE IF EXISTS hr_2;

CREATE TABLE hr_1(
    employee_id INT NOT NULL,
    age TINYINT NOT NULL,
    attrition ENUM('Yes','No') NOT NULL,
    business_travel ENUM('Non-Travel','Travel_Rarely','Travel_Frequently') NOT NULL,
    daily_rate SMALLINT NOT NULL,
    department VARCHAR(50) NOT NULL,
    distance_from_home TINYINT NOT NULL,
    education TINYINT NOT NULL COMMENT '1=Below College 2=College 3=Bachelor 4=Master 5=Doctor',
    education_field VARCHAR(50) NOT NULL,
    employee_count  TINYINT  NOT NULL DEFAULT 1,
    environment_satisfaction TINYINT NOT NULL COMMENT '1=Low 2=Medium 3=High 4=Very High',
    gender ENUM('Male','Female') NOT NULL,
    hourly_rate  SMALLINT NOT NULL,
    job_involvement TINYINT NOT NULL COMMENT '1=Low 2=Medium 3=High 4=Very High',
    job_level  TINYINT NOT NULL,
    job_role VARCHAR(50)  NOT NULL,
    job_satisfaction TINYINT NOT NULL COMMENT '1=Low 2=Medium 3=High 4=Very High',
    marital_status ENUM('Single','Married','Divorced') NOT NULL,
    PRIMARY KEY (employee_id),
    INDEX idx_department    (department),
    INDEX idx_job_role      (job_role),
    INDEX idx_attrition     (attrition)
);

SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\hr_1.csv'
INTO TABLE hr_1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
