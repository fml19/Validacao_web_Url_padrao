require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
  
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
   
    mocks.verify_partial_doubles = true
  end

 
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  config.before (:example)do #maximizar a tela
    page.current_window.resize_to(1280, 800)
   end

end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # abrir o chomer
  config.default_max_wait_time = 90 # tempo máximo de espera
  config.app_host = 'http://training-wheels-protocol.herokuapp.com' #url padrão

end

