--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Sonoma_FoodInspection_DimensionalModel.DM1
--
-- Date Created : Friday, October 20, 2023 13:48:26
-- Target DBMS : MySQL 8.x
--

--
-- Select Appropriate Database
--

use midterm_project;

-- 
-- TABLE: Dim_Business 
--

CREATE TABLE Dim_Business(
    Business_SK              INT             AUTO_INCREMENT,
    BusinessId               VARCHAR(254),
    Name                     VARCHAR(254),
    PhoneNumber              VARCHAR(18),
    Address                  VARCHAR(254),
    City                     VARCHAR(254),
    State                    VARCHAR(254),
    ZipCode                  INT,
    Lat                      VARCHAR(18),
    Lon                      VARCHAR(18),
    DI_CreatedDate           DATETIME,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(18),
    PRIMARY KEY (Business_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    Date_SK                  INT             NOT NULL,
    Date                     VARCHAR(18),
    DayofWeek                VARCHAR(254),
    DayType                  VARCHAR(254),
    WeekNumber               INT,
    Month                    VARCHAR(254),
    Quarter                  INT,
    Year                     VARCHAR(18),
    DI_CreatedDate           DATETIME,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(18),
    PRIMARY KEY (Date_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Violation 
--

CREATE TABLE Dim_Violation(
    Violation_SK             INT             AUTO_INCREMENT,
    ViolationCodes           VARCHAR(254),
    ViolationDescriptions    VARCHAR(254),
    ViolationCategory        VARCHAR(254),
    ViolationScore           INT,
    DI_CreatedDate           DATETIME,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(20),
    PRIMARY KEY (Violation_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_Inspection 
--

CREATE TABLE Fct_Inspection(
    Inspection_SK            INT             AUTO_INCREMENT,
    InspectionId             VARCHAR(254),
    InspectionType           VARCHAR(254),
    TotalScore               INT,
    InspectionResult         VARCHAR(254),
    DI_CreatedDate           DATETIME,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(20),
    PRIMARY KEY (Inspection_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_InspectionViolation 
--

CREATE TABLE Fct_InspectionViolation(
    InspectionViolation_SK    INT             AUTO_INCREMENT,
    Business_SK               INT,
    Date_SK                   INT,
    Inspection_SK             INT,
    DI_CreatedDate            DATETIME,
    DI_Workflow_ProcessID     VARCHAR(18),
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

ALTER TABLE Fct_Inspection ADD CONSTRAINT RefDim_Violation26 
    FOREIGN KEY (Violation_SK)
    REFERENCES Dim_Violation(Violation_SK)
;

ALTER TABLE Fct_InspectionViolation ADD CONSTRAINT RefFct_Inspection28 
    FOREIGN KEY (Inspection_SK)
    REFERENCES Fct_Inspection(Inspection_SK)
;


