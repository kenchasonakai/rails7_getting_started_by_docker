require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, screen_size: [1080, 1080]
  end

  Capybara.register_driver :remote_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        prefs: {
          'download.default_directory' => DownloadHelper::PATH.to_s
        },
        args: [
          '--headless',
          '--window-size=1400,1400',
          '--no-sandbox',
          '--disable-dev-shm-usage',
          '--lang=ja-JP',
        ],
      }
    )
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: 'http://chromium:4444/wd/hub',
      desired_capabilities: capabilities,
    )

    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 4444
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end