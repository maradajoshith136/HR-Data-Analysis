-- SECTION 3: KPI QUERIES
-- -----------------------------------------------------------
-- KPI 1: Average Attrition Rate for ALL Departments

SELECT Department,
COUNT(*)  AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*), 2
    ) AS attrition_rate_pct
FROM hr_1
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


-- -----------------------------------------------------------
-- 2  Average Hourly Rate of Male Research Scientists
SELECT  
    AVG(HourlyRate) AS Avg_HourlyRate_Male_ResearchScientist
FROM hr_1
WHERE Gender = 'Male' 
  AND JobRole = 'Research Scientist';
 
 -- -----------------------------------------------------------
 -- 3 Total Employees
SELECT COUNT(*) AS Total_Employees FROM hr_1;

-- -----------------------------------------------------------
-- 4 Total Employees by Gender-----------
SELECT Gender, COUNT(*) AS Total_Employees
FROM hr_1
GROUP BY Gender;

-- -----------------------------------------------------------
-- 5 Overall Attrition Rate
SELECT ROUND(AVG(dept_rate), 2) AS avg_attrition_rate_pct
FROM (
    SELECT Department,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS dept_rate
    FROM hr_1
    GROUP BY Department
) dept_rates;


-- -----------------------------------------------------------
-- 7 Environment Satisfaction by Department
SELECT Department, ROUND(AVG(EnvironmentSatisfaction), 2) AS Avg_Env_Satisfaction
FROM hr_1
GROUP BY Department;

-- -----------------------------------------------------------
-- 8 Job Satisfaction by Role
SELECT JobRole, ROUND(AVG(JobSatisfaction), 2) AS Avg_Satisfaction
FROM hr_1
GROUP BY JobRole
ORDER BY Avg_Satisfaction DESC;
-- -----------------------------------------------------------
