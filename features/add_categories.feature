Feature: Add Categories
  As an author
  In order to organize my posts
  I want to add categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Categories blog page shown
    Given I am on the admin page
    When I follow "Categories"
    Then I should be on the new categories page

#  Scenario: Create new category
#  Given I am on the new categories page
#    When I fill in "Name" with "New Cat"
#    When I press "Save"
#    Then I should be on the new categories page
#    And I should see "New Cat"
