-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,
	backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT(b.cf_id), 
	cp.backers_count
FROM backers as b
INNER JOIN campaign as cp
ON cp.cf_id = b.cf_id
WHERE cp.outcome = 'live'
ORDER by backers_count DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT 
	ct.first_name,
	ct.last_name,
	ct.email,
	(cp.goal - cp.pledged) as Remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM campaign as cp
INNER JOIN contacts as ct
ON ct.contact_id = cp.contact_id
WHERE cp.outcome = 'live'
ORDER by remaining_goal_amount DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	cp.company_name,
	cp.description,
	cp.end_date,
	(cp.goal - cp.pledged) as Left_of_goal
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as cp
ON b.cf_id = cp.cf_id
ORDER BY b.email DESC;
	
-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


