Feature: Amazon Search functionality

Scenario: Users can search for a specific item on Amazon
  Given a user goes to Amazon
  When they search for "pens"
  Then amazon should return results for "pens"
