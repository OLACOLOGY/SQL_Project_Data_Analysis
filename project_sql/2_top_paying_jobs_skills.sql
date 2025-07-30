-- What skills are required for the top -paying data analyst jobs?
WITH top_paying_job AS (
        SELECT 
            job_id,
            job_title,
            salary_year_avg,
        name AS company_name
        FROM job_postings_fact 
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE
            job_location = 'Anywhere' AND 
            job_title_short = 'Data Analyst' AND
            salary_year_avg IS NOT NULL
        ORDER BY salary_year_avg DESC
        LIMIT 10
)

SELECT 
    top_paying_job.*,
     skills
FROM top_paying_job
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_job.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC

/*
 Summary Insights:
SQL and Python are the most universally required skills in top-paying data roles.

SmartAsset appears multiple times with strong average pay, making it a high-opportunity employer.

Tableau, R, Snowflake, and Excel are also valuable tools across several roles.

High-paying roles often include leadership titles like Director, Principal, or Associate Director.

*/
