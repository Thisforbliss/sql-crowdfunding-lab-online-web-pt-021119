# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

# CREATE TABLE projects (id INTEGER PRIMARY KEY, title TEXT, category TEXT, funding_goal INTEGER, start_date DATE, end_date DATE);

# CREATE TABLE users ( id INTEGER PRIMARY KEY, name TEXT, age INTEGER);

# CREATE TABLE pledges (id INTEGER PRIMARY KEY, amount INTEGER, user_id INTEGER, project_id INTEGER);

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"Select projects.title, SUM(amount) FROM pledges INNER JOIN projects ON pledges.project_id = projects.id GROUP BY projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"SELECT users.name, users.age, SUM(pledges.amount) FROM users INNER JOIN pledges ON users.id = pledges.user_id GROUP BY users.name ORDER BY users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) AS total_amount FROM projects INNER JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.title HAVING total_amount >= 0"
end


def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"SELECT users.name, SUM (pledges.amount) FROM users INNER JOIN pledges WHERE users.id = pledges.user_id GROUP BY users.name ORDER BY SUM(pledges.amount) "
end


def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount FROM projects INNER JOIN pledges WHERE pledges.project_id = projects.id AND projects.category = 'music' "
end


def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT projects.category, SUM(pledges.amount) FROM projects INNER JOIN pledges WHERE pledges.project_id = projects.id AND projects.category = 'books'"
end
