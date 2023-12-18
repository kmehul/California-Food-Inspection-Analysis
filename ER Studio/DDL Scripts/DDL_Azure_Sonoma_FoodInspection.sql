/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Sonoma_FoodInspection_DimensionalModel.DM1
 *
 * Date Created : Friday, October 20, 2023 13:47:56
 * Target DBMS : Microsoft Azure SQL DB
 */

/* 
 * TABLE: Dim_Business 
 */

CREATE TABLE mehul.Dim_Business(
    Business_SK              int             IDENTITY(1,1),
    BusinessId               varchar(254)    NULL,
    Name                     varchar(254)    NULL,
    PhoneNumber              varchar(18)     NULL,
    Address                  varchar(254)    NULL,
    City                     varchar(254)    NULL,
    State                    varchar(254)    NULL,
    ZipCode                  int             NULL,
    Lat                      varchar(18)     NULL,
    Lon                      varchar(18)     NULL,
    DI_CreatedDate           datetime        NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(18)     NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (Business_SK)
)

go


IF OBJECT_ID('Dim_Business') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Business >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Business >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE mehul.Dim_Date(
    Date_SK                  int             NOT NULL,
    Date                     varchar(18)     NULL,
    DayofWeek                varchar(254)    NULL,
    DayType                  varchar(254)    NULL,
    WeekNumber               int             NULL,
    Month                    varchar(254)    NULL,
    Quarter                  int             NULL,
    Year                     varchar(18)     NULL,
    DI_CreatedDate           datetime        NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(18)     NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Date_SK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE mehul.Dim_Violation(
    Violation_SK             int             IDENTITY(1,1),
    ViolationCodes           varchar(254)    NULL,
    ViolationDescriptions    varchar(254)    NULL,
    ViolationCategory        varchar(254)    NULL,
    ViolationScore           int             NULL,
    DI_CreatedDate           datetime        NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(20)     NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (Violation_SK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: Fct_Inspection 
 */

CREATE TABLE mehul.Fct_Inspection(
    Inspection_SK            int             IDENTITY(1,1),
    InspectionId             varchar(254)    NULL,
    InspectionType           varchar(254)    NULL,
    TotalScore               int             NULL,
    InspectionResult         varchar(254)    NULL,
    DI_CreatedDate           datetime        NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(20)     NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (Inspection_SK)
)

go


IF OBJECT_ID('Fct_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fct_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fct_Inspection >>>'
go

/* 
 * TABLE: Fct_InspectionViolation 
 */

CREATE TABLE mehul.Fct_InspectionViolation(
    InspectionViolation_SK    int             IDENTITY(1,1),
    Business_SK               int             NULL,
    Date_SK                   int             NULL,
    Violation_SK              int             NULL,
    Inspection_SK             int             NULL,
    DI_CreatedDate            datetime        NULL,
    DI_WorkflowFileName       varchar(255)    NULL,
    DI_Workflow_ProcessID     varchar(18)     NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (InspectionViolation_SK)
)

go


IF OBJECT_ID('Fct_InspectionViolation') IS NOT NULL
    PRINT '<<< CREATED TABLE Fct_InspectionViolation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fct_InspectionViolation >>>'
go

/* 
 * TABLE: Fct_InspectionViolation 
 */

ALTER TABLE mehul.Fct_InspectionViolation ADD CONSTRAINT RefDim_Business23 
    FOREIGN KEY (Business_SK)
    REFERENCES mehul.Dim_Business(Business_SK)
go

ALTER TABLE mehul.Fct_InspectionViolation ADD CONSTRAINT RefDim_Date24 
    FOREIGN KEY (Date_SK)
    REFERENCES mehul.Dim_Date(Date_SK)
go

ALTER TABLE mehul.Fct_InspectionViolation ADD CONSTRAINT RefDim_Violation26 
    FOREIGN KEY (Violation_SK)
    REFERENCES mehul.Dim_Violation(Violation_SK)
go

ALTER TABLE mehul.Fct_InspectionViolation ADD CONSTRAINT RefFct_Inspection28 
    FOREIGN KEY (Inspection_SK)
    REFERENCES mehul.Fct_Inspection(Inspection_SK)
go


