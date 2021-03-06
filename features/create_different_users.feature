Feature: Creating an Account

  As a administrator 
  So that I can populate the website with users
  I want to make a new account for admins and participants

Background:
  Given I am on the homepage
  When I select "admin" from "rank" 
  And I fill in "Name" with "Pena" 
  And I fill in "Email" with "penal1@citadel.edu"
  And I fill in "Password" with "qwer"
  And I fill in "Password confirmation" with "qwer"
  And I press "Register"
  And I follow "View & Create Accounts"
  Then I follow "Create New Accounts"

Scenario: Create an Admin account 
  When I select "admin" from "rank"
  And I fill in "Name" with "Pena"
  And I fill in "Email" with "penal1@citadel.edu"
  And I fill in "Password" with "qwer"
  And I fill in "Password confirmation" with "qwer"
  And I press "Register"
  Then I should see "User created!"
  And I should see "Admin's Profile"

Scenario: Create a Participant account 
  When I select "participant" from "rank"
  And I fill in "Name" with "Participant"
  And I fill in "Email" with "participant@gmail.com"
  And I fill in "Password" with "hihihi"
  And I fill in "Password confirmation" with "hihihi"
  And I press "Register"
  Then I should see "User created!" 

Scenario: Errors appear if forms left blank
  When I select "participant" from "rank"
  When I fill in "Name" with ""
  And I fill in "Email" with ""
  And I press "Register"
  Then I should see "Name can't be blank"
  And I should see "Email is invalid"
