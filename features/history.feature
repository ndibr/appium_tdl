@history
Feature: As a user I want to check that the previous conversions are being saved

Scenario: Previous conversions are being saved

  When I press on Menu icon
  And I go to History screen
  And I check history
  # Then I click on history element

  # cucumber -t @history DEVICE_NAME=emulator-5554 APPIUM_PORT=4723 SYSTEM_PORT=8201 --format pretty --expand --format html -o emulator.html

