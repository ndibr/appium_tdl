require './features/modules/base_numbers'
# contains all application's number elements
class NumbersScreen < BaseNumbersScreen

  def initialize(driver)
    @driver = driver
  end



  def type_element(type)
    type_elements = @driver.find_elements(id: 'select_unit_spinner')
    case type
    when 'base'
        type_elements.first
    when 'conversion'
        type_elements.last
    else
        raise 'Unsupported type'
    end
  end


  
  def type_popup_element
    @driver.find_elements(id: 'select_unit_spinner_menu_name')
  end


  
  def conversion_section_element
    @driver.find_element(id: 'target_value')
  end


  def source_value
    @driver.find_element(:id, "source_value")
  end

  def select_unit_spinner
    @driver.find_elements(:id,"select_unit_spinner")
  end


end

# require './features/modules/base_numbers'
# # contains all application's keyboard elements
# class NumbersScreen < BaseNumbersScreen
#   def initialize(driver)
#     @driver = driver
#   end

#   def type_element(type)
#     type_element = @driver.find_elements(id: 'select_unit_spinner')
#     case type
#     when 'base'
#       type_element.first
#     when 'conversion'
#       type_element.last
#     else
#       raise 'Unsupported type'
#     end
#   end

#   def type_popup_elements
#     @driver.find_elements(id: 'select_unit_spinner_menu_name')
#   end

#   def conversion_section_element
#     @driver.find_element(id: 'target_value')
#   end

#   def base_section
#     @driver.find_element(id: 'source_value')
#   end


# end