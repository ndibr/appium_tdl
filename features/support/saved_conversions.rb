class SavedConversionData
  
    @data_array = []
  
    def initialize(data_hash)
  
      data = {
        base_value:  data_hash[:base_value],
        base_name: data_hash[:base_name],
        conv_value: data_hash[:conv_value],
        conv_name: data_hash[:conv_name]
      }
        add_to_arr(data)
    end
  
    def self.add_to_arr(data)
      @data_array << data
    end
  
    def self.get_data_arr
      @data_array
    end
  
  end 

# class SavedConversionData

#   attr_accessor :base_value, :conversion_value

#   def initialize(base_value = nil, conversion_value = nil)
#       @base_value = base_value
#       @conversion_value = conversion_value
#   end
# end