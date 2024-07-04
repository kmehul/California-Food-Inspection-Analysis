# California Food Inspection Analysis

## Overview

This project focuses on developing a comprehensive data analytics and reporting system for food facility inspections in Sonoma County, California. Utilizing datasets from official sources, the system is designed to model, process, and visualize inspection data to enhance food safety management and oversight.

## Objectives

1. **Data Acquisition and Staging**: Retrieve and stage inspection data for further processing.
2. **Data Modeling**: Design and implement a dimensional data model suitable for analytical processing.
3. **Data Integration**: Populate the dimensional model using ETL processes.
4. **Analytics and Reporting**: Develop BI dashboards for insightful data visualization and decision-making.

## Components

### Data Collection

- **Source**: Sonoma County Open Data portal and provided files in different formats. [Data Source](https://data.sonomacounty.ca.gov/Health/Food-Facility-Inspections/8r44-w5qd/about_data)
- **Data Includes**: Inspection results, violation codes, and establishment details.

### Data Staging and Profiling

- **Loading Data**: Data is loaded into staging tables with audit columns.
- **Data Profiling**: Understanding data types, min/max values, and cleansing requirements.

### Dimensional Modeling

- **Identifying Facts and Dimensions**: Key data elements for analysis.
- **Defining Relationships and Data Grain**: Establishing connections and level of detail.
- **Creating Surrogate Keys and Standard Schema Columns**: Ensuring data integrity and consistency.

### ETL Process

- **ETL Jobs**: Designing and executing Talend jobs to load data into the dimensional model.
- **Data Handling**: Managing special data formats and normalizing violation codes.

### BI Dashboard Development

- **Dashboards**: Creating dashboards in Power BI and Tableau.
- **Insights**: Providing insights on inspection results, violation categories, and trends over time.

### Enhanced Analytics Features

- **Violation Categorization and Scoring System**: For inspections.
- **Inspection Result Determination**: Based on violation scores.
- **Geographical Data Utilization**: Mapping inspections for spatial analysis.

## Technologies Used

- **SQL Server and MySQL**: For database management.
- **Talend**: For ETL processes.
- **Power BI and Tableau**: For data visualization.
- **ER/Studio**: For data modeling.

## Repository Structure

The repository is organized as follows:

- **Alteryx**: Contains workflows created in Alteryx for data processing and analysis.
- **LICENSE**: The license file for the project.
- **Food_Facility_Inspections.csv**: The main dataset containing inspection records.
- **Sonoma_FoodInspection_Profiling.bak**: A backup file of the database used for data profiling.
- **README.md**: This readme file.
- **MIDTERM_PROJECT**: Directory containing documents and files related to the midterm project submission.
- **Physical_MySQL.sql**: SQL script to create the physical database schema in MySQL.
- **Team6_Midterm_Project.twb**: Tableau workbook for data visualization.
- **dim_business+ (food_inspection).hyper**: Tableau Hyper file for faster data processing and visualization.
- **ER Studio**: Contains ER Studio models and diagrams for database design.

## Data Description

The `Food_Facility_Inspections.csv` file contains the following columns:

- **Facility ID**: Unique identifier for each food facility.
- **Facility Name**: Name of the food facility.
- **Facility Type**: Type of the food facility (e.g., restaurant, grocery store).
- **Inspection Date**: Date when the inspection was conducted.
- **Inspection Score**: Score given based on the inspection.
- **Inspection Result**: Result of the inspection (e.g., pass, fail).
- **Violation Description**: Description of any violations found during the inspection.

## Getting Started

- Ensure access to the data sources and necessary software tools.
- Follow the project structure for organizing the work.
- Refer to individual component documentation for detailed steps and guidelines.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Sonoma County Department of Health Services for providing the inspection data.
- Team members for their contributions to the project.
