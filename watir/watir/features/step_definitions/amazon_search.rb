
Given(/^a user goes to Amazon$/) do
  @browser.goto "http://www.amazon.com"
end

When(/^they search for "([^"]*)"$/) do |arg|
 # @browser.text_field(:id => "twotabsearchtextbox").click
  @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
  @browser.send_keys :return
end

Then(/^amazon should return results for "([^"]*)"$/) do |arg|
  @browser.li(:id => "result_2").wait_until_present
  assert_it ('Verfied Amazon Results') { @browser.text.include? "#{arg}"}
end

When(/^the user looks for (.*)$/) do |query|
  @browser.text_field(:id => "twotabsearchtextbox").set "#{query}"
  @browser.send_keys :return
end

Then(/^the results returned will display (.*)$/) do |query|
  @browser.li(:id => "result_2").wait_until_present
  assert_it ('Verfied Results Display'){@browser.text.include? "#{query}"}
end

Given(/^a user is at Google$/) do
  @browser.goto "http://www.google.com"
end

When(/^they enter "([^"]*)" in the search box$/) do |arg|
  @browser.text_field(:title => "Search").set "#{arg}"
  @browser.send_keys :enter
end

Then(/^they will get results for "([^"]*)"$/) do |arg|
  assert_it ('URL has the correct param') {@browser.url.include? "#{arg}"} #this verifies q=[search term] exists in url
  assert_it ('Cucmber apepars on page results') {@browser.div(:id => "search").text.include? "#{arg}"} #checks search div for exact match on keyword
end