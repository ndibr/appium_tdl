Given (/^I have selected "(.*)" clothing sizes as (base|conversion)$/) do |measurament, type|
    @pages.clothing_screen.select_conversion(measurament, type)
end

And (/^$/) do ||
    
end
