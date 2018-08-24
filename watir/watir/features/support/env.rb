require 'watir'
require 'cucumber'

def browser_name
    (ENV['BROWSER'] ||= 'Safari').downcase.to_sym  # allows me to pass browser as a command line argument
end

def environment
    (ENV['ENVIRONMENT'] ||= 'perfecto').downcase.to_sym  # allows me to set environment for testing as argument. defaults to 'prod'
end

Before do |scenario|
  def assert_it message, &block
    begin
      if (block.call)
        puts "Assertion PASSED for #{message}"
      else
        puts "Assertion FAILED for #{message}"
        fail('Test Failure on assertion')
      end
    rescue => e
      puts "Assertion FAILED for #{message} with exception '#{e}'"
      fail('Test Failure on assertion')
    end
  end
  p "*** Starting #{scenario}"

  if environment == :local
    @browser = Watir::Browser.new browser_name

  elsif environment == :perfecto
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps['platformName'] = 'Windows'
    caps['browserName'] = 'Firefox'
    caps['platformVersion'] = '10'
    caps['browserVersion'] = '61'
    caps['resolution'] = '1280x1024'
    caps['location'] = 'US East'
    caps['securityToken'] = '[Perfecto Token]'
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.open_timeout= 120
    url = "https://beta.perfectomobile.com/nexperience/perfectomobile/wd/hub/fast"

    @browser =  Watir::Browser.new :remote, {desired_capabilities: caps, http_client: client, url: url}



  elsif environment == :prod
    @browser = Watir::Browser.new browser_name
  end
end
After do |scenario|
  if scenario.failed?  # the classic take a screenshot if scenario fails block.
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  @browser.close
end

