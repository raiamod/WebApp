Feature: Registration
    """
        Registration feature will test for successful and failed registration attempts
#    """

    Scenario: Create a new account
        Given I navigate to register page
        And I fill in username, email, password and confirm password fields
        When I click on Sign Up button
        Then Register is successful

    Scenario: Create a new account but the email or username exists
        Given I navigate to register page
        And I enter existing email
        When I click on Sign Up button
        Then Register is unsuccessful

  Scenario: Create a new account but the input fields are blank
		Given I navigate to register page
        And I leave fields blank
		When I click on Sign Up button
        Then Register is unsuccessful