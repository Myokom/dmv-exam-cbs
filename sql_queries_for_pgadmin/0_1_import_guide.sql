
--- Importing cleaned data into the databas
--- This assumes a table has been created with the correct schema, in this case "calendar"

COPY calendar --- Table name, change to match the table you want to import to
FROM 'path/to/csv/file.csv'
DELIMITER ','
CSV HEADER
NULL '';


--- Example of path: /Users/tobiasmadsen/Documents/Education/MSc/CBS/Data Management & Visualization/DMV_Exam/DMV_Exam_Code/cleaned_data/cleaned_calendar.csv