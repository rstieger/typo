Feature: Merge Articles
  As a blog administrator
  In order to avoid redundant articles
  I want to be able to merge two related articles 

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
    | title   | author  | body                      | comment       |
    | First   | admin   | A quick brown fox         | Great article |
    | Second  | joe     | jumps over the lazy dog   | First Post!   |
    And I am on the admin content page
    Then I should see "First"
    And I should see "Second"
    When I am on the home page
    Then I should see "1 comment"

  Scenario: Successfully merge articles
    Given I am editing "First"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with the ID for "Second"
    And I press "Merge"
    Then I should be on the admin content page
    And I should not see "unable to merge"
    And I should see "First"
    And I should not see "Second"
    When I follow "First"
    Then I should see "A quick brown fox"
    And I should see "jumps over the lazy dog"
    When I am on the home page
    Then I should see "2 comment"

  Scenario: Try to merge with article that doesn't exist
    Given I am editing "First"
    When I fill in "merge_with" with "33"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Error, unable to merge, article 33 does not exist"

  Scenario: Try to merge with same article
    Given I am editing "First"
    When I fill in "merge_with" with the ID for "First"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Error, unable to merge with same article"

  Scenario: Logged in as non-admin
    Given I am logged in as non-admin
    And I am editing "Second"
    Then I should see "jumps over the lazy dog"
    And I should not see "Merge"
