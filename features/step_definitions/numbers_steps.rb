Given(/^I have selected "(.*)" as base number$/) do |string|
  @pages.number_screen.select_base_type(string)
end

And (/^I have selected "(.*)" as the conversion type$/) do |type|
  @pages.number_screen.conversion_type type
  sleep 5
end

And (/^I enter "(.*)" on the keyboard$/) do |number|
  @pages.keyboard.input_number(number)
end

And (/^I see "(.*)" in the conversion section$/) do |number|
  expect(@pages.number_screen.conversion_section_text).to eql number
  step "Save data"
end

And(/^I have "(.*)" as base and "(.*)" type as the converter$/) do |base_type, conversion_type|
  step "I have selected \"#{base_type}\" as base number"
  step "I have selected \"#{conversion_type}\" as the conversion type"
end
