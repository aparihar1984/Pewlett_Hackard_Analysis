# Pewlett_Hackard_Analysis

# Overview of the Analysis/Purpose
Using my knowledge of SQL/pgAdmin 4 to help Bobby provide his boss two more deliverables in addition to the tasks already completed in the module.  Determining the number of employees per job title, and identifying employees who are eligible to take part in a mentorship program.  These deliverables will help Bobby's boss/manager prepare for all the upcoming mass retirements as many company employees are reaching retirement age.

# Results
 - The number of employees reaching retirement age by title are shown in the retiring_titles table as seen below:
        Senior Engineer = 29414
        Senior Staff = 28254
        Engineer = 14222
        Staff = 12243
        Technique Leader = 4502
        Assistant Engineer = 1761
        Manager = 2

 - In deliverable 1, the unique_titles table has the most recent job title for each eligible employee.
 - In deliverable 1, the retirement_titles table has all the job titles for each eligible employee, even previous job titles.
 - In deliverable 1, the retirement_titles table has been filtered by time to include only employees who's birth date is between 01-01-1952 and 12-31-1955.
 - In deliverable 2, the mentorship_eligibility table has been filtered by time to include only employees who's birth date is between 01-01-1965 and 12-31-1965.
 - In deliverable 2, the de.to_date = '9999-01-01' code verifies that the eligible mentors are actually still employed with the company.

 PNG picture files for the retirement_titles, unique_titles, retiring_titles, and the mentorship_eligibility tables are in the Queries folder along with the sql files.

 # Summary
Adding the total number of employees reaching retirement age in the retiring_titles table gives 90398 roles needing to be filled by the "silver tsunami".  
Looking at the mentorship_eligibility table shows that there 1549 qualified mentors for the next generation.


