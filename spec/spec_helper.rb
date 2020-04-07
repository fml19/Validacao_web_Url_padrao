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

  config.before (:example)do
    page.current_window.resize_to(1280, 800)
  end

  config.after(:example) do |e| #
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr('','_') # corrigir caracteres especiais
    page.save_screenshot('log/' + nome + '.png') #salvar print das paginas todas paginas ok
    # page.save_screenshot('log/' + nome + '.png') if e.exception #print da pagina com erro
  end

end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # abrir o chomer
  # config.default_driver = :selenium_chrome_headless # abrir em headles não abre navegador
  config.default_max_wait_time = 90 # tempo máximo de espera
  config.app_host = 'http://training-wheels-protocol.herokuapp.com' #url padrão

end

