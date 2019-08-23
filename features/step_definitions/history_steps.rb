require './features/support/saved_conversions'

And(/^Save data$/) do
  data = {
  conv_value: @pages.numbers_screen.conversion_section_element.text,
  base_value: @pages.numbers_screen.source_value.text,
  base_name: @pages.numbers_screen.select_unit_spinner[0].text,
  conv_name: @pages.numbers_screen.select_unit_spinner[1].text
  }
  # default = {
  #   conv_value: "X",
  #   base_value: "10",
  #   base_name: "Decimal",
  #   conv_name: "Roman numerals"
  # }
  SavedConversionData::add_to_arr(data)
  p SavedConversionData::get_data_arr
end
  
  # Given (/^I am in the History screen$/) do 
  #   @pages.side_menu.invoke_side_menu_by_swipe
  #   @pages.side_menu.select_category("History")
  #   # @pages.history.menuButton.click
  #   # @pages.history.historyPageButton.click
  # end
  
  # Given I am on the Home screen

  # When I press on Menu icon

  And(/^I check saved to history$/) do

  end

  And(/^I go to History screen$/) do
    @pages.side_menu.select_category_up("History")
  end

  Then(/^I check history$/) do
    #Save data step
    @pages.history_screen.check_history
  end
  And(/^I clear values$/) do
    @pages.keyboard.input_number("C")
  end
  
#  Then(/^I click on history element$/) do
#   item_clicked_name = @pages.history_screen.click_item
#   saved_data = SavedConversionData::get_data_arr
#   item_value = ""
#   saved_data.each do |hash|
#     if item_clicked_name.include?(hash[:base_name]) and item_clicked_name.include?(hash[:conv_name])
#       item_value =  hash[:conv_value]
#       break
#     end
#   end
#   p item_value
#   p @pages.numbers_screen.conversion_section_text
#   p "Values match!" if expect(@pages.numbers_screen.conversion_section_text).to eql item_value
# end

