Capybara.register_driver :remote_chrome do |app|
  url = "http://chrome:4444/wd/hub"
  options = Selenium::WebDriver::Options.chrome
  # caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
  #   "goog:chromeOptions" => {
  #     "args" => [
  #       "no-sandbox",
  #       "headless",
  #       "disable-gpu",
  #       "window-size=1680,1050"
  #     ]
  #   }
  # )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: options)
end
