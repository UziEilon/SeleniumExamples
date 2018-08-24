package com.quantum.tests;

import com.qmetry.qaf.automation.ui.WebDriverTestCase;
import com.quantum.utils.moreActions;
import org.openqa.selenium.By;
import org.testng.annotations.Test;

import java.util.concurrent.TimeUnit;

public class apple extends WebDriverTestCase {

    @Test(description="Search", groups={"apple"})
    public void AppleSearch() {
        getDriver().get("http://www.apple.com");
        getDriver().manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
        searchFor("mac book");
       // String results = getDriver().findElement("targetSearchResults").getText();
      //  System.out.println(" **"+results);
        moreActions.scrollPage(getDriver());
        getDriver().takeScreenShot();

    }

    private void searchFor(String value)
    {

        String bname = getDriver().getCapabilities().getBrowserName();
        if (bname.equals("MobileOS"))
       {
           getDriver().findElement(By.xpath("//*[@class=\"ac-gn-menuicon-bread-crust ac-gn-menuicon-bread-crust-bottom\"]")).click();
            getDriver().findElement(By.xpath("(//*[contains(text(),\"apple.com\")])[1]")).click();
           getDriver().findElement(By.xpath("//*[@id=\"ac-gn-searchform-input\"]")).sendKeys(value);
           getDriver().findElement(By.id("ac-gn-searchform-submit")).click();

            moreActions.sleep(500);
        }
       else
       {
           getDriver().findElement(By.id("ac-gn-link-search")).click();
           moreActions.sleep(500);
           getDriver().findElement(By.id("ac-gn-searchform-input")).sendKeys(value);
           getDriver().findElement(By.id("ac-gn-searchform-submit")).click();
        }


         moreActions.sleep(5000);
    }



}