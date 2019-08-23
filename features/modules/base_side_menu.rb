# contains all actions for SideMenu elements
class BaseSideMenu

  def find_category(name)
    until side_menu_sections_texts.include? name
      last_category = side_menu_sections_texts.last
      MOBILE.swipe('down')
      raise('category not found') if last_category == side_menu_sections_texts.last
    end
  end

  def select_category(name)
    find_category name
    side_menu_sections.each do |section|
      if section.text == name
        section.click
        break
      end
    end
  end

  def select_category_up(name)
    find_category(name)
    side_menu_sections.each do |section|
      if section.text == name
        section.click
        break
      end
    end
  end

  def side_menu_sections_texts
    text = []
    side_menu_sections.each do |section|
      text.push section.text
    end
    text
  end

  def invoke_side_menu_by_swipe
    MOBILE.swipe('right')
  end

end
