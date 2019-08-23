@clothing
Feature: As a user I want to view size comparisons for different clothes

@wip
Scenario Outline: Men's shoes US to Europe
  Given I am in the "Clothing and shoes" screen
  And I have selected "U.S." clothing sizes as base
  And I have selected "Europe" for conversion
  And I have selected "Men's shoes" as clothing type
  Then I see these sizes:
  | base_size | conversion_size |
  |3          |34               |