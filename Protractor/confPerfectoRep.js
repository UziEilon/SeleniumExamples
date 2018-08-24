exports.config = {
  seleniumAddress: 'http://beta.perfectomobile.com/nexperience/perfectomobile/wd/hub/fast',
  

  multiCapabilities: [{
    browserName: 'chrome',
    platformName:'Windows',
    platformVersion:'10',
    browserName:'Firefox',
    browserVersion:'61',
    location:'US East',
    takesScreenshot:true,
    securityToken:"[Perfecxto token]"
  
  }, {
      browserName: 'chrome',
      platformName:'Windows',
      platformVersion:'10',
      browserName:'Firefox',
      browserVersion:'60',
      location:'US East',
      takesScreenshot:true,
      securityToken:"[Perfecxto token]"
    }],

  specs: ['fieldsShort1.js','fieldsShort2.js'],

  //Framework to use. Jasmine is recommended.
  framework: 'jasmine',

   
  // Options to be passed to Jasmine.
  jasmineNodeOpts: {
    showColors: true,	// Use colors in the command line report.	
    defaultTimeoutInterval: 120000	// Time to wait in ms before a test fails. Default value = 30000
  },

  onComplete: function () {
    console.log('On onComplete');
    return reportingClient.getReportUrl().then(
      function (url) {
        console.log(`Report url = ${url}`);
      }
    );
  },

  onPrepare: function () {
    
    console.log('On prep');
    const Reporting = require('perfecto-reporting');
     reportingClient = new Reporting.Perfecto.PerfectoReportingClient(new Reporting.Perfecto.PerfectoExecutionContext({
      webdriver: browser.driver,
      tags: ['js','demo@specs']
    }));
    browser.reportingClient = reportingClient;
    var myReporter = {
      specStarted: function (result) {
        reportingClient.testStart(result.fullName);
      },
      specDone: function (result) {
        if (result.status === 'failed') {
          const failure = result.failedExpectations[result.failedExpectations.length - 1];
          reportingClient.testStop({
            status: Reporting.Constants.results.failed,
            message: `${failure.message} ${failure.stack}`
          });
        } else {
          reportingClient.testStop({
            status: Reporting.Constants.results.passed
          });
        }
      }
    }

    jasmine.getEnv().addReporter(myReporter);
 

  }
}