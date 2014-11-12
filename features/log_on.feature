Feature: User can manually log in using their CWID 

	As a student
	So that no one has to read terrible handwriting anymore
	I want to give everyone the proper credit for attending the lab.

Background: Math-Lab Home Page

Scenario: Log in as a student
Given I am on the Math Lab home page

When I fill in "CWID" with 8-digit number

When I press "Sign on"

Then I should be on the Verification Page

And I should see "Name", "Company", "Class", "Professor"

Then I press "Sign on"

And I should see the Timer Page

