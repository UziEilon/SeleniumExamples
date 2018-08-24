Feature: searching via google search
  Scenario: Testing the search functionality on Google
    Given a user is at Google
    When they enter "cucumber" in the search box
    Then they will get results for "cucumber"

