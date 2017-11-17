require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.current_driver = :selenium

Capybara.register_driver :selenium do |app|
 Capybara::Selenium::Driver.new(app, browser: :chrome)
end