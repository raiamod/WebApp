Feature: Admin Panel
#    """
#        Login feature will test for successful and failed login attempts
#    """

    Scenario: Success test for login
        Given I navigate to login page
        And I enter admin username and password
        When I click on Submit button
        Then I should see the admin panel

    Scenario: Success test for creating new user
        Given I navigate to create new user page
        And I fill in username, email, password
        When I click on Save button
        Then user should be created

    Scenario: Failure test for creating new user
        Given I navigate to create new user page
        And I fill in already existing username or email
        When I click on Save button
        Then user should not be created

    Scenario: Success test for editing user
        Given I click on edit user icon and navigate to the edit user page
        And I fill in modified username, email, password
        When I click on Save button
        Then user information should be updated

    Scenario: Failure test for editing user
        Given I click on edit user icon and navigate to the edit user page
        And I fill in modified username, email which already exists
        When I click on Save button
        Then user information should not be updated

    Scenario: Success test for deleting user
        Given I click on delete icon and navigate to the delete user page
        Then user should be deleted

    Scenario: Failure test for deleting user
        Given I click on delete icon and navigate to the delete user page having no users
        Then message must be displayed showing no user to be deleted

    Scenario: Create new post
        Given I navigate to create new post page
        And I fill in title, date posted, content, author
        When I click on Save button
        Then post should be created

    Scenario: Edit post
        Given I click on edit post icon and navigate to the edit post page
        And I fill in modified title, date posted, content, author
        When I click on Save button
        Then user information should be updated

    Scenario: Success test for deleting post
        Given I click on delete icon and navigate to the delete post page
        Then record should be deleted

    Scenario: Failure test for deleting post
        Given I click on delete icon and navigate to the delete post page having no posts
        Then message must be displayed showing no post to be deleted

    Scenario: Export CSV
        Given I click on exportcsv icon
        Then I should be get a document in csv containing the dashboard stats

    Scenario: Logout
        Given I click on logout icon
        Then I should be logged out
