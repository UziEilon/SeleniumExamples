Feature: Amazon Search functionality

Scenario: Users can search for a specific item on Amazon
  Given a user goes to Amazon
  When they search for "pens"
  Then amazon should return results for "pens"

Scenario Outline: Users search for a variety of items
  Given a user goes to Amazon
  When the user looks for <query>
  Then the results returned will display <query>

  Examples:
  |query|
  |laptop|
  |notebook|
