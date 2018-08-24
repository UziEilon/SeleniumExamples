 
 
describe('fields Test1', function() {
   it('data', function() {

     browser.waitForAngularEnabled(false);
      
     browser.get('http://ec2-34-224-102-1.compute-1.amazonaws.com:8080/a.html');

     browser.findElement(by.id('key1')).sendKeys('bbb');
     browser.findElement(by.id('key2')).sendKeys('bbb');
     browser.findElement(by.id('key3')).sendKeys('bbb');
     browser.findElement(by.id('key4')).sendKeys('bbb');
     browser.findElement(by.id('key5')).sendKeys('bbb');
     
  });

  afterAll(function(done){
    // https://github.com/angular/protractor/issues/1938
    process.nextTick(done); // let all current waiting events to complete
});


});
 