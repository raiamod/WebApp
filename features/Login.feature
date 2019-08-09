Feature: Login
#    """
#        Login feature will test for successful and failed login attempts
#    """

    Scenario: Success test for login
        Given I navigate to login page
        And I enter valid email and password
        When I click on Submit button
        Then login is successful

    Scenario: Failure test for login
        Given I navigate to login page
        And I enter invalid email or password
        When I click on Submit button
        Then login fails

    Scenario: Login but the input fields are blank
		Given I navigate to login page
		When I click on Submit button
        Then login fails

    Scenario: Success test for forgot password
		Given I navigate to login page
		When I fill in email that exists
        And I click on Request password reset
        Then reset link must be sent to mail

    Scenario: Failure test for forgot password
		Given I navigate to login page
		When I fill in email that does not exist
        And I click on Request password reset
        Then reset link must not be sent

    Scenario: Success test for Changing password by licking on reset link
		Given I navigate to login page
		When I fill in password and confirm password
        And I click on submit
        Then password must be reset

    Scenario: Failure test for Changing password by licking on reset link
		Given I navigate to login page
		When I fill in password and confirm password that do not match
        And I click on submit
        Then password must not be reset

