# Initializes all page object classes
class Pages
  attr_accessor :keyboard, :side_menu, :header_section, :number_screen, :clothing_screen
  attr_accessor :history_screen

  def initialize(driver)
    @keyboard = Keyboard.new(driver)
    @side_menu = SideMenu.new(driver)
    @header_section = HeaderSection.new(driver)
    @number_screen = NumbersScreen.new(driver)
    @clothing_screen = Clothing.new(driver)
    @history_screen = History.new(driver)
  end

end