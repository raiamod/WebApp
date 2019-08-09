Feature: User Dashboard
    """
        The features that should be present in the user dashboard
    """
Background: User is logged in
  Given User is logged in

    Scenario: Dashboard features
        Given user is on the homepage
        Then user should see all posts
        And user should be able to create a new post
        And user should be able to edit his profile
        And user can logout

      Scenario: Failure test for editing user profile since username already exists
        Given user is on the edit profile page
        And user changes the username to one that already exists
        When user clicks Update
        Then profile must not be updated

    Scenario: Failure test for editing user profile since username is left blank
        Given user is on the edit profile page
        And user leaves username field blank
        When user clicks Update
        Then profile must not be updated
