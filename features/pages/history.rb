class History < BaseHistory

    def initialize(driver)
        @driver = driver
    end

    def history_list
        @driver.find_element(:id,"history_conversion_list")
      end
    
      def history_single_line
        @driver.find_elements(:id, "history_single_line")
      end
    
      def history_item_names
        @driver.find_elements(:id, "history_item_name")
      end
    
      def history_item_hint
        @driver.find_elements(:id, "history_item_hint")
      end

end

# require './features/modules/base_history'

# class History < BaseHistory

#   def initialize(driver)
#     @driver = driver
#   end

#   def history_sections
#     @driver.find_element(id: 'history_item_name')
#   end

# end 
