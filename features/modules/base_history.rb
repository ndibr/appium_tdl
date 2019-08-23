require './features/support/saved_conversions'

class BaseHistory

  def check_history
    history_data = parse_rows
    saved_data = SavedConversionData::get_data_arr
    p "History_data: #{history_data}"
    p "Saved_data: #{saved_data}"
    history_data.each do |history_hash|
      saved_data.each do |saved_hash|
        if history_hash[:name].include?(saved_hash[:base_name]) and history_hash[:name].include?(saved_hash[:conv_name])
          p "Your previous conversion is in history!" 
        end
      end
    end
  end

  def parse_rows
    names = history_item_names
    hints = history_item_hint
    iteration = names.length
    j = 0
    history_data = []
    while j < iteration
      history_data << {name: names[j].text, hint: hints[j].text}
      j += 1
    end
    p history_data
    history_data
  end

  def click_item
    items = history_item_names
    p "Items:  #{items}"
    rand_value = Random.rand(0...items.length)
    text = items[rand_value].text
    items[rand_value].click
    p "Rand item: #{text}"
    text
  end

end

