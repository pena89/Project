Feature: Creating Reports

As an administrator I want to create reports with the database of cadets that are currently in the MathLab

Background:
 Given I am on the homepage
  When I select "admin" from "rank" 
  And I fill in "Name" with "s.livingston" 
  And I fill in "Email" with "email@gmail.com"
  And I fill in "Password" with "citadel"
  And I fill in "Password confirmation" with "citadel"
  And I press "Register"
  And I should see "Reports"
  

Scenario:

I should see "Reports"
When I press "reports"
Then I should see "Export"





