require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"
require "webdrivers"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

Capybara.configure do |config|
  config.default_driver = :selenium_chrome  #propriedade que define qual navegador será usado
  config.app_host = CONFIG["url"]  #propriedade que define a URL padrão do sistema que será testado.
  config.default_max_wait_time = 10 #Essa configuração faz com que o capybara tenha 10 segundos para encontrar os elementos CSS na página, assim eliminando a função SLEEP.
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
