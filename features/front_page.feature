Feature: Login to the math-lab app

  As a user,
  So that I can sign in to the application,
  I want to get credit by attending the lab.

Background:
Scenario: login to math-lab (happy)
  Given I am on the home page
  When I select "admin" from "rank"
  And I fill in "Name" with "Pena"
  And I fill in "Email" with "penal1@citadel.edu"
  And I fill in "Password" with "qwer"
  And I fill in "Password confirmation" with "qwer"
  And I press "Register"
  And I follow "signout"
  Then I should see "Welcome to Math Lab sign-in!"
  When I fill in "auth_key" with "penal1@citadel.edu"
  And I fill in "password" with "qwer"
  And I press "LOGIN"
  Then I should see "View & Create Accounts"

Scenario: failed login (unhappy)
  Given I am on the home page
  When I select "admin" from "rank"
  When I fill in "Name" with "admin"
  And I fill in "Email" with "admin@admin.com"
  And I fill in "Password" with "admin"
  And I fill in "Password confirmation" with "admin"
  And I press "Register"
  And I follow "signout"
  Then I should see "Welcome to Math Lab sign-in!"
  When I fill in "auth_key" with "admin@admin.com"
  And I fill in "password" with "notmypassword"
  And I press "LOGIN"
  Then I should see "Welcome to Math Lab sign-in!"
