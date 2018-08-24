 
 
describe('fields Test', function() {
  it('data', function() {

    browser.waitForAngularEnabled(false);
     
    browser.get('http://ec2-34-224-102-1.compute-1.amazonaws.com:8080/a.html');

    browser.findElement(by.id('key1')).sendKeys('aaa');
    browser.findElement(by.id('key2')).sendKeys('aaa');
    browser.findElement(by.id('key3')).sendKeys('aaa');
    browser.findElement(by.id('key4')).sendKeys('aaa');
    browser.findElement(by.id('key5')).sendKeys('aaa');

 });
});
