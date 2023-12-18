--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Sonoma_FoodInspection_DimensionalModel.DM1
--
-- Date Created : Friday, November 03, 2023 02:43:10
-- Target DBMS : MySQL 8.x
--

use midterm_project;

-- 
-- TABLE: Dim_Business 
--

CREATE TABLE Dim_Business(
    Business_SK              INT     NOT NULL        AUTO_INCREMENT,
    BusinessId               VARCHAR(255)    NOT NULL,
    Name                     VARCHAR(255),
    PhoneNumber              BIGINT,
    Address                  VARCHAR(255),
    City                     VARCHAR(255),
    State                    VARCHAR(255),
    ZipCode                  INT,
    Lat                      FLOAT,
    Lon                      FLOAT,
    DI_CreatedDate           DATETIME,
    DI_Workflow_ProcessID    VARCHAR(255),
    PRIMARY KEY (Business_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    Date_SK                  INT             NOT NULL,
    Date                     DATE,
    DayofWeek                VARCHAR(255),
    DayType                  VARCHAR(255),
    WeekNumber               INT,
    Month                    VARCHAR(255),
    Quarter                  INT,
    Year                     INT,
    DI_CreatedDate           DATETIME,
    DI_Workflow_ProcessID    VARCHAR(255),
    PRIMARY KEY (Date_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Violation 
--

CREATE TABLE Dim_Violation(
    Violation_SK             INT     NOT NULL        AUTO_INCREMENT,
    ViolationCodes           VARCHAR(255),
    ViolationDescriptions    VARCHAR(255),
    ViolationCategory        VARCHAR(255),
    ViolationScore           INT,
    DI_CreatedDate           DATETIME,
    DI_Workflow_ProcessID    VARCHAR(255),
    PRIMARY KEY (Violation_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_Inspection 
--

CREATE TABLE Fct_Inspection(
    Inspection_SK            INT      NOT NULL       AUTO_INCREMENT,
    InspectionId             VARCHAR(255),
    InspectionType           VARCHAR(255),
    DI_CreatedDate           DATETIME,
    DI_Workflow_ProcessID    VARCHAR(255),
    PRIMARY KEY (Inspection_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_InspectionViolation 
--

CREATE TABLE Fct_InspectionViolation(
    InspectionViolation_SK    INT      NOT NULL       AUTO_INCREMENT,
    Business_SK               INT,
    Date_SK                   INT,
    Violation_SK              INT,
    Inspection_SK             INT,
    TotalScore                INT,
    InspectionResult          VARCHAR(255),
    DI_CreatedDate            DATETIME,
    DI_Workflow_ProcessID     VARCHAR(255),
    PRIMARY KEY (InspectionViolation_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_InspectionViolation 
--

ALTER TABLE Fct_InspectionViolation ADD CONSTRAINT RefDim_Business23 
    FOREIGN KEY (Business_SK)
    REFERENCES Dim_Business(Business_SK)
;

ALTER TABLE Fct_InspectionViolation ADD CONSTRAINT RefDim_Date24 
    FOREIGN KEY (Date_SK)
    REFERENCES Dim_Date(Date_SK)
;

ALTER TABLE Fct_InspectionViolation ADD CONSTRAINT RefDim_Violation26 
    FOREIGN KEY (Violation_SK)
    REFERENCES Dim_Violation(Violation_SK)
;

ALTER TABLE Fct_InspectionViolation ADD CONSTRAINT RefFct_Inspection28 
    FOREIGN KEY (Inspection_SK)
    REFERENCES Fct_Inspection(Inspection_SK)
;


