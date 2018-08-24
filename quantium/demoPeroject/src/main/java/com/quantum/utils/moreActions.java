package com.quantum.utils;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.util.HashMap;

public class moreActions {


    public static void type(String t, RemoteWebDriver d) {
        HashMap params = new HashMap();
        params.put("text", String.valueOf(t));

       d.executeScript("mobile:typetext", new Object[]{params});
    }

    public static void scrollPage(RemoteWebDriver d)
    {



        if (isMobile(d))
        {
            HashMap params = new HashMap();
            params.put("start", "50%,50%");
            params.put("end", "50%,20%");
            params.put("duration", "4");

            d.executeScript("mobile:touch:swipe", new Object[]{params});

        }else
        {
            JavascriptExecutor jse = (JavascriptExecutor)d;
            jse.executeScript("window.scrollBy(0,250)", "");
        }



    }
    public static boolean isMobile(RemoteWebDriver d)
    {
        String bname =d.getCapabilities().getBrowserName();
         if (bname.equals("MobileOS"))
         {
             return true;
         }else
         {
             return false;
         }

    }
    public static void sleep(long mili)
    {
        try {
            Thread.sleep(mili);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }


    public static boolean isRotated(RemoteWebDriver d)
    {
        String rc= sendADB("dumpsys input | grep 'SurfaceOrientation' ",d);
      String c= "SurfaceOrientation: 0\n" +
              "SurfaceOrientation: 0\n";

        rc =rc.replace("SurfaceOrientation:","");
        rc=rc.replace("\n", "");
        rc=rc.replace(" ", "");

        if (rc.equals(01))
        {
            return true;
        }else
        {
            return false;

        }

    }

    private static String sendADB(String cmd,RemoteWebDriver d) {
        HashMap params = new HashMap();
        params.put("command", cmd);

        String res= (String)  d.executeScript("mobile:handset:shell", new Object[]{params});
        return res;
    }
}
